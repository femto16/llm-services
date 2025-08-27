pushd %~dp0

for %%f in (workflow_template\*.json) do (
    wsl docker exec -u node -it n8n n8n import:workflow --input=/home/node/.n8n/workflow_template/%%~nxf
)

popd