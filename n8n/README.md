# n8nのセットアップ
- n8n\setup_n8n.bat を実行
- n8n\launch_n8n.batを実行
- http://localhost:5678 を開く
- アカウントを作成する
## Credential追加
### Mattermost
- トップページ右上の「Create Workflow」の右の「v」から「Create Credential」をクリック
- Mattermost APIを作成
- Access Token は 上で発行した MATTERMOST_BOT_TOKENを、Base URLは http://mattermost:8065 を入力
- 接続チェックが通ることを確認する
### LLM

## ワークフローテスト
- n8n\import_workflow.bat を実行して、workflow_template以下のワークフローをインポートする

### 投稿テスト
- Sample_Post_Message のワークフローを開く
- Post a message ノードの Credential と Channel を設定して保存
- ワークフロー画面に戻り、「Execute Workflow」 をクリック
- Mattermostのテストチャンネルに投稿されることを確認する
### 定期実行テスト
- Sample_Schedule_Trigger のワークフローを開く
- Post a message ノードの Credential と Channel を設定
- トップページに戻り、ワークフローをActiveに切り替える
- 30秒ごとにTest Channelに投稿されるのを確認する
- ワークフローをInactiveに戻す
### webhookテスト
- Mattermostメニュー > システムコンソール > 開発者 > 信頼されていない内部接続を許可する に「n8n」を追加する
    - http://n8n:5678 にPOSTできるようになる
- Mattermostメニュー > 統合機能 > 外向きのウェブフック > 外向きのウェブフックを追加する
- 以下の内容で作成
    - タイトル：テスト
    - 説明：テスト
    - コンテントタイプ：application/json
    - チャンネル：Test Channel
    - トリガーワード：テスト
    - トリガーとなる条件：最初の単語がトリガーワードと正確に一致する
    - コールバックURL：
        - http://n8n:5678/webhook-test/webhook
        - http://n8n:5678/webhook/webhook
- Sample_Webhook のワークフローを開く
- Webhookノードを選択し、Listen for eventをクリック
- MattermostのTest Channelで「テスト こんにちは」という内容で投稿し、Webhookノードが起動するのを確認する
- トップページに戻り、ワークフローをActiveに切り替える
- 再び、Test Channelで「テスト こんにちは」という内容で投稿し、ワークフローが起動するのを確認する


## n8nのバックアップ
- Backup_n8n ワークフローを実行すると、n8n\batkupフォルダにワークフローとCredentialが保存されます

# データの保存場所
## n8n
### 保存場所
WSL側に保存されている \
/var/lib/docker/volumes/docker_n8n-data/_data
### 削除コマンド
wsl docker volume rm docker_n8n-data
