#!/bin/bash

###############################################################################
# start-gui.sh — Runs inside the container for GUI mode (noVNC)
###############################################################################

# Find Vivado installation
V_DIR=$(ls -d /opt/Xilinx/*/Vivado /opt/Xilinx/Vivado/* 2>/dev/null | head -n 1)

if [ -z "$V_DIR" ] || [ ! -d "$V_DIR" ]; then
    echo "ERROR: Vivado installation not found in /opt/Xilinx"
    exit 1
fi

# Cleanup all background processes on exit
cleanup() {
    echo "Shutting down..."
    kill $(jobs -p) 2>/dev/null
    exit 0
}
trap cleanup INT TERM EXIT

# Start virtual display (1920x1080, 24-bit color)
Xvfb :1 -screen 0 1600x900x24 &
export DISPLAY=:1
sleep 1

# Window manager
openbox &

# VNC server on display :1
x11vnc -display :1 -nopw -listen 0.0.0.0 -xkb -forever -quiet &

# noVNC web interface: browser connects here
websockify --web /usr/share/novnc/ --wrap-mode=ignore 6080 localhost:5900 &

# Start Vivado hardware server with XVC auto-connect
# (connects to openFPGALoader XVC server on Mac host)
$V_DIR/bin/hw_server -e "set auto-open-servers xilinx-xvc:host.docker.internal:3721" &

# Source Vivado environment
source "$V_DIR/settings64.sh"

echo ""
echo "========================================="
echo "  Vivado GUI starting..."
echo "  Open browser: http://localhost:6080"
echo "========================================="
echo ""

# Launch Vivado GUI (foreground — container exits when Vivado closes)
$V_DIR/bin/vivado -nolog -nojournal
