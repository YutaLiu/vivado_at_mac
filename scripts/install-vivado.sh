#!/bin/bash
set -euo pipefail

###############################################################################
# install-vivado.sh — Runs inside the container to install Vivado
###############################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

step()    { echo -e "${CYAN}==> $*${NC}"; }
success() { echo -e "${GREEN}[OK] $*${NC}"; }
error()   { echo -e "${RED}[ERROR] $*${NC}" >&2; }
info()    { echo -e "${CYAN}[INFO] $*${NC}"; }
warn()    { echo -e "${YELLOW}[WARN] $*${NC}"; }

INSTALLER_BIN="/tmp/vivado_installer.bin"
INSTALLER_DIR="/tmp/installer"
VIVADO_SETTINGS="/opt/vam/config/vivado_settings.txt"
AUTH_EXPECT="/opt/vam/scripts/auth_token_gen.exp"

# Verify installer exists
if [ ! -f "$INSTALLER_BIN" ]; then
    error "Installer not found at $INSTALLER_BIN"
    exit 1
fi

if [ ! -f "$VIVADO_SETTINGS" ]; then
    error "Vivado settings not found at $VIVADO_SETTINGS"
    exit 1
fi

# Step 1: Extract installer
# The .bin is mounted read-only, so copy to writable location first
INSTALLER_LOCAL="/tmp/vivado_installer_local.bin"
if [ ! -d "$INSTALLER_DIR" ]; then
    step "Copying installer to writable location..."
    cp "$INSTALLER_BIN" "$INSTALLER_LOCAL"
    chmod +x "$INSTALLER_LOCAL"

    step "Extracting installer..."
    "$INSTALLER_LOCAL" --target "$INSTALLER_DIR" --noexec
    rm -f "$INSTALLER_LOCAL"
    success "Extraction complete."
else
    info "Installer already extracted."
fi

# Step 2: Generate auth token
step "Generating authentication token..."
info "Enter your AMD/Xilinx account credentials when prompted."
echo ""

GENERATED_TOKEN=false

# Try interactive token generation (user types email/password directly)
# This requires a TTY — run `vam install` from a real terminal
if "$INSTALLER_DIR/xsetup" -b AuthTokenGen; then
    GENERATED_TOKEN=true
    success "Auth token generated."
fi

# Fallback: use expect script if interactive method failed
if ! $GENERATED_TOKEN; then
    warn "Direct auth failed. Trying expect-based authentication..."
    info "Please enter your AMD/Xilinx credentials:"

    echo -n "Email: "
    read -r email
    echo -n "Password: "
    read -rs password
    echo ""

    CRED_FILE=$(mktemp /tmp/.vam_credentials.XXXXXX)
    chmod 600 "$CRED_FILE"
    trap 'rm -f "$CRED_FILE"' EXIT
    echo "$email" > "$CRED_FILE"
    echo "$password" >> "$CRED_FILE"

    if [ -f "$AUTH_EXPECT" ]; then
        if expect -f "$AUTH_EXPECT" "$INSTALLER_DIR/xsetup" "$CRED_FILE"; then
            GENERATED_TOKEN=true
            success "Auth token generated."
        else
            error "Authentication failed. Check your credentials."
        fi
    else
        error "Expect script not found."
    fi

    rm -f "$CRED_FILE"
    trap - EXIT
fi

if ! $GENERATED_TOKEN; then
    error "Could not generate authentication token."
    error "Make sure you run 'vam install' from a real terminal (not an IDE)."
    exit 1
fi

# Step 3: Install Vivado
step "Installing Vivado 2025.2 (downloading and installing components)..."
info "Destination: /opt/Xilinx"
echo ""

"$INSTALLER_DIR/xsetup" \
    -c "$VIVADO_SETTINGS" \
    -b Install \
    -a XilinxEULA,3rdPartyEULA

echo ""
success "Vivado installation complete!"

# Cleanup extracted installer to save space
step "Cleaning up installer files..."
rm -rf "$INSTALLER_DIR"
success "Cleanup done."
