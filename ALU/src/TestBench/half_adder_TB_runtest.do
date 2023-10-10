SetActiveLib -work
comp -include "$dsn\src\Half Adder.vhd" 
comp -include "$dsn\src\TestBench\half_adder_TB.vhd" 
asim +access +r TESTBENCH_FOR_half_adder 
wave 
wave -noreg A
wave -noreg B
wave -noreg Sum
wave -noreg Carry
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\half_adder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_half_adder 
