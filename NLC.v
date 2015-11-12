///////////////////////////////////////////////////////////////////////
// ADC Non-linearity Correction Engine
//
// EEM216A Fall 2015
//
//
//
// Description: ADC Non-linearity Correction Engine
//
//
//
//
// Inputs:
// 		i_x - ADC Count
//		i_clk - system clock
//		i_reset - global reset
//		i_srdyi - input enable
//
// Outputs:
//		o_y - Input Voltage
//		o_srdyo - output enable
//
//
//
//
//
///////////////////////////////////////////////////////////////////////

module NLC(
	i_x,
	i_clk,
	i_reset,
	i_srdyi,
	i_coeffs1,
	i_coeffs2,
	i_coeffs3,
	i_coeffs4,
	i_coeffs5,
	i_coeffs6,
	i_coeffs7,
	i_coeffs8,
	i_coeffs9,
	i_coeffs10,
	i_mean,
	i_std,
	o_y,
	o_srdyo,
	o_state,
	o_accum,
	o_test
);

///////////////////////////////////////////////////////////////////////
//Input & Output
	input [20:0] i_x;
	input i_clk;
	input i_reset;
	input i_srdyi;
	input [31:0] i_coeffs1;
	input [31:0] i_coeffs2;
	input [31:0] i_coeffs3;
	input [31:0] i_coeffs4;
	input [31:0] i_coeffs5;
	input [31:0] i_coeffs6;
	input [31:0] i_coeffs7;
	input [31:0] i_coeffs8;
	input [31:0] i_coeffs9;
	input [31:0] i_coeffs10;
	input [31:0] i_mean;
	input [31:0] i_std;
	output [31:0] o_y;
	output o_srdyo;
	output [2:0]o_state;
	output [31:0] o_accum;
	output [31:0] o_test;
	
	//Reset
	reg reset;
	
	reg in_enable_r;
	
	reg x_new_final_r;
	
	//Coefficients
	reg [31:0] coeffs1_r;
	reg [31:0] coeffs2_r;
	reg [31:0] coeffs3_r;
	reg [31:0] coeffs4_r;
	reg [31:0] coeffs5_r;
	reg [31:0] coeffs6_r;
	reg [31:0] coeffs7_r;
	reg [31:0] coeffs8_r;
	reg [31:0] coeffs9_r;
	reg [31:0] coeffs10_r;
	reg [31:0] mean_r;
	reg [31:0] std_r;
	
	//Accumulator loop
	reg [31:0] accumulator_r;
	reg coeff_r;
	integer loops_taken_r;
	integer nloops_r;

	//Output
	reg signed [31:0] out_r;
	reg signed [31:0] out_2_r;
	assign o_y = out_2_r;

	//Output enable
	reg out_enable_r;
	reg out_enable_2_r;
	assign o_srdyo = out_enable_2_r;
	
	//Convert x to smc
	reg signed [20:0] x_in_r;
	wire [31:0] x_new_w;
	reg [31:0] x_new_r;
	wire convert_to_smc_out_valid_w;
	reg signed [20:0] in_fp_to_smc_r;
	reg fp_to_smc_in_valid_r;
	
	//Convert y to fp
	wire convert_to_fp_out_valid_w;
	wire signed [20:0] out_smc_to_fp_w;
	reg signed [20:0] out_smc_to_fp_r;
	reg [31:0] in_smc_to_fp_r;
	reg smc_to_fp_in_valid_r;
	
	//Multiplier
	wire [31:0] out_mul_z_w;
	wire multiply_out_valid_w;
	reg mul_in_valid_r;
	reg [31:0] in_mul_x_r;
	reg [31:0] in_mul_y_r;
	reg [31:0] out_mul_z_r;

	//Adder
	wire add_out_valid_w;
	reg add_in_valid_r;
	reg [31:0] in_add_x_r;
	reg [31:0] in_add_y_r;
	reg [31:0] out_add_z_r;
	wire [31:0] out_add_z_w;
	
	
	//Parameters
	parameter S0 = 3'b000; //wait for x input 
	parameter S1 = 3'b001; //fp to smc conversion for x
	parameter S2 = 3'b010; //precondition x -> add -mean
	parameter S3 = 3'b011; //precondition x -> multiply 1/std
	parameter S4 = 3'b100; //multiple x with sum
	parameter S5 = 3'b101; //add sum to coeff
	parameter S6 = 3'b110; //accumulate
	parameter S7 = 3'b111; //convert y to fp
	
	parameter order = 4'd10;
	
	//States
	reg [2:0] state;
	reg [2:0] next_state;
	assign o_state = state;
	assign o_accum = accumulator_r;
	assign o_test = out_mul_z_r;


/////////////////////////////////////////////////////////////////////////
//Convert input i_x to smc floating point
fp_to_smc_float convert_to_smc(
	.clk(i_clk),
	.GlobalReset(reset),
	.y_o_portx(x_new_w),
	.x_i(in_fp_to_smc_r),
	.srdyo_o(convert_to_smc_out_valid_w),
	.srdyi_i(fp_to_smc_in_valid_r)
);

/////////////////////////////////////////////////////////////////////////
//Convert output to ieee fp
smc_float_to_fp convert_to_fp(
	.clk(i_clk),
	.GlobalReset(reset),
	.x_i_porty(in_smc_to_fp_r),
	.y_o(out_smc_to_fp_w),
	.srdyo_o(convert_to_fp_out_valid_w),
	.srdyi_i(smc_to_fp_in_valid_r)
);

