# vivado_at_mac

Run Xilinx Vivado on macOS (Apple Silicon) with a single command.

> Build bitstreams, program FPGAs, and access Vivado GUI — all from your Mac.

## Why?

Existing solutions (like vivado-mac) require 3 terminals, XQuartz setup, and manual GUI operations.
**vivado_at_mac** gives you one CLI tool (`vam`) that handles everything.

| | Traditional | vivado_at_mac |
|---|---|---|
| Build bitstream | Open GUI, click through menus | `vam build` |
| Program FPGA | 3 terminals + XVC + container | `vam program` |
| Open GUI | XQuartz + X11 auth + container | `vam gui` (browser) |
| Install | Multi-step + drag & drop | `vam install <path>` |

## Architecture

```
Mac (Apple Silicon)
├── vam CLI (shell script)
├── VS Code (edit .v / .sv files)
├── openFPGALoader (native ARM64, programs FPGAs)
├── Browser (Vivado GUI via noVNC)
└── OrbStack (container runtime)
    └── Container (x86_64 via Rosetta 2)
        ├── Vivado 2025.2 (batch mode or GUI)
        └── mount: your project ↔ /workspace
```

**Key principle:** Your code and build outputs live on your Mac. The container is disposable.

## Prerequisites

1. **macOS** (Apple Silicon — M1/M2/M3/M4)

2. **OrbStack** (container runtime, faster and lighter than Docker Desktop)
   ```bash
   brew install --cask orbstack
   ```

3. **openFPGALoader** (for FPGA programming)
   ```bash
   brew install openfpgaloader
   brew install libusb libftdi hidapi
   ```

4. **Vivado 2025.2 Linux installer**
   - Download from [AMD/Xilinx](https://www.xilinx.com/support/download.html)
   - Get the `.bin` file (FPGAs & Adaptive SoCs Unified Installer for Linux)

## Installation

```bash
git clone <repo-url> vivado_at_mac
cd vivado_at_mac

# Install Vivado (provide path to the .bin file you downloaded)
./vam install /path/to/FPGAs_AdaptiveSoCs_Unified_SDI_2025.2_xxxx_Lin64.bin
```

This will:
1. Check prerequisites (OrbStack, dependencies)
2. Build the Docker image from the included Dockerfile
3. Install Vivado 2025.2 to `~/.vivado_at_mac/Xilinx/` (~40GB)
4. Verify installation

> **Note:** Requires a free [AMD/Xilinx account](https://www.xilinx.com/registration/create-account.html). You will be prompted to log in during installation.

Installation takes 30-60 minutes depending on your machine.

## Quick Start (Blinky Example)

```bash
# 1. Clone and install Vivado (one-time, ~40 min)
git clone git@github.com:YutaLiu/vivado_at_mac.git
cd vivado_at_mac
./vam install ~/Downloads/FPGAs_AdaptiveSoCs_Unified_SDI_2025.2_xxxx_Lin64.bin

# 2. Build the blinky example (generates bitstream)
./vam build ./examples/blinky/

# 3. Program the FPGA (connect Basys3 via USB first)
./vam program ./examples/blinky/

# 4. Or open Vivado GUI in your browser
./vam gui ./examples/blinky/
# → opens http://localhost:6080 automatically
```

> **Tip:** Add `vam` to your PATH for easier access:
> ```bash
> echo 'export PATH="$PATH:/path/to/vivado_at_mac"' >> ~/.zshrc
> ```

## Creating a New Project

```bash
# 1. Create project directory on Mac
mkdir -p ~/my_fpga_project/src ~/my_fpga_project/constraints

# 2. Create fpga.yml
cat > ~/my_fpga_project/fpga.yml << 'EOF'
project: my_project
part: xc7a35tcpg236-1
top: top
sources:
  - src/*.v
constraints:
  - constraints/board.xdc
board: basys3
EOF

# 3. Write your Verilog and constraints
vim ~/my_fpga_project/src/top.v
vim ~/my_fpga_project/constraints/board.xdc

# 4. Build bitstream
vam build ~/my_fpga_project/

# 5. Open Vivado GUI (optional)
vam gui ~/my_fpga_project/
```

### Mac ↔ Container Path Mapping

Your project directory is mounted into the container automatically:

```
Mac                                     Container
────────────────────────────────────    ──────────────────
~/my_fpga_project/                  →  /workspace/
~/my_fpga_project/src/top.v         →  /workspace/src/top.v
~/my_fpga_project/constraints/      →  /workspace/constraints/
~/my_fpga_project/build/top.bit     ←  /workspace/build/top.bit
```

All files are shared in real-time (mount, not copy). Edit on Mac, build in
container, results appear on Mac instantly.

### GUI Mode with .xpr Project

For Vivado GUI, you can optionally create a `.xpr` project file:

```bash
# Copy the template script to your project
cp /path/to/vivado_at_mac/examples/blinky/create_project.tcl ~/my_fpga_project/
# Edit project_name, part, top to match your fpga.yml

# Generate .xpr (one-time)
vam build  # or run create_project.tcl via docker run

# Open GUI — .xpr loads automatically
vam gui ~/my_fpga_project/
```

Without `.xpr`, `vam gui` opens a blank Vivado where you can manually open files
from `/workspace/`. With `.xpr`, the project loads automatically with all sources
and constraints ready.

## Usage

### Build Bitstream

```bash
# From your project directory (must contain fpga.yml)
vam build

# Or specify a project path
vam build ./my_project/
```

Output appears in your project's `build/` directory:
```
my_project/
├── fpga.yml
├── src/
│   └── top.v
├── constraints/
│   └── basys3.xdc
└── build/                    ← generated
    ├── top.bit               ← bitstream
    ├── post_synth.dcp        ← synthesis checkpoint
    ├── post_route.dcp        ← route checkpoint
    ├── utilization.rpt       ← resource usage report
    ├── timing.rpt            ← timing analysis report
    └── power.rpt             ← power analysis report
```

### Program FPGA

```bash
# Auto-detect from fpga.yml
vam program

# Or specify bitstream and board
vam program ./build/top.bit --board basys3
```

Supported boards (via openFPGALoader): Basys3, Nexys A7, Arty, and
[200+ more](https://trabucayre.github.io/openFPGALoader/compatibility/fpga.html)
across Xilinx, Lattice, Intel, Gowin, and other vendors.

### Open Vivado GUI (in browser)

```bash
vam gui

# Or with a specific project
vam gui ./my_project/
```

Opens `http://localhost:6080` in your default browser. Vivado runs inside the
container with noVNC — no XQuartz or VNC client needed.

If a `.xpr` project file exists in the project directory, Vivado will
automatically open it. To create one from `fpga.yml`:

```bash
# Generate .xpr project (one-time)
docker run --init --rm --platform linux/amd64 \
  -v "$(pwd)/examples/blinky":/workspace \
  -v ~/.vivado_at_mac/Xilinx:/opt/Xilinx:ro \
  -v ~/.vivado_at_mac/.Xilinx:/home/user/.Xilinx \
  vivado_at_mac:latest bash -c '
    V_DIR=$(ls -d /opt/Xilinx/*/Vivado /opt/Xilinx/Vivado/* 2>/dev/null | head -n 1)
    source "$V_DIR/settings64.sh"
    vivado -mode batch -source /workspace/create_project.tcl -nolog -nojournal'

# Then open GUI — project loads automatically
vam gui ./examples/blinky/
```

**Workflow:** Edit `.v` files on Mac → Vivado GUI compiles in browser →
bitstream appears on Mac at `build/`.

When running in GUI mode with an FPGA board connected and `board:` set in
`fpga.yml`, XVC bridge starts automatically so you can program directly from
Vivado's Hardware Manager.

Press `Ctrl+C` to stop the GUI session.

### Other Commands

```bash
vam status      # Show Vivado installation and container status
vam clean       # Remove build/ directory from current project
vam uninstall   # Remove Vivado installation (~40GB)
```

## Project Configuration (fpga.yml)

Every FPGA project needs one `fpga.yml` file at its root:

```yaml
# Project metadata
project: blinky
part: xc7a35tcpg236-1
top: blinky

# Source files (glob patterns supported)
sources:
  - src/*.v
  - src/*.sv

# Constraint files
constraints:
  - constraints/basys3.xdc

# Board for programming (openFPGALoader board name)
board: basys3
```

### Common Part Numbers

| Board | Part |
|---|---|
| Basys3 | `xc7a35tcpg236-1` |
| Nexys A7-100T | `xc7a100tcsg324-1` |
| Arty A7-35T | `xc7a35ticsg324-1L` |
| Arty A7-100T | `xc7a100tcsg324-1` |
| Zybo Z7-20 | `xc7z020clg400-1` |

## File Structure

```
vivado_at_mac/
├── vam                            # Main CLI (shell script)
├── Dockerfile                     # Container image definition
├── scripts/
│   ├── install-vivado.sh          # Vivado installation (runs in container)
│   ├── start-gui.sh              # GUI environment startup (runs in container)
│   └── templates/
│       └── build.tcl.tpl         # TCL build script template
├── config/
│   └── vivado_settings.txt        # Vivado installation config (2025.2)
├── examples/
│   └── blinky/                    # Example project
│       ├── fpga.yml
│       ├── create_project.tcl     # Generate .xpr for GUI mode
│       ├── src/
│       │   └── blinky.v
│       └── constraints/
│           └── basys3.xdc
└── README.md
```

### Persistent Data (on your Mac)

```
~/.vivado_at_mac/
├── Xilinx/                        # Vivado installation (~40GB)
│   └── 2025.2/
└── .Xilinx/                       # Vivado config & cache
```

## How It Works

### Build Mode
1. `vam build` reads `fpga.yml` from your project
2. Generates a TCL script from template
3. Starts a disposable container (OrbStack + Rosetta 2)
4. Mounts your project at `/workspace` and Vivado at `/opt/Xilinx`
5. Runs `vivado -mode batch -source build.tcl`
6. Bitstream and reports appear in `./build/`
7. Container is automatically removed

### GUI Mode
1. `vam gui` starts a persistent container
2. Launches Xvfb (virtual display) + openbox (window manager)
3. Starts x11vnc + noVNC on port 6080
4. If FPGA board detected, starts openFPGALoader as XVC server
5. Launches Vivado GUI with hw_server connected to XVC
6. Opens browser to `http://localhost:6080`
7. `Ctrl+C` stops everything cleanly

### Programming
1. `vam program` runs openFPGALoader **natively on Mac** (no container)
2. Reads board name from `fpga.yml` (or `--board` flag)
3. Programs FPGA directly via USB

## Troubleshooting

### OrbStack not found
```
brew install --cask orbstack
```

### Build fails with memory error
OrbStack > Settings > Resources > increase memory limit to at least 8GB.

### Browser shows blank screen on `vam gui`
Wait a few seconds for Vivado to start. It can take 10-30 seconds on first launch.

### openFPGALoader can't find board
Check USB connection:
```bash
openFPGALoader --detect
```

### Slow build performance
Ensure OrbStack is using Rosetta 2 (not QEMU):
OrbStack > Settings > check "Use Rosetta"

## Uninstall

```bash
# Remove Vivado installation (~40GB) and Docker image
vam uninstall

# Remove this repo
rm -rf vivado_at_mac/
```

## License

BSD 3-Clause License
