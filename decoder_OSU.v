`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2016 03:40:31 PM
// Design Name: 
// Module Name: decoder_OSU
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

module decoder_OSU(
  input clk,
  input reset,
  input [3:0] Row,
  input lock_button,
  output reg [3:0] Col,
  output reg [3:0] DecodeOut,
  output reg [15:0] state_led,
  output reg [3:0] pass_signal,
  output reg [2:0]  press_count_out
); 

  reg [19:0] divider;
  reg [15:0] pass = 16'b0001000100010001; //hardcoded password
  
  
  /*Password buffer*/
  reg [15:0] pass_buffer;
  
  reg [2:0]  press_count;
  reg [2:0]  state = 3'b000;
  reg [3:0]  decode_buffer;
  reg [31:0] delay_clk;
  //reg [2:0]  flash_count;
  
  
  always @(posedge reset or posedge clk)
    begin
      if(reset)
        begin
          divider <= 20'b00000000000000000000;
        end
      else
        divider <= divider + 1;
    end
    
    

  always @(posedge clk)
    begin
      case(state)
        3'b000:
          begin
            
            if(divider ==  20'b00011000011010100000) // 11000011010100000 1ms delay =100000
              Col <= 4'b0111;
            else if(divider == 20'b00011000011010101000) // =100008
              if (Row == 4'b0111)
                begin
						  decode_buffer <= 4'b0001; //1	
						  pass_buffer <= {pass_buffer, 4'b0001};
						  state = 3'b001;
                end

            else if(Row == 4'b1011)
                begin
                        decode_buffer = 4'b0100;  //4
                        pass_buffer <= {pass_buffer, 4'b0100};
                        state = 3'b001;
                end  
                
            else if(Row == 4'b1101)
            begin
                          decode_buffer = 4'b0111;//7  
                          pass_buffer <= {pass_buffer, 4'b0111};
                          state = 3'b001;
            end  
            
            else if(Row == 4'b1110) 
            begin
                          decode_buffer = 4'b0000;  //0
                          pass_buffer <= {pass_buffer, 4'b0000};
                          state = 3'b001;
            end

            if(divider ==  20'b00110000110101000000) //=200000
              Col <= 4'b1011;
            else if(divider == 20'b00110000110101001000) //=200008
              begin 
                if (Row == 4'b0111)
                  begin
                              decode_buffer = 4'b0010;  //2
                              pass_buffer <= {pass_buffer, 4'b0010};
                              state = 3'b001;
                            end //2
                else if(Row == 4'b1011)  
                  begin
                              decode_buffer = 4'b0101;  //5
                              pass_buffer <= {pass_buffer, 4'b0101};
                              state = 3'b001;
                            end //5
                else if(Row == 4'b1101)
                  begin
                              decode_buffer = 4'b1000;  //8
                              pass_buffer <= {pass_buffer, 4'b1000};
                              state = 3'b001;
                            end
                else if(Row == 4'b1110)
                  DecodeOut <= 4'b1010; //f
              end

            if(divider ==  20'b01100001101010000000) //#400000
              Col <= 4'b1101;
            else if(divider == 20'b01100001101010001000) //400000
              begin 
                if (Row == 4'b0111)
                  begin
                              decode_buffer = 4'b0011;  //3
                              pass_buffer <= {pass_buffer, 4'b0011};
                              state = 3'b001;
                            end //3
                else if(Row == 4'b1011)  
                  begin
                              decode_buffer = 4'b0110;  //6
                              pass_buffer <= {pass_buffer, 4'b0110};
                              state = 3'b001;
                            end //6
                else if(Row == 4'b1101)
                  begin
                              decode_buffer = 4'b1001;  //9
                              pass_buffer <= {pass_buffer, 4'b1001};
                              state = 3'b001;
                            end  //9
                else if(Row == 4'b1110)
                  DecodeOut <= 4'b1010;
              end

            if(divider ==  20'b11000011010100000000) //#800000
              Col <= 4'b1110;
            else if(divider == 20'b11000011010100001000) //800008
              begin 
                if (Row == 4'b0111)
                  DecodeOut <= 4'b1010; //a
                else if(Row == 4'b1011)  
                  DecodeOut <= 4'b1010; //b
                else if(Row == 4'b1101)
                  DecodeOut <= 4'b1010;  //c
                else if(Row == 4'b1110)      
                  DecodeOut <= 4'b1010;  //d
              end  
			
          
          end
          
        3'b001:
          begin
		      if(delay_clk[31:0] == 32'd30000000)
			  begin
			    state_led <= 16'b0000000000000011;
				DecodeOut <= decode_buffer;
				delay_clk <= 32'd0;
				press_count = press_count + 1'b1;
				press_count_out <= press_count;
				if(press_count[2:0] == 3'd4)
                    begin
                        press_count <= 3'd0;
                        state <= 3'b010;
                        
                    end
				else
				    state <= 3'b000;
 			  end
			  else
			  delay_clk = delay_clk + 1'b1;
	       end
			  
		3'b010:
            begin
                if(pass_buffer == pass)
                begin
                    state <= 3'b011;
                end
                else
                    state <= 3'b000;
                    DecodeOut <= 4'b1010;
            
            end
            
          
          3'b011: //Unlocked
          begin
            state_led <= 16'b1111111111111111;
            pass_signal <= 4'b0001;
            
            if(lock_button)
                state <= 3'b100;
          end
          
          3'b100:
          begin
            pass_signal <= 4'b0010;
            //if(delay_clk[31:0] == 32'd3000000000)
            //begin
               // delay_clk = 32'd0;
                state <= 3'b000;
            //end
            //else
            //delay_clk = delay_clk + 1;
          end
            
      endcase
    end
endmodule