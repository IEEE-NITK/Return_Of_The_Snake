set_property IOSTANDARD LVCMOS33 [get_ports clock_100Mhz]
set_property PACKAGE_PIN E3 [get_ports clock_100Mhz]

set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN N17 [get_ports reset]
#set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { reset }];

set_property IOSTANDARD LVCMOS33 [get_ports {buttons[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {buttons[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {buttons[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {buttons[0]}]
set_property PACKAGE_PIN M18 [get_ports {buttons[3]}]
set_property PACKAGE_PIN M17 [get_ports {buttons[2]}]
set_property PACKAGE_PIN P18 [get_ports {buttons[1]}]
set_property PACKAGE_PIN P17 [get_ports {buttons[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]
set_property PACKAGE_PIN B11 [get_ports hsync]
set_property PACKAGE_PIN B12 [get_ports vsync]
set_property PACKAGE_PIN A3 [get_ports {vga_r[0]}]
set_property PACKAGE_PIN B4 [get_ports {vga_r[1]}]
set_property PACKAGE_PIN C5 [get_ports {vga_r[2]}]
set_property PACKAGE_PIN A4 [get_ports {vga_r[3]}]
set_property PACKAGE_PIN C6 [get_ports {vga_g[0]}]
set_property PACKAGE_PIN A5 [get_ports {vga_g[1]}]
set_property PACKAGE_PIN B6 [get_ports {vga_g[2]}]
set_property PACKAGE_PIN A6 [get_ports {vga_g[3]}]
set_property PACKAGE_PIN B7 [get_ports {vga_b[0]}]
set_property PACKAGE_PIN C7 [get_ports {vga_b[1]}]
set_property PACKAGE_PIN D7 [get_ports {vga_b[2]}]
set_property PACKAGE_PIN D8 [get_ports {vga_b[3]}]


set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN T10 [get_ports {seg[6]}]
set_property PACKAGE_PIN R10 [get_ports {seg[5]}]
set_property PACKAGE_PIN K16 [get_ports {seg[4]}]
set_property PACKAGE_PIN K13 [get_ports {seg[3]}]
set_property PACKAGE_PIN P15 [get_ports {seg[2]}]
set_property PACKAGE_PIN T11 [get_ports {seg[1]}]
set_property PACKAGE_PIN L18 [get_ports {seg[0]}]


set_property IOSTANDARD LVCMOS33 [get_ports {AN[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property PACKAGE_PIN U13 [get_ports {AN[7]}]
set_property PACKAGE_PIN K2 [get_ports {AN[6]}]
set_property PACKAGE_PIN T14 [get_ports {AN[5]}]
set_property PACKAGE_PIN P14 [get_ports {AN[4]}]
set_property PACKAGE_PIN J14 [get_ports {AN[3]}]
set_property PACKAGE_PIN T9 [get_ports {AN[2]}]
set_property PACKAGE_PIN J18 [get_ports {AN[1]}]
set_property PACKAGE_PIN J17 [get_ports {AN[0]}]

#set_property IOSTANDARD LVCMOS33 [get_ports AUD_PWM]
#set_property IOSTANDARD LVCMOS33 [get_ports AUD_SD]
#set_property PACKAGE_PIN A11 [get_ports AUD_PWM]
#set_property PACKAGE_PIN D12 [get_ports AUD_SD]


#set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { level[0] }]; 
#set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { level[1] }]; 
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { level[2] }]; 
#set_property -dict { PACKAGE_PIN H6   IOSTANDARD LVCMOS33 } [get_ports { level[3] }];
#set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { level[4] }]; 
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { level[5] }]; 
#set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports { level[6] }]; 
#set_property -dict { PACKAGE_PIN T8   IOSTANDARD LVCMOS33 } [get_ports { level[7] }]; 
#set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { level[8] }]; 

##Pmod Header JA

#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { in_x }]; #IO_L20N_T3_A19_15 Sch=ja[1]
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { in_y }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { JA[3] }]; #IO_L21P_T3_DQS_15 Sch=ja[3]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { JA[4] }]; #IO_L18N_T2_A23_15 Sch=ja[4]
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { JA[7] }]; #IO_L16N_T2_A27_15 Sch=ja[7]
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { JA[8] }]; #IO_L16P_T2_A28_15 Sch=ja[8]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { JA[9] }]; #IO_L22N_T3_A16_15 Sch=ja[9]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { JA[10] }]; #IO_L22P_T3_A17_15 Sch=ja[10]
