@echo off
chcp 65001 >nul
cd /d "%~dp0"
set PORT=8765

rem 优先使用 Python 启动本地静态服务；未安装 Python 时直接打开本地文件
where python >nul 2>nul
if errorlevel 1 (
  echo 未检测到 Python，直接用浏览器打开 index.html
  start "" "index.html"
  exit /b
)

start "VIA 本地服务器" cmd /c "python -m http.server %PORT%"
timeout /t 2 >nul
start "" "http://localhost:%PORT%/index.html"
