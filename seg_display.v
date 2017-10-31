`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2016 09:40:43 PM
// Design Name: 
// Module Name: seg_display
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


module seg_display(
    input [3:0] DispVal,
    input [2:0] press_count,
    output reg [3:0] anode,
    output reg [6:0] segOut
    );
    
    always @(DispVal)
    begin
        case(press_count)
        3'd1: anode = 4'b0111; 
        3'd2: anode = 4'b0011; 
        3'd3: anode = 4'b0001; 
        3'd4: anode = 4'b0000;
        default: anode = 4'b0000;
        endcase
    end
    
    
    always @(DispVal)
    begin 
    case(DispVal)
        4'b0000 : segOut = 7'b1000000; //0
        4'b0001 : segOut = 7'b1111001; //1
        4'b0010 : segOut = 7'b0100100; //2
        4'b0011 : segOut = 7'b0110000; //3
        4'b0100 : segOut = 7'b0011001; //4
        4'b0101 : segOut = 7'b0010010; //5
        4'b0110 : segOut = 7'b0000010; //6
        4'b0111 : segOut = 7'b1111000; //7
        4'b1000 : segOut = 7'b0000000; //8
        4'b1001 : segOut = 7'b0010000; //9
        4'b1010 : segOut = 7'b0001001; //error
        //4'b1011 : segOut = 7'b0000011; //b
        //4'b1100 : segOut = 7'b1000110; //c
        //4'b1101 : segOut = 7'b0100001; //d
        //4'b1110 : segOut = 7'b0000110; //e
        //4'b1111 : segOut = 7'b0001110; //f
        
        default : segOut = 7'b1111111; 
    endcase
    end
    
endmodule