@echo off
chcp 65001 >nul
setlocal

title Clash Mi Bing Rule Fix

echo ==========================================
echo   Clash Mi Bing 规则修复补丁
echo ==========================================
echo.
echo 本程序不会修改你的订阅 YAML，也不会读取账号、Token 或订阅地址。
echo 它只负责准备 bing-rule-fix.js，供 Clash Mi 的 JS 覆写使用。
echo.

set "SCRIPT=%~dp0bing-rule-fix.js"

if not exist "%SCRIPT%" (
    echo [错误] 找不到 bing-rule-fix.js
    pause
    exit /b 1
)

echo [1/3] 已找到补丁脚本：
echo       %SCRIPT%
echo.

echo [2/3] 正在复制脚本内容到剪贴板...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Content -Raw -LiteralPath '%SCRIPT%' | Set-Clipboard"
if errorlevel 1 (
    echo [提示] 自动复制到剪贴板失败，但不影响使用。
) else (
    echo       已复制完成。
)
echo.

echo [3/3] 打开补丁文件所在目录...
start "" explorer.exe /select,"%SCRIPT%"
echo.

echo 接下来请在 Clash Mi 中：
echo.
echo   核心设置 ^> 覆写 ^> 添加覆写
echo   类型选择：JS
echo   将 bing-rule-fix.js 导入/粘贴进去
echo   追加覆写选择：内置-覆写
echo   保存并启用该 JS 覆写
echo.
echo 如果当前版本支持直接导入本地 JS 文件，优先选择本目录中的：
echo   bing-rule-fix.js
echo.
echo 验证方法：
echo   浏览器打开 https://cn.bing.com
echo   或在 Clash Mi 网络测试中检查 HTTP 200
echo.
echo 详细说明请查看 README.md
echo.
pause
