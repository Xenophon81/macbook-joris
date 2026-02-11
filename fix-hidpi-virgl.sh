# chmod +x fix-hidpi-virgl.sh
# run with: ./fix-hidpi-virgl.sh

#!/usr/bin/env bash
set -e

echo "=== Checking OpenGL Renderer ==="

if ! command -v glxinfo >/dev/null 2>&1; then
    echo "Installing mesa-utils..."
    sudo apt install -y mesa-utils
fi

RENDERER=$(glxinfo | grep "OpenGL renderer" || true)
echo "$RENDERER"

if echo "$RENDERER" | grep -qi "virgl"; then
    echo "✓ virgl GPU acceleration detected."
else
    echo "⚠ Warning: virgl not detected. You may be using software rendering (llvmpipe)."
fi

echo "=== Setting HiDPI DPI (192) ==="

echo "Xft.dpi: 192" > ~/.Xresources
xrdb -merge ~/.Xresources

xfconf-query -c xsettings -p /Xft/DPI -n -t int -s 192000 2>/dev/null || \
xfconf-query -c xsettings -p /Xft/DPI -s 192000

echo "=== Configuring font rendering ==="

xfconf-query -c xsettings -p /Xft/Antialias -n -t int -s 1 2>/dev/null || \
xfconf-query -c xsettings -p /Xft/Antialias -s 1

xfconf-query -c xsettings -p /Xft/HintStyle -n -t string -s "hintslight" 2>/dev/null || \
xfconf-query -c xsettings -p /Xft/HintStyle -s "hintslight"

xfconf-query -c xsettings -p /Xft/RGBA -n -t string -s "rgb" 2>/dev/null || \
xfconf-query -c xsettings -p /Xft/RGBA -s "rgb"

echo "=== Restarting XFCE panel and compositor ==="

xfce4-panel -r || true
pkill xfwm4 || true
xfwm4 --replace &

echo "=== Done ==="
echo "Log out and back in for best results."
