
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Vezbanje16.04.2021 -dir "C:/Users/Ermin/Desktop/Vezbanje/Vezbanje16.04.2021/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "TopMod.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {counter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Clock_Divider.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {TopMod.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top TopMod $srcset
add_files [list {TopMod.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
