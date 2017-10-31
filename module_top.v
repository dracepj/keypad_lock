`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2016 09:36:00 PM
// Design Name: 
// Module Name: module_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module module_top(
        input clk,
        input reset,
        input lock_button,
        inout wire [7:0] JA,
        output wire [3:0] an,
        output wire [6:0] seg,
        output wire [15:0] state_led,
        output pwm_out_left,
        output pwm_out_right
        
       );
    
    wire [3:0] decode;
    wire [3:0] pass_signal;
    wire [2:0] press_count_wire;
    
    decoder_OSU U1 (.clk(clk), .reset(reset), .Row(JA[7:4]), .lock_button(lock_button), .Col(JA[3:0]), .DecodeOut(decode), .state_led(state_led), .pass_signal(pass_signal), .press_count_out(press_count_wire));
    seg_display U3 (.DispVal(decode), .press_count(press_count_wire), .anode(an), .segOut(seg));
    servoPWM U2 (.reset_n(reset), .clk(clk), .pass_signal(pass_signal), .pwm_out_left(pwm_out_left), .pwm_out_right(pwm_out_right));
    
    
endmodule