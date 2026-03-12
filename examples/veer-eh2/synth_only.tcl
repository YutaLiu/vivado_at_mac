# synth_only.tcl — VeeR EH2 synthesis-only (skip implementation/bitstream)
# Run via: vivado -mode batch -source synth_only.tcl

set part "xc7a200tffg1156-1"
set top  "eh2_veer_wrapper"
set outDir "/workspace/build"
set designDir "/workspace/design"
set snapDir "/workspace/snapshots/default"

file mkdir $outDir

# Include paths for VeeR EH2 generated config and design headers
set_property verilog_define "RV_FPGA_OPTIMIZE" [current_fileset]

# Read all design sources (SystemVerilog)
set sv_files [list \
    $designDir/include/eh2_def.sv \
    $designDir/eh2_veer_wrapper.sv \
    $designDir/eh2_mem.sv \
    $designDir/eh2_pic_ctrl.sv \
    $designDir/eh2_veer.sv \
    $designDir/eh2_dma_ctrl.sv \
    $designDir/ifu/eh2_ifu_aln_ctl.sv \
    $designDir/ifu/eh2_ifu_compress_ctl.sv \
    $designDir/ifu/eh2_ifu_ifc_ctl.sv \
    $designDir/ifu/eh2_ifu_bp_ctl.sv \
    $designDir/ifu/eh2_ifu_ic_mem.sv \
    $designDir/ifu/eh2_ifu_mem_ctl.sv \
    $designDir/ifu/eh2_ifu_iccm_mem.sv \
    $designDir/ifu/eh2_ifu_btb_mem.sv \
    $designDir/ifu/eh2_ifu.sv \
    $designDir/dec/eh2_dec_decode_ctl.sv \
    $designDir/dec/eh2_dec_gpr_ctl.sv \
    $designDir/dec/eh2_dec_ib_ctl.sv \
    $designDir/dec/eh2_dec_tlu_ctl.sv \
    $designDir/dec/eh2_dec_tlu_top.sv \
    $designDir/dec/eh2_dec_csr.sv \
    $designDir/dec/eh2_dec_trigger.sv \
    $designDir/dec/eh2_dec.sv \
    $designDir/exu/eh2_exu_alu_ctl.sv \
    $designDir/exu/eh2_exu_mul_ctl.sv \
    $designDir/exu/eh2_exu_div_ctl.sv \
    $designDir/exu/eh2_exu.sv \
    $designDir/lsu/eh2_lsu.sv \
    $designDir/lsu/eh2_lsu_clkdomain.sv \
    $designDir/lsu/eh2_lsu_addrcheck.sv \
    $designDir/lsu/eh2_lsu_lsc_ctl.sv \
    $designDir/lsu/eh2_lsu_stbuf.sv \
    $designDir/lsu/eh2_lsu_bus_buffer.sv \
    $designDir/lsu/eh2_lsu_bus_intf.sv \
    $designDir/lsu/eh2_lsu_ecc.sv \
    $designDir/lsu/eh2_lsu_dccm_mem.sv \
    $designDir/lsu/eh2_lsu_dccm_ctl.sv \
    $designDir/lsu/eh2_lsu_trigger.sv \
    $designDir/lsu/eh2_lsu_amo.sv \
    $designDir/dbg/eh2_dbg.sv \
    $designDir/lib/eh2_lib.sv \
    $designDir/lib/beh_lib.sv \
    $designDir/lib/mem_lib.sv \
    $designDir/lib/ahb_to_axi4.sv \
    $designDir/lib/axi4_to_ahb.sv \
]

# Read Verilog files (DMI is plain Verilog)
set v_files [list \
    $designDir/dmi/dmi_wrapper.v \
    $designDir/dmi/dmi_jtag_to_core_sync.v \
    $designDir/dmi/rvjtag_tap.v \
]

# Set include directories
set incl_dirs [list \
    $designDir/include \
    $snapDir \
]

# Read config defines and parameter type as global includes
# common_defines.vh: macros (TEC_RV_ICG, etc.) available to all files
# eh2_pdef.vh: defines eh2_param_t typedef needed by all modules
read_verilog -sv $snapDir/common_defines.vh
read_verilog -sv $snapDir/eh2_pdef.vh
set_property is_global_include true [get_files common_defines.vh]
set_property is_global_include true [get_files eh2_pdef.vh]

# Read SystemVerilog sources
read_verilog -sv $sv_files

# Read DMI files (use -sv flag: these .v files contain SystemVerilog syntax like '0)
read_verilog -sv $v_files

# Set include dirs for synthesis
set_property include_dirs $incl_dirs [current_fileset]

# Synthesis only
puts "==> Starting VeeR EH2 synthesis..."
synth_design -top $top -part $part \
    -include_dirs $incl_dirs \
    -verilog_define RV_FPGA_OPTIMIZE
write_checkpoint -force $outDir/post_synth.dcp
report_utilization -file $outDir/utilization.rpt
report_timing_summary -file $outDir/timing.rpt
puts "==> Synthesis complete. Reports in $outDir/"
