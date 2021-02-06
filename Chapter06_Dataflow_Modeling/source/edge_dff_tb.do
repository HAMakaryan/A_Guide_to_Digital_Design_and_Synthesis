onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary -radixshowbase 0 /edge_dff_tb/DUT/clear
add wave -noupdate -radix binary -radixshowbase 0 /edge_dff_tb/DUT/cbar
add wave -noupdate -radix decimal -radixshowbase 0 /edge_dff_tb/scenario
add wave -noupdate -radix ascii -radixshowbase 0 /edge_dff_tb/comment
add wave -noupdate -color Yellow -radix binary -radixshowbase 0 /edge_dff_tb/DUT/clk
add wave -noupdate -radix binary -radixshowbase 0 /edge_dff_tb/DUT/q
add wave -noupdate -radix binary -radixshowbase 0 /edge_dff_tb/DUT/qbar
add wave -noupdate -radix binary -radixshowbase 0 /edge_dff_tb/DUT/sbar
add wave -noupdate -radix binary -radixshowbase 0 /edge_dff_tb/DUT/rbar
add wave -noupdate -color Aquamarine -radix binary -radixshowbase 0 /edge_dff_tb/DUT/d
add wave -noupdate -color Gray80 -radix binary -radixshowbase 0 /edge_dff_tb/DUT/r
add wave -noupdate -color White -radix binary -radixshowbase 0 /edge_dff_tb/DUT/s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1108250 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 97
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {551990 ps} {1814290 ps}
