pushd %~dp0docker

: .envファイル作成
copy .env.example .env
: ディレクトリの作成
wsl mkdir -p ./volumes/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes}

popd