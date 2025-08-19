# mattermost-n8n-bot

- WSLのインストール
- docker環境の作成

# n8nのセットアップ
- setup_n8n.batを実行
- launch_n8n.batを実行
- http://localhost:5678 を開く
- アカウントを作成する

# Mattermostのセットアップ
- setup_mattermost.batを実行
- launch_mattermost.batを実行
- http://localhost:8065 を開く
- アカウントを作成する
- 組織を作成する
- 「どんなツールを使っていますか?」はスキップ
- websocket周りのエラーを解消
    - 左上のメニュー → システムコンソール → CORS → Enable cross-origin requests from: に「*」を入力して保存

# データの保存場所
## Mattermost
mattermost/docker/volumes/app
### 削除コマンド
rmdir mattermost/docker/volumes/app

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
