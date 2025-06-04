#!/bin/bash
# 设置 Wine 沙盒路径
export WINEPREFIX="$PWD/wineprefix"
# export WINEDEBUG=-all  # 可选，禁用 Wine 日志

# 自动创建 Wine 沙盒（如果不存在）
if [ ! -d "$WINEPREFIX" ]; then
    echo "初始化 Wine 沙盒..."
    wineboot
fi

# 自动映射串口（COM1）到 /dev/ttyUSB0
mkdir -p "$WINEPREFIX/dosdevices"
ln -sf /dev/ttyUSB0 "$WINEPREFIX/dosdevices/com1"

# 启动程序
cp "$PWD/BurnTool" "$WINEPREFIX/drive_c/BurnTool" -r

wine "C:\\BurnTool\\BurnTool.exe" "$@"