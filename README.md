# LLM-Services
LLMのbot環境を作成するサービス郡です。

- Mattermost
    - 通知、チャット、n8nなどのトリガー実行用プラットフォームとして利用
- n8n
    - ワークフローのトリガー実行、定期実行を行う

# dockerのセットアップ
- WSLのインストール
- docker環境の作成



# Mattermostのセットアップ
- setup_mattermost.batを実行
- launch_mattermost.batを実行
- http://localhost:8065 を開く
- アカウントを作成する
- 組織を作成する
- 「どんなツールを使っていますか?」はスキップ

## チャンネル作成
- チャンネルを追加する > 新しいチャンネルを作成する
- チャンネル名を入力（ここでは「Test Channel」とする）して、公開チャンネルで作成

## Botアカウントセットアップ & トークン発行
- Mattermostページ左上のメニュー > 統合機能 > Botアカウント
- system-botの「新しいトークンを生成する」をクリックし、トークンを生成
- トークンはメモしておく
- system-botのロールをシステム管理者に変更する
- チームページへ戻り、「メンバーを招待する」から「@system-bot」をチームに招待する



# n8nのセットアップ
- setup_n8n.batを実行
- launch_n8n.batを実行
- http://localhost:5678 を開く
- アカウントを作成する
## Credential追加
- トップページ「Credentials」を選択
### Mattermost
- Mattermost APIを作成
- Access Token は 上で発行した MATTERMOST_BOT_TOKENを、Base URLは http://mattermost:8065 を入力
- 接続チェックが通ることを確認する

## ワークフローテスト
### 投稿テスト
- トップページ右上の「Create Workflow」をクリック
- 右上の「...」 > 「Import from File...」をクリック
- n8n\workflow_template\SamplePost.json を選択してインポート
- Post a message ノードの Credential と Channel を設定
- ワークフロー画面に戻り、「Execute Workflow」 をクリック
- Mattermostのテストチャンネルに投稿されることを確認する
- ワークフロー画面左上のワークフロー名(My workflow)を「SamplePost」に変更して保存
### 定期投稿テスト
- n8n\workflow_template\SampleSchedule.json をインポート
- Post a message ノードの Credential と Channel を設定
- ワークフロー名「SampleSchedule」で保存
- トップページに戻り、「SampleSchedule」ワークフローをActiveに切り替える
- 30秒ごとにTest Channelに投稿されるのを確認する
### webhookテスト
- Mattermostメニュー > システムコンソール > 開発者 > 信頼されていない内部接続を許可する に「n8n」を追加する
    - http://n8n:5678にPOSTできるようになる
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
- n8n\workflow_template\SampleWebhook.json をインポート
- Webhookノードを選択し、Listen for eventをクリック
- MattermostのTest Channelで「テスト こんにちは」という内容で投稿し、Webhookノードが起動するのを確認する
- ワークフロー名「SampleWebhook」で保存
- トップページに戻り、「SampleWebhook」ワークフローをActiveに切り替える
- 再び、Test Channelで「テスト こんにちは」という内容で投稿し、ワークフローが起動するのを確認する

## APIキー発行(任意)
- 左下のアカウントメニュー > n8n API > Create an API Key
- Labelは「test」、Expirationは「No Expiration」で発行
- python-setting-scripts\.env の N8N_API_KEY にAPI Keyを貼り付ける


# データの保存場所
## Mattermost
WSL側に保存されている
- /var/lib/docker/volumes/docker_mattermost-bleve-indexes
- /var/lib/docker/volumes/docker_mattermost-client-plugins
- /var/lib/docker/volumes/docker_mattermost-config
- /var/lib/docker/volumes/docker_mattermost-data
- /var/lib/docker/volumes/docker_mattermost-logs
- /var/lib/docker/volumes/docker_mattermost-plugins
### 削除コマンド
wsl docker volume rm docker_mattermost-bleve-indexes docker_mattermost-client-plugins docker_mattermost-config docker_mattermost-data docker_mattermost-logs docker_mattermost-plugins

## postgresql
### 保存場所
WSL側に保存されている \
/var/lib/docker/volumes/docker_postgresql-data/_data
### 削除コマンド
wsl docker volume rm docker_postgresql-data

## n8n
### 保存場所
n8n/docker/.n8n
### 削除コマンド
rmdir n8n/docker/.n8n
