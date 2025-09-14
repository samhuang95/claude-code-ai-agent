#!/bin/bash

# 隨機語音通知腳本
# 用於 Claude Code hook 觸發

# 定義通知訊息陣列
notifications=(
    "主人，請確認一下"
    "帥哥，需要你看一下"
    "老闆，該你出場了"
    "主人，輪到你了"
    "大神，請指示"
    "老大，等你確認"
    "Boss，請過目"
    "主人，有事找你"
    "帥哥，麻煩確認"
    "老闆，請檢查"
)

# 隨機選擇一個通知訊息
random_index=$((RANDOM % ${#notifications[@]}))
selected_message="${notifications[$random_index]}"

# 使用 PowerShell 的 say 功能 (Windows)
if command -v powershell &> /dev/null; then
    powershell -Command "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('$selected_message')"
# 使用 say 命令 (macOS)
elif command -v say &> /dev/null; then
    say "$selected_message"
# 使用 espeak (Linux)
elif command -v espeak &> /dev/null; then
    espeak "$selected_message"
else
    # 如果沒有語音合成工具，就發出系統聲音
    echo -e "\a"
    echo "$selected_message"
fi