#!/bin/bash
set -e

###############################################################################
# start-gui.sh — Runs inside the container for GUI mode (noVNC)
###############################################################################

# Find Vivado installation
V_DIR=$(ls -d /opt/Xilinx/*/Vivado /opt/Xilinx/Vivado/* 2>/dev/null | head -n 1)

if [ -z "$V_DIR" ] || [ ! -d "$V_DIR" ]; then
    echo "ERROR: Vivado installation not found in /opt/Xilinx"
    exit 1
fi

# Track background PIDs for cleanup
XVFB_PID="" OB_PID="" VNC_PID="" NOVNC_PID="" HW_PID=""
_CLEANUP_DONE=0

cleanup() {
    [ "$_CLEANUP_DONE" -eq 1 ] && return
    _CLEANUP_DONE=1
    echo "Shutting down..."
    for pid in $HW_PID $NOVNC_PID $VNC_PID $OB_PID $XVFB_PID; do
        if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
            kill "$pid" 2>/dev/null || true
        fi
    done
}
trap cleanup INT TERM EXIT

# Start virtual display (1600x900, 24-bit color)
Xvfb :1 -screen 0 1600x900x24 &
XVFB_PID=$!
export DISPLAY=:1

# Wait for Xvfb to be ready
for i in $(seq 1 20); do
    xdpyinfo -display :1 >/dev/null 2>&1 && break
    sleep 0.5
done
if ! xdpyinfo -display :1 >/dev/null 2>&1; then
    echo "ERROR: Xvfb failed to start"
    exit 1
fi

# Window manager
openbox &
OB_PID=$!

# VNC server on display :1 (listen on localhost only)
x11vnc -display :1 -nopw -listen localhost -xkb -forever -quiet &
VNC_PID=$!

# noVNC web interface: browser connects here
websockify --web /usr/share/novnc/ --wrap-mode=ignore 6080 localhost:5900 &
NOVNC_PID=$!

# Start Vivado hardware server with XVC auto-connect
# (connects to openFPGALoader XVC server on Mac host)
$V_DIR/bin/hw_server -e "set auto-open-servers xilinx-xvc:host.docker.internal:3721" &
HW_PID=$!

# Source Vivado environment
source "$V_DIR/settings64.sh"

echo ""
echo "========================================="
echo "  Vivado GUI starting..."
echo "  Open browser: http://localhost:6080"
echo "========================================="
echo ""

# Auto-detect .xpr project file in /workspace
XPR_FILE=$(find /workspace -maxdepth 1 -name "*.xpr" 2>/dev/null | head -n 1)

# Launch Vivado GUI (foreground — container exits when Vivado closes)
if [ -n "$XPR_FILE" ]; then
    echo "  Opening project: $XPR_FILE"
    echo ""
    $V_DIR/bin/vivado "$XPR_FILE" -nolog -nojournal
else
    $V_DIR/bin/vivado -nolog -nojournal
fi
