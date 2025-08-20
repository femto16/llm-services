pushd docker

: encryption keyの生成
for /f %%i in ('wsl openssl rand -hex 32') do (
    echo N8N_ENCRYPTION_KEY=%%i > .env
)

popd