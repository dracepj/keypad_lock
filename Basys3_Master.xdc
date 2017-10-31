## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	
 
## LEDs
set_property PACKAGE_PIN U16 [get_ports {state_led[0] }]					
	set_property IOSTANDARD LVCMOS33 [get_ports { state_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {state_led[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports { state_led[1]}]
set_property PACKAGE_PIN U19 [get_ports {state_led[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports { state_led[2]}]
set_property PACKAGE_PIN V19 [get_ports {state_led[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports { state_led[3]}]
set_property PACKAGE_PIN W18 [get_ports {state_led[4]}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {state_led[4]}]
set_property PACKAGE_PIN U15 [get_ports {state_led[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[5]}]
set_property PACKAGE_PIN U14 [get_ports {state_led[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[6]}]
set_property PACKAGE_PIN V14 [get_ports {state_led[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[7]}]
set_property PACKAGE_PIN V13 [get_ports {state_led[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[8]}]
set_property PACKAGE_PIN V3 [get_ports {state_led[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[9]}]
set_property PACKAGE_PIN W3 [get_ports {state_led[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[10]}]
set_property PACKAGE_PIN U3 [get_ports {state_led[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[11]}]
set_property PACKAGE_PIN P3 [get_ports {state_led[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[12]}]
set_property PACKAGE_PIN N3 [get_ports {state_led[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[13]}]
set_property PACKAGE_PIN P1 [get_ports {state_led[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[14]}]
set_property PACKAGE_PIN L1 [get_ports {state_led[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_led[15]}]

	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN T18 [get_ports lock_button]						
        set_property IOSTANDARD LVCMOS33 [get_ports lock_button]

 

set_property PACKAGE_PIN V17 [get_ports {SW[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {SW[0]}]
set_property PACKAGE_PIN V16 [get_ports {SW[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {SW[1]}]
set_property PACKAGE_PIN W16 [get_ports {SW[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {SW[2]}]
set_property PACKAGE_PIN W17 [get_ports {SW[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {SW[3]}]







##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {JA[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[0]}]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {JA[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {JA[2]}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {JA[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
##Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {JA[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}]
#Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {JA[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}]
#Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {JA[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
	##Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {JA[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]



set_property PACKAGE_PIN A14 [get_ports pwm_out_left]
    set_property IOSTANDARD LVCMOS33 [get_ports pwm_out_left]
set_property PACKAGE_PIN A16 [get_ports pwm_out_right]
    set_property IOSTANDARD LVCMOS33 [get_ports pwm_out_right]   


