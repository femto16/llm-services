@echo off

wsl --status >nul 2>&1
if %errorlevel% equ 0 (
    echo WSLは既にインストールされています。
    exit /b 0
)

wsl --install