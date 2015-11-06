`timescale 1ns/100ps

module NLC_tb();

	reg [20:0] i_x_tb;
	reg i_clk_tb;
	reg i_reset_tb;
	reg i_srdyi_tb;
	wire [31:0]o_y_tb;
	wire [31:0] o_xnew_tb;
	wire o_srdyo_tb;
	wire [2:0] o_state_tb;
	
	wire	[3:0]	test_instruction;
	
//////////////////////////////////////////////////////////////////////
// assign the instruction you want to test: 
// from 000 ~ 111 mapping to your instruction 000 ~ 111
// 1XXX means all instructions will be tested
assign	test_instruction = 4'b0000;
//////////////////////////////////////////////////////////////////////

// Instantiate a Design Under Test (DUT)
NLC NLC00(
    .i_x    (   i_x_tb            ),
    .i_clk  (   i_clk_tb           ),
    .i_reset   (   i_reset_tb          ),
    .i_srdyi   (   i_srdyi_tb          ),
    .o_y     (   o_y_tb     ),
    .o_xnew    (   o_xnew_tb         ),
	.o_srdyo (o_srdyo_tb),
	.o_state(o_state_tb)
	);


// Oscillate the clock (cycle time is 162ns and 6.14Mhz)
always #81 i_clk_tb = ~i_clk_tb;
//always #80 i_srdyi;


initial begin
	
	 i_x_tb =  21'd0;
	 i_clk_tb = 1'b1 ;
	 i_reset_tb = 1'b0;
	 i_srdyi_tb = 1'b0;
	
	i_reset_tb = 1'b1;
	#81 i_reset_tb = 1'b0;
	#81 i_x_tb = -21'd50000;
	i_srdyi_tb = 1'b1;
	#81 i_srdyi_tb = 1'b0;
	
	
	/*case (test_instruction)
	4'b0000:
		begin
		i_srdyi_tb = 1'b1;
		i_x_tb = 21'd27000;
		
		end
	endcase
	#100000 
	
	i_x_tb = -21'd20000;
	
	#100000
	
	i_x_tb = 21'd50000;
	
	#100000
	
	i_x_tb = 21'd20000;*/
	
	#100000 $stop;
	end
	
	endmodule