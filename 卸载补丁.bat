@echo off
chcp 65001 >nul
title Clash Mi Bing Rule Fix - Uninstall

echo ==========================================
echo   Clash Mi Bing 规则修复补丁 - 卸载说明
echo ==========================================
echo.
echo 本补丁不会直接修改 Clash Mi 内部配置数据库。
echo 因此“卸载”只需要在 Clash Mi 中删除/停用对应的 JS 覆写。
echo.
echo 操作：
echo   核心设置 ^> 覆写
echo   找到你创建的 Bing 修复 JS 覆写
echo   停用或删除
echo.
echo 本目录中的脚本文件可以直接删除，不会影响订阅。
echo.
pause
