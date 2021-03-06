///////////////////////////////////////////////////////////////////////
// ADC Non-linearity Correction Engine
//
// EEM216A Fall 2015
//
//
//
// Description: ADC Non-linearity Correction Engine

///////////////////////////////////////////////////////////////////////

module NLC(

	//System clock and reset
	clk,
	reset,
  
	//ADC output
	srdyi, 
	x_lin,

	//NLC output
	srdyo, 
	x_adc, 

	//X-value that separates the sections
	section_limit,

	//Reciprocal standard deviation for the centered and scaled fit
	recip_stdev_4, 
	recip_stdev_3, 
	recip_stdev_2, 
	recip_stdev_1, 

	//Negative meand for the centered and scaled fit
	neg_mean_4, 
	neg_mean_3, 
	neg_mean_2, 
	neg_mean_1, 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	coeff_4_10, 
	coeff_4_9, 
	coeff_4_8, 
	coeff_4_7, 
	coeff_4_6, 
	coeff_4_5, 
	coeff_4_4, 
	coeff_4_3, 
	coeff_4_2, 
	coeff_4_1, 
	coeff_4_0, 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	coeff_3_10, 
	coeff_3_9, 
	coeff_3_8, 
	coeff_3_7, 
	coeff_3_6, 
	coeff_3_5, 
	coeff_3_4, 
	coeff_3_3, 
	coeff_3_2, 
	coeff_3_1, 
	coeff_3_0, 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	coeff_2_10, 
	coeff_2_9, 
	coeff_2_8, 
	coeff_2_7, 
	coeff_2_6, 
	coeff_2_5, 
	coeff_2_4, 
	coeff_2_3, 
	coeff_2_2, 
	coeff_2_1, 
	coeff_2_0, 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	coeff_1_10, 
	coeff_1_9, 
	coeff_1_8, 
	coeff_1_7, 
	coeff_1_6, 
	coeff_1_5, 
	coeff_1_4, 
	coeff_1_3, 
	coeff_1_2, 
	coeff_1_1, 
	coeff_1_0,
	
	//o_state,
	o_section
	//o_abs_x,
	//o_coeff
);

///////////////////////////////////////////////////////////////////////
//Input & Output
	
	//System clock and reset
	input clk;
	input reset;
	
	//ADC output
	input [20:0] x_adc;
	input srdyi;
	
	//NLC output
	output [20:0] x_lin;
	output srdyo;
	
	//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4; 
	input [31:0] recip_stdev_3; 
	input [31:0] recip_stdev_2; 
	input [31:0] recip_stdev_1; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4;
	input [31:0] neg_mean_3; 
	input [31:0] neg_mean_2; 
	input [31:0] neg_mean_1; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10;
	input [31:0] coeff_4_9;
	input [31:0] coeff_4_8; 
	input [31:0] coeff_4_7; 
	input [31:0] coeff_4_6; 
	input [31:0] coeff_4_5; 
	input [31:0] coeff_4_4; 
	input [31:0] coeff_4_3; 
	input [31:0] coeff_4_2; 
	input [31:0] coeff_4_1; 
	input [31:0] coeff_4_0; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10; 
	input [31:0] coeff_3_9; 
	input [31:0] coeff_3_8; 
	input [31:0] coeff_3_7; 
	input [31:0] coeff_3_6; 
	input [31:0] coeff_3_5; 
	input [31:0] coeff_3_4; 
	input [31:0] coeff_3_3; 
	input [31:0] coeff_3_2; 
	input [31:0] coeff_3_1; 
	input [31:0] coeff_3_0; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10; 
	input [31:0] coeff_2_9; 
	input [31:0] coeff_2_8; 
	input [31:0] coeff_2_7; 
	input [31:0] coeff_2_6; 
	input [31:0] coeff_2_5; 
	input [31:0] coeff_2_4; 
	input [31:0] coeff_2_3; 
	input [31:0] coeff_2_2; 
	input [31:0] coeff_2_1; 
	input [31:0] coeff_2_0; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10;
	input [31:0] coeff_1_9; 
	input [31:0] coeff_1_8; 
	input [31:0] coeff_1_7; 
	input [31:0] coeff_1_6; 
	input [31:0] coeff_1_5; 
	input [31:0] coeff_1_4; 
	input [31:0] coeff_1_3; 
	input [31:0] coeff_1_2; 
	input [31:0] coeff_1_1; 
	input [31:0] coeff_1_0;
	
	//X-value that separates the sections
	input [19:0] section_limit;
	
	output [2:0] o_section;
	//output [2:0] o_state;
	//output [20:0] o_abs_x;
	//output [31:0] o_coeff;
	
	//Reset
	reg rst;
	
	reg in_enable_r;
	//reg sum_en_r;
	//reg sum_rst_r;
	reg x_new_final_r;
	
	//Coefficients, mean, and std
	reg [31:0] coeffs0_r;
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
	reg [20:0] out_r;
	//reg signed [31:0] out_2_r;
	assign x_lin = out_r;

	//Output enable
	reg out_enable_r;
	//reg out_enable_2_r;
	assign srdyo = out_enable_r;
	
	//Convert x to smc
	//reg signed [20:0] x_in_r;
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
	reg [20:0] abs_x;
	reg signed [20:0] i_x_r;
	
	//assign o_state = state;
	reg [2:0] section;
	assign o_section = section;
	//assign o_abs_x = abs_x;
	//assign o_coeff = coeffs0_r;

