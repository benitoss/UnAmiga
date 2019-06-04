create_clock -name clk1_50 -period 20 [get_ports {clock_50_i}]


derive_pll_clocks -create_base_clocks

derive_clock_uncertainty

