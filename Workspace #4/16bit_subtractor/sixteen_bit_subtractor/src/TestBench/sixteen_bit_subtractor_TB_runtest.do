SetActiveLib -work
comp -include "$dsn\src\half_adder.vhd" 
comp -include "$dsn\src\full_adder.vhd" 
comp -include "$dsn\src\sixteen_bit_adder.vhd" 
comp -include "$dsn\src\sixteen_bit_subtractor.vhd" 
comp -include "$dsn\src\TestBench\sixteen_bit_subtractor_TB.vhd" 
asim +access +r TESTBENCH_FOR_sixteen_bit_subtractor 
wave 
wave -noreg A
wave -noreg B
wave -noreg D
wave -noreg Borrow
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\sixteen_bit_subtractor_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_sixteen_bit_subtractor 
