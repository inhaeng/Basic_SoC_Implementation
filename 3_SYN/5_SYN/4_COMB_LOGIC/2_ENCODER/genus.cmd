# Cadence Genus(TM) Synthesis Solution, Version 22.17-s071_1, built Sep 12 2024 12:37:05

# Date: Wed Jul 08 03:24:14 2026
# Host: kopo-seongnam (x86_64 w/Linux 3.10.0-1160.el7.x86_64) (20cores*80cpus*2physical cpus*Intel(R) Xeon(R) Gold 5218R CPU @ 2.10GHz 28160KB)
# OS:   CentOS Linux release 7.9.2009 (Core)

set_db init_lib_search_path ../../../1_LIB
read_libs slow_vdd1v0_basicCells.lib
set_db init_hdl_search_path  ../../../../1_RTL/4_COMB_LOGIC/2_ENCODER/
read_hdl interrupt_controller.v
elaborate
read_sdc ../../../2_CONSTRAINTS/sample.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
gui_raise
syn_map
syn_opt
report_timing > ./reports/timing.rpt
report_power > ./reports/power.rpt
report_area > ./reports/area.rpt
report_qor > ./reports/qor.rpt
write_hdl ./outputs/interrupt_controller_netlist.v
write_hdl > ./outputs/interrupt_controller_netlist.v
wirte_sdc > ./outputs/interrupt_controller_final.sdc
write_sdc > ./outputs/interrupt_controller_final.sdc
exit
