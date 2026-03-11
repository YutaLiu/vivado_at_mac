# create_project.tcl — Generate Vivado project (.xpr) for blinky
# Run inside container: vivado -mode batch -source create_project.tcl

set project_name "blinky"
set project_dir  "/workspace"
set part         "xc7a35tcpg236-1"

# Verify source directories exist
foreach d [list "$project_dir/src" "$project_dir/constraints"] {
    if {![file isdirectory $d]} {
        error "Required directory not found: $d"
    }
}

# Create project (-force overwrites existing)
create_project $project_name $project_dir -part $part -force

# Add source files (reference, not copy)
set src_files [glob -nocomplain $project_dir/src/*.v]
if {[llength $src_files] == 0} {
    error "No Verilog source files found in $project_dir/src/"
}
add_files -norecurse $src_files

# Add constraint files
set xdc_files [glob -nocomplain $project_dir/constraints/*.xdc]
if {[llength $xdc_files] == 0} {
    error "No constraint files found in $project_dir/constraints/"
}
add_files -fileset constrs_1 -norecurse $xdc_files

# Set top module
set_property top $project_name [current_fileset]

update_compile_order -fileset sources_1

puts "========================================="
puts "  Project created: $project_dir/$project_name.xpr"
puts "  Open in Vivado GUI to use"
puts "========================================="
