pushd %~dp0

curl "http://localhost:1234/api/v0/chat/completions" -H "Content-Type: application/json" --data-binary @request.json

popd