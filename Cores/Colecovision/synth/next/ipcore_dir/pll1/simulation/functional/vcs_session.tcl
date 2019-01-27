gui_open_window Wave
gui_sg_create pll1_group
gui_list_add_group -id Wave.1 {pll1_group}
gui_sg_addsignal -group pll1_group {pll1_tb.test_phase}
gui_set_radix -radix {ascii} -signals {pll1_tb.test_phase}
gui_sg_addsignal -group pll1_group {{Input_clocks}} -divider
gui_sg_addsignal -group pll1_group {pll1_tb.CLK_IN1}
gui_sg_addsignal -group pll1_group {{Output_clocks}} -divider
gui_sg_addsignal -group pll1_group {pll1_tb.dut.clk}
gui_list_expand -id Wave.1 pll1_tb.dut.clk
gui_sg_addsignal -group pll1_group {{Counters}} -divider
gui_sg_addsignal -group pll1_group {pll1_tb.COUNT}
gui_sg_addsignal -group pll1_group {pll1_tb.dut.counter}
gui_list_expand -id Wave.1 pll1_tb.dut.counter
gui_zoom -window Wave.1 -full
