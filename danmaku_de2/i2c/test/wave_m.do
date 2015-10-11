onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fake_i2c_salve/rst
add wave -noupdate /fake_i2c_salve/sys_clk
add wave -noupdate /fake_i2c_salve/sda
add wave -noupdate /fake_i2c_salve/scl
add wave -noupdate /fake_i2c_salve/rw
add wave -noupdate /fake_i2c_salve/next
add wave -noupdate /fake_i2c_salve/start
add wave -noupdate /fake_i2c_salve/stop
add wave -noupdate /fake_i2c_salve/ready_to_rw
add wave -noupdate /fake_i2c_salve/is_idle
add wave -noupdate /fake_i2c_salve/data_recv
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9152244 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {4485714 ns} {9735730 ns}