/////////////////////////////////////////////////////////////////////////
//Convert input x_adc to smc floating point
fp_to_smc_float convert_to_smc(
	.clk(clk),
	.GlobalReset(rst),
	.y_o_portx(x_new_w),
	.x_i(in_fp_to_smc_r),
	.srdyo_o(convert_to_smc_out_valid_w),
	.srdyi_i(fp_to_smc_in_valid_r)
);

/////////////////////////////////////////////////////////////////////////
//Convert output to ieee fp
smc_float_to_fp convert_to_fp(
	.clk(clk),
	.GlobalReset(rst),
	.x_i_porty(in_smc_to_fp_r),
	.y_o(out_smc_to_fp_w),
	.srdyo_o(convert_to_fp_out_valid_w),
	.srdyi_i(smc_to_fp_in_valid_r)
);

/////////////////////////////////////////////////////////////////////////////
//Instatiate multiplier
smc_float_multiplier multiply(
	.clk(clk),
	.GlobalReset(rst),
	.x_i_porty(in_mul_x_r),
	.y_i_porty(in_mul_y_r),
	.z_o_portx(out_mul_z_w),
	.srdyi_i(mul_in_valid_r),
	.srdyo_o(multiply_out_valid_w)
);

//////////////////////////////////////////////////////////////////////////////
//Instatiate adder
smc_float_adder add(
	.clk(clk),
	.GlobalReset(rst),
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
				rst = 1'b1;
			end
			else begin
				next_state = S1;
				rst = 1'b0;
			end
		end
		S2: begin //add -mean to x
			if(add_out_valid_w == 1'b1) begin
				next_state = S3;
				out_add_z_r = out_add_z_w;
				add_in_valid_r = 1'b0;
				rst = 1'b1;
			end
			else begin
				next_state = S2;
				rst = 1'b0;
			end
		end
		S3: begin //multiple 1/std and (x-mean)
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S4;
				x_new_final_r = out_mul_z_w;
				mul_in_valid_r = 1'b0;
				rst = 1'b1;
			end
			else begin
				next_state = S3;	
				rst = 1'b0;
			end
		end
		S4: begin //multiply x and current accumulator
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S5;
				out_mul_z_r = out_mul_z_w;
				mul_in_valid_r = 1'b0;
				rst = 1'b1;
			end
			else begin
				next_state = S4;
				rst = 1'b0;
			end
		end
		S5: begin //add coeff to product
			if(add_out_valid_w == 1'b1) begin
				next_state = S6;
				out_add_z_r = out_add_z_w;
				add_in_valid_r = 1'b0;
				rst = 1'b1;
			end
			else begin
				next_state = S5;	
				rst = 1'b0;
			end
		end
		S6: begin //convert final y to fp
			if(convert_to_fp_out_valid_w == 1'b1) begin
				out_smc_to_fp_r = out_smc_to_fp_w;
				out_r = out_smc_to_fp_r;
				smc_to_fp_in_valid_r = 1'b0;
				next_state = S7;
				rst = 1'b1;
			end
			else begin
				next_state = S6;
				rst = 1'b0;
			end
		end
		S7: begin //count number of iterations
			if(loops_taken_r > order) begin
				next_state = S0;
				out_enable_r = 1'b1;
				out_r = out_smc_to_fp_r;
				rst = 1'b1;
			end
			else begin
				next_state = S4;
				rst = 1'b0;
			end
		end
	endcase
end

////////////////////////////////////////////////////////////////////////////
//Determine section
always @(*) begin
	i_x_r = x_adc;
	//Get abs of x_adc
	if(i_x_r[20] == 1'b1)
		abs_x = -i_x_r;
	else
		abs_x = i_x_r;
	
	//Determine which coeffs, mean, and std to use
	if(i_x_r > 21'd0 && abs_x > section_limit) begin //Section 4
		coeffs0_r = coeff_4_0;
		coeffs1_r = coeff_4_1;
		coeffs2_r = coeff_4_2;
		coeffs3_r = coeff_4_3;
		coeffs4_r = coeff_4_4;
		coeffs5_r = coeff_4_5;
		coeffs6_r = coeff_4_6;
		coeffs7_r = coeff_4_7;
		coeffs8_r = coeff_4_8;
		coeffs9_r = coeff_4_9;
		coeffs10_r = coeff_4_10;
		mean_r = neg_mean_4;
		std_r = recip_stdev_4;
		section = 3'd4;
	end
	else if(i_x_r > 21'd0 && abs_x <= section_limit) begin //Section 3
		coeffs0_r = coeff_3_0;
		coeffs1_r = coeff_3_1;
		coeffs2_r = coeff_3_2;
		coeffs3_r = coeff_3_3;
		coeffs4_r = coeff_3_4;
		coeffs5_r = coeff_3_5;
		coeffs6_r = coeff_3_6;
		coeffs7_r = coeff_3_7;
		coeffs8_r = coeff_3_8;
		coeffs9_r = coeff_3_9;
		coeffs10_r = coeff_3_10;
		mean_r = neg_mean_3;
		std_r = recip_stdev_3;
		section = 3'd3;
	end
	else if((i_x_r <= 21'd0)  && abs_x <= section_limit) begin //Section 2
		coeffs0_r = coeff_2_0;
		coeffs1_r = coeff_2_1;
		coeffs2_r = coeff_2_2;
		coeffs3_r = coeff_2_3;
		coeffs4_r = coeff_2_4;
		coeffs5_r = coeff_2_5;
		coeffs6_r = coeff_2_6;
		coeffs7_r = coeff_2_7;
		coeffs8_r = coeff_2_8;
		coeffs9_r = coeff_2_9;
		coeffs10_r = coeff_2_10;
		mean_r = neg_mean_2;
		std_r = recip_stdev_2;
		section = 3'd2;
	end
	else if((i_x_r <= 21'd0 )  && abs_x > section_limit) begin //Section 1
		coeffs0_r = coeff_1_0;
		coeffs1_r = coeff_1_1;
		coeffs2_r = coeff_1_2;
		coeffs3_r = coeff_1_3;
		coeffs4_r = coeff_1_4;
		coeffs5_r = coeff_1_5;
		coeffs6_r = coeff_1_6;
		coeffs7_r = coeff_1_7;
		coeffs8_r = coeff_1_8;
		coeffs9_r = coeff_1_9;
		coeffs10_r = coeff_1_10;
		mean_r = neg_mean_1;
		std_r = recip_stdev_1;
		section = 3'd1;
	end
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
			out_r = 20'd0;
			//sum_rst_r = 1'b0;
		end
		S1: begin //convert x from fp to smc
			in_fp_to_smc_r = x_adc;
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
				11: in_add_y_r = coeffs0_r;
				default: in_add_y_r = 0;
			endcase
			add_in_valid_r = 1'b1;
		end
		S6: begin //convert x_lin from smc to fp
			in_smc_to_fp_r = out_add_z_r;
			smc_to_fp_in_valid_r = 1'b1;
		end
		S7: begin //Accumulate sum
			accumulator_r = out_add_z_r;
		end
	endcase
end


////////////////////////////////////////////////////////////////////////////////
//At clock edge

always @(posedge clk) begin
	if(reset == 1'b1) begin
		rst <= reset;
		state <= S0;
	end
	else begin
		rst <= 1'b0;
		state <= next_state;
		in_enable_r <= srdyi;
	end	
end

endmodule

