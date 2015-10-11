onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fake_i2c_master/rst
add wave -noupdate /fake_i2c_master/sys_clk
add wave -noupdate /fake_i2c_master/scl
add wave -noupdate /fake_i2c_master/sda
add wave -noupdate /fake_i2c_master/data_r
add wave -noupdate /fake_i2c_master/data_w
add wave -noupdate /fake_i2c_master/rd
add wave -noupdate /fake_i2c_master/wr
add wave -noupdate /fake_i2c_master/ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {911487 ns} {1436487 ns}
