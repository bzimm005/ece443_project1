SetActiveLib -work
comp -include "$dsn\src\16-bit Multiplier.vhd" 
comp -include "$dsn\src\TestBench\sixteen_bit_multiplier_TB.vhd" 
asim +access +r TESTBENCH_FOR_sixteen_bit_multiplier 
wave 
wave -noreg A
wave -noreg B
wave -noreg Result
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\sixteen_bit_multiplier_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_sixteen_bit_multiplier 
