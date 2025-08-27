# Mattermostのセットアップ
- mattermost\setup_mattermost.bat を実行
- mattermost\launch_mattermost.bat を実行
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


# データの保存場所
## Mattermost
### 保存場所
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