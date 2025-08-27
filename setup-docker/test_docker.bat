pushd %~dp0

: hello-worldコンテナ起動テスト

: docker compose error getting credentials のエラーで初回は失敗する場合がある(未解決)
: 失敗したらもう一度実行する
wsl docker compose up

: コンテナとイメージを削除
wsl docker rm hello-world
wsl docker rmi hello-world

popd