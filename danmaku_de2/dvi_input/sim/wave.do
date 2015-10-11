onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /overlay_test/rst
add wave -noupdate /overlay_test/de
add wave -noupdate /overlay_test/hsync
add wave -noupdate /overlay_test/vsync
add wave -noupdate /overlay_test/pixel_clk_o
add wave -noupdate /overlay_test/de_o
add wave -noupdate /overlay_test/hsync_o
add wave -noupdate /overlay_test/vsync_o
add wave -noupdate -radix hexadecimal /overlay_test/pixel_r_o
add wave -noupdate -radix hexadecimal /overlay_test/pixel_g_o
add wave -noupdate -radix hexadecimal /overlay_test/pixel_b_o
add wave -noupdate -radix hexadecimal /overlay_test/fifoData
add wave -noupdate /overlay_test/feeder1/fifoRdreq
add wave -noupdate -radix hexadecimal /overlay_test/feeder1/img1/pixel_r_out
add wave -noupdate -radix hexadecimal /overlay_test/feeder1/img1/pixel_g_out
add wave -noupdate -radix hexadecimal /overlay_test/feeder1/img1/pixel_b_out
add wave -noupdate -radix hexadecimal /overlay_test/feeder1/img1/pixel_a_out
add wave -noupdate /overlay_test/feeder1/wrreq
add wave -noupdate /overlay_test/feeder_clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27705610000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
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
configure wave -timelineunits ps
update
WaveRestoreZoom {27704956224 ps} {27706343776 ps}
