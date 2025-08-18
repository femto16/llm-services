pushd mattermost\docker

: .envファイル作成
copy .env.example .env
: ディレクトリの作成
wsl mkdir -p ./volumes/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes}
: postgresqlのデータをvolumes/に保存する場合。Permission deniedの問題があるので現在は未使用
: wsl mkdir -p ./volumes/db/var/lib/postgresql/data

popd