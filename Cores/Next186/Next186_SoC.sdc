#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 20 [get_ports CLOCK_50]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[0]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[1]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[2]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[3]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[4]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[5]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[6]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[7]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[8]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[9]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[10]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[11]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[12]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[13]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[14]}]
set_input_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[2]}]  3.000 [get_ports {DRAM_DQ[15]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[0]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[1]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[2]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[3]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[4]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[5]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[6]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[7]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[8]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[9]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[10]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[11]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_ADDR[12]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_BA[0]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_BA[1]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_CAS_N}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQM[0]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQM[1]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[0]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[1]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[2]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[3]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[4]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[5]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[6]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[7]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[8]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[9]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[10]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[11]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[12]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[13]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[14]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_DQ[15]}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_RAS_N}]
set_output_delay -add_delay  -clock [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  3.000 [get_ports {DRAM_WE_N}]



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************
set_false_path  -from  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[1]}]
set_false_path  -from  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[1]}]  -to  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path  -from  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path  -from  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]
set_false_path  -from  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[3]}]
set_false_path  -from  [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[4]}]
set_false_path  -from  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[0]}] -to [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  
set_false_path  -from  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}] -to [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  
set_false_path  -from  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[3]}] -to [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  
set_false_path  -from  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[4]}] -to [get_clocks {sys_inst|dcm_cpu_inst|altpll_component|auto_generated|pll1|clk[0]}]  
set_false_path  -from  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[0]}] -to [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}]  
set_false_path  -from  [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[1]}] -to [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[0]}]  
set_false_path -from [get_clocks {CLOCK_50}] -to [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[3]}]
set_false_path -from [get_clocks {sys_inst|dcm_system|altpll_component|auto_generated|pll1|clk[3]}] -to [get_clocks {CLOCK_50}]

set_false_path -from [get_registers {system:sys_inst|VGA_SC:sc|planarreq}]

#**************************************************************
# Set Multicycle Path
#**************************************************************
set_multicycle_path -from [get_registers {sys_inst|CPUUnit|cpu*}] -setup -start 2
set_multicycle_path -from [get_registers {sys_inst|CPUUnit|cpu*}] -hold -start 1


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



# How to change the PLL frequency after compilation
# 1 - Locate the PLL in the hierarchy, right click and select <Locate Node>/<Locate in Resource Property Editor>
# 2 - Change the desired parameters (the non grayed ones)
# 3 - In the main menu select <Edit>/<Check and Save all Netlist Changes>
# 4 - Wait for Fitter and Assembler