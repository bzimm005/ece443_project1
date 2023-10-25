SetActiveLib -work
comp -include "$dsn\src\halfadder.vhd" 
comp -include "$dsn\src\TestBench\halfadder_TB.vhd" 
asim +access +r TESTBENCH_FOR_halfadder 
wave 
wave -noreg A
wave -noreg B
wave -noreg Sum
wave -noreg Cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\halfadder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_halfadder 