/////////////////////////////////////////////////////////////////////////////
//Instatiate multiplier
smc_float_multiplier multiply(
	.clk(i_clk),
	.GlobalReset(reset),
	.x_i_porty(in_mul_x_r),
	.y_i_porty(in_mul_y_r),
	.z_o_portx(out_mul_z_w),
	.srdyi_i(mul_in_valid_r),
	.srdyo_o(multiply_out_valid_w)
);

//////////////////////////////////////////////////////////////////////////////
//Instatiate adder
smc_float_adder add(
	.clk(i_clk),
	.GlobalReset(reset),
	.x_i_porty(in_add_x_r),
	.y_i_porty(in_add_y_r),
	.z_o_portx(out_add_z_w),
	.srdyi_i(add_in_valid_r),
	.srdyo_o(add_out_valid_w)
);

/////////////////////////////////////////////////////////////////////////////
//Next state logic
always @(*) begin
	case(state) 
		S0: begin
			if(in_enable_r == 1'b1)
				next_state = S1;
			else
				next_state = S0;
		end
		S1: begin //convert x to smc 
			if(convert_to_smc_out_valid_w == 1'b1) begin
				next_state = S2;
				x_new_r = x_new_w;
			end
			else begin
				next_state = S1;
			end
		end
		S2: begin //add -mean to x
			if(add_out_valid_w == 1'b1) begin
				next_state = S3;
				out_add_z_r = out_add_z_w;
				add_in_valid_r = 1'b0;
			end
			else begin
				next_state = S2;
			end
		end
		S3: begin //multiple 1/std and (x-mean)
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S4;
				x_new_final_r = out_mul_z_w;
				mul_in_valid_r = 1'b0;
			end
			else begin
				next_state = S3;	
			end
		end
		S4: begin //multiply x and current accumulator
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S5;
				out_mul_z_r = out_mul_z_w;
				mul_in_valid_r = 1'b0;
			end
			else begin
				next_state = S4;
			end
		end
		S5: begin //add coeff to product
			if(add_out_valid_w == 1'b1) begin
				next_state = S6;
				out_add_z_r = out_add_z_w;
				add_in_valid_r = 1'b0;
			end
			else begin
				next_state = S5;	
			end
		end
		S6: begin //count number of iterations
			if(loops_taken_r == order)
				next_state = S7;
			else
				next_state = S4;
		end
		S7: begin //convert final y to fp
			if(convert_to_fp_out_valid_w == 1'b1) begin
				out_smc_to_fp_r = out_smc_to_fp_w;
				out_r = out_smc_to_fp_r;
				out_enable_r = 1'b1;
				smc_to_fp_in_valid_r = 1'b0;
				next_state = S0;
			end
			else begin
				next_state = S7;
			end
		end
	endcase
end

///////////////////////////////////////////////////////////////////////////
//State logic
always @(state) begin
	case(state) 
		S0: begin //initial state
			out_enable_r = 1'b0;
			fp_to_smc_in_valid_r = 1'b0;
			smc_to_fp_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			loops_taken_r = 0;
			accumulator_r = 32'd0;
		end
		S1: begin //convert x from fp to smc
			in_fp_to_smc_r = x_in_r;
			fp_to_smc_in_valid_r = 1'b1;
		end
		S2: begin //add -mean to x
			in_add_x_r = x_new_r;
			in_add_y_r = mean_r;
			add_in_valid_r = 1'b1;
		end
		S3: begin //multiply 1/std and x-mean
			in_mul_x_r = out_add_z_r;
			in_mul_y_r = std_r;
			mul_in_valid_r = 1'b1;
		end
		S4: begin //multiple current sum and x
			in_mul_x_r = x_new_final_r;
			in_mul_y_r = accumulator_r;
			mul_in_valid_r = 1'b1;
		end
		S5: begin //add coeff to product
			in_add_x_r = out_mul_z_r;
			loops_taken_r = loops_taken_r + 1;
			case(loops_taken_r)
				1: in_add_y_r = coeffs10_r;
				2: in_add_y_r = coeffs9_r;
				3: in_add_y_r = coeffs8_r;
				4: in_add_y_r = coeffs7_r;
				5: in_add_y_r = coeffs6_r;
				6: in_add_y_r = coeffs5_r;
				7: in_add_y_r = coeffs4_r;
				8: in_add_y_r = coeffs3_r;
				9: in_add_y_r = coeffs2_r;
				10: in_add_y_r = coeffs1_r;
				default: in_add_y_r = 0;
			endcase
			add_in_valid_r = 1'b1;
		end
		S6: begin //Accumulate sum
			accumulator_r = out_add_z_r;
		end
		S7: begin //convert y from smc to fp
			in_smc_to_fp_r = accumulator_r;
			smc_to_fp_in_valid_r = 1'b1;
		end
	endcase
end


////////////////////////////////////////////////////////////////////////////////
//At clock edge

always @(posedge i_clk) begin
	if(i_reset == 1'b1) begin
		reset <= i_reset;
		state <= S0;
	end
	else begin
		reset <= 1'b0;
		state <= next_state;
		in_enable_r <= i_srdyi;
		if(i_srdyi == 1'b1) begin
			coeffs1_r <= i_coeffs1;
			coeffs2_r <= i_coeffs2;
			coeffs3_r <= i_coeffs3;
			coeffs4_r <= i_coeffs4;
			coeffs5_r <= i_coeffs5;
			coeffs6_r <= i_coeffs6;
			coeffs7_r <= i_coeffs7;
			coeffs8_r <= i_coeffs8;
			coeffs9_r <= i_coeffs9;
			coeffs10_r <= i_coeffs10;
			x_in_r <= i_x;
			mean_r <= i_mean;
			std_r <= i_std;
		end
		out_enable_2_r <= out_enable_r;
		out_2_r <= out_r;
	end	
end

endmodule

