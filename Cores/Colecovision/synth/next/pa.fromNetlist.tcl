
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Coleco_Next -dir "D:/Documentacao/Eletronica/FPGA/Multicore/SRC/Multicore/ColecovisionFPGA/synth/next/planAhead_run_1" -part xc6slx16ftg256-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Documentacao/Eletronica/FPGA/Multicore/SRC/Multicore/ColecovisionFPGA/synth/next/next_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Documentacao/Eletronica/FPGA/Multicore/SRC/Multicore/ColecovisionFPGA/synth/next} {ipcore_dir} }
set_property target_constrs_file "next_pins_issue2.ucf" [current_fileset -constrset]
add_files [list {next_pins_issue2.ucf}] -fileset [get_property constrset [current_run]]
link_design
