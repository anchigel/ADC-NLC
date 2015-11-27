///////////////////////////////////////////////////////////////////////
// ADC Non-linearity Correction Engine
//
// EEM216A Fall 2015
//
// Anchi Su
// Giovoni King
//
// Description: ADC Non-linearity Correction Engine - 1 channel
//				4 sections, 10th order
///////////////////////////////////////////////////////////////////////

module NLC_4sec_10th_1ch(

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
	coeff_1_0
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
	
	//Reset
	reg rst;
	reg in_enable_r;
	wire in_enable_w;
	assign in_enable_w = in_enable_r;
	
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
	wire [31:0] accumulator_w;
	assign accumulator_w = accumulator_r;
	
	integer loops_taken_r;
	integer nloops_r;

	//Output
	reg [20:0] out_r;
	wire [20:0] out_w;
	assign out_w = out_r;
	assign x_lin = out_r;

	//Output enable
	reg out_enable_r;
	assign srdyo = out_enable_r;
	
	//Convert x to smc
	wire [31:0] x_new_w;
	wire convert_to_smc_out_valid_w;
	reg [20:0] in_fp_to_smc_r;
	reg fp_to_smc_in_valid_r;
	reg [31:0] x_new_final_r;
	wire [31:0] x_new_final_w;
	assign x_new_final_w = x_new_final_r;
	
	//Convert y to fp
	wire convert_to_fp_out_valid_w;
	wire [20:0] out_smc_to_fp_w;
	reg [31:0] in_smc_to_fp_r;
	reg smc_to_fp_in_valid_r;
	
	//Multiplier
	wire [31:0] out_mul_z_w;
	wire multiply_out_valid_w;
	reg mul_in_valid_r;
	reg [31:0] in_mul_x_r;
	reg [31:0] in_mul_y_r;

	//Adder
	wire add_out_valid_w;
	reg add_in_valid_r;
	reg [31:0] in_add_x_r;
	reg [31:0] in_add_y_r;
	wire [31:0] out_add_z_w;
	
	//Parameters
	parameter S0 = 4'b0000; 
	parameter S1 = 4'b0001; 
	parameter S2 = 4'b0010;
	parameter S3 = 4'b0011; 
	parameter S4 = 4'b0100; 
	parameter S5 = 4'b0101; 
	parameter S6 = 4'b0110;
	parameter S7 = 4'b0111; 
	parameter S8 = 4'b1000; 
	parameter S9 = 4'b1001; 
	parameter S10 = 4'b1010; 
	parameter S11 = 4'b1011; 
	parameter S12 = 4'b1100; 
	parameter S13 = 4'b1101; 
	parameter S14 = 4'b1110; 
	parameter S15 = 4'b1111; 
	
	parameter order = 4'd10;
	
	//States
	reg [3:0] state;
	reg [3:0] next_state;
	
	reg [20:0] abs_x;
	reg [31:0] i_x_r;

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

always @(*) begin
	case(state) 
		S0: begin
			out_enable_r = 1'b0;
			loops_taken_r = 0;
			fp_to_smc_in_valid_r = 1'b0;
			smc_to_fp_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_mul_x_r = 32'd0;
			in_mul_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = 21'd0;
			x_new_final_r = 32'd0;
			accumulator_r = 32'd0;

			if(srdyi == 1'b1)
				in_enable_r = 1'b1;
			else
				in_enable_r = in_enable_w;
			if(in_enable_r == 1'b1) //convert x to smc 
				next_state = S1;
			else
				next_state = S0;
		end
		S1: begin
			next_state = S2;
			in_fp_to_smc_r = i_x_r;
			fp_to_smc_in_valid_r = 1'b1;
			in_enable_r = 1'b0;
			
			out_enable_r = 1'b0;
			loops_taken_r = 0;
			smc_to_fp_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_mul_x_r = 32'd0;
			in_mul_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			out_r = out_w;
			x_new_final_r = x_new_final_w;
			accumulator_r = accumulator_w;
		end
		S2: begin //when output ready, send to adder
			if(convert_to_smc_out_valid_w == 1'b1) begin
				next_state = S3;
				in_add_x_r = x_new_w;
				in_add_y_r = mean_r;
				add_in_valid_r = 1'b1;
				fp_to_smc_in_valid_r = 1'b0;
			end
			else begin
				next_state = S2;
				fp_to_smc_in_valid_r = 1'b0;
				add_in_valid_r = 1'b0;
				in_add_x_r = 32'd0;
				in_add_y_r = 32'd0;
			end
			
			out_enable_r = 1'b0;
			loops_taken_r = 0;
			smc_to_fp_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			in_mul_x_r = 32'd0;
			in_mul_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = out_w;
			x_new_final_r = x_new_final_w;
			accumulator_r = accumulator_w;
			in_enable_r = in_enable_w;
		end
		S3: begin //when adder output ready, send to multiplier
			if(add_out_valid_w == 1'b1) begin
				next_state = S4;
				in_mul_x_r = out_add_z_w;
				in_mul_y_r = std_r;
				mul_in_valid_r = 1'b1;
				add_in_valid_r = 1'b0;
			end
			else begin
				next_state = S3;
				add_in_valid_r = 1'b0;
				mul_in_valid_r = 1'b0;
				in_mul_x_r = 32'd0;
				in_mul_y_r = 32'd0;
			end
			
			out_enable_r = 1'b0;
			loops_taken_r = 0;
			fp_to_smc_in_valid_r = 1'b0;
			smc_to_fp_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = out_w;
			x_new_final_r = x_new_final_w;
			accumulator_r = accumulator_w;
			in_enable_r = in_enable_w;
		end
		S4: begin //when multiplier output ready, send back to multiplier with accumulator
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S5;
				x_new_final_r = out_mul_z_w;
				in_mul_x_r = x_new_final_r;
				in_mul_y_r = accumulator_r;
				mul_in_valid_r = 1'b1;
			end
			else begin
				next_state = S4;
				mul_in_valid_r = 1'b0;
				in_mul_x_r = 32'd0;
				in_mul_y_r = 32'd0;
				x_new_final_r = x_new_final_w;
			end
			
			out_enable_r = 1'b0;
			loops_taken_r = 0;
			fp_to_smc_in_valid_r = 1'b0;
			smc_to_fp_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = out_w;
			accumulator_r = accumulator_w;
			in_enable_r = in_enable_w;
		end
		S5: begin
			next_state = S6;
			loops_taken_r = loops_taken_r + 1;
			mul_in_valid_r = 1'b0;
			
			out_enable_r = 1'b0;
			fp_to_smc_in_valid_r = 1'b0;
			smc_to_fp_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_mul_x_r = 32'd0;
			in_mul_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = out_w;
			x_new_final_r = x_new_final_w;
			accumulator_r = accumulator_w;
			in_enable_r = in_enable_w;
		end
		S6: begin //multiply x and current accumulator
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S7;
				in_add_x_r = out_mul_z_w;
				case(loops_taken_r)
					1: begin 
						in_add_y_r = coeffs10_r;
						loops_taken_r = 1;
					end
					2: begin
						in_add_y_r = coeffs9_r;
						loops_taken_r = 2;
					end
					3: begin
						in_add_y_r = coeffs8_r;
						loops_taken_r = 3;
					end
					4: begin
						in_add_y_r = coeffs7_r;
						loops_taken_r = 4;
					end
					5: begin
						in_add_y_r = coeffs6_r;
						loops_taken_r = 5;
					end
					6: begin
						in_add_y_r = coeffs5_r;
						loops_taken_r = 6;
					end
					7: begin
						in_add_y_r = coeffs4_r;
						loops_taken_r = 7;
					end
					8: begin
						in_add_y_r = coeffs3_r;
						loops_taken_r = 8;
					end
					9: begin
						in_add_y_r = coeffs2_r;
						loops_taken_r = 9;
					end
					10: begin
						in_add_y_r = coeffs1_r;
						loops_taken_r = 10;
					end
					11: begin
						in_add_y_r = coeffs0_r;
						loops_taken_r = 11;
					end
					default: begin
						in_add_y_r = 0;
						loops_taken_r = 0;
					end
				endcase
				add_in_valid_r = 1'b1;
			end
			else begin
				next_state = S6;
				add_in_valid_r = 1'b0;
				in_add_x_r = 32'd0;
				in_add_y_r = 32'd0;
			end
			
			out_enable_r = 1'b0;
			case(loops_taken_r)
				1: loops_taken_r = 1;
				2: loops_taken_r = 2;
				3: loops_taken_r = 3;
				4: loops_taken_r = 4;
				5: loops_taken_r = 5;
				6: loops_taken_r = 6;
				7: loops_taken_r = 7;
				8: loops_taken_r = 8;
				9: loops_taken_r = 9;
				10: loops_taken_r = 10;
				11: loops_taken_r = 11;
				default: loops_taken_r = 0;
			endcase
			fp_to_smc_in_valid_r = 1'b0;	
			smc_to_fp_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			in_mul_x_r = 32'd0;
			in_mul_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = out_w;
			x_new_final_r = x_new_final_w;
			accumulator_r = accumulator_w;
			in_enable_r = in_enable_w;
		end
		S7: begin //add coeff to product
			if(add_out_valid_w == 1'b1) begin
				accumulator_r = out_add_z_w;
				if(loops_taken_r > order) begin
					next_state = S8;
					in_smc_to_fp_r = accumulator_r;	
					smc_to_fp_in_valid_r = 1'b1;
					mul_in_valid_r = 1'b0;
					in_mul_x_r = 32'd0;
					in_mul_y_r = 32'd0;
				end
				else begin
					next_state = S5;
					in_mul_x_r = x_new_final_r;
					in_mul_y_r = accumulator_r;
					mul_in_valid_r = 1'b1;
					smc_to_fp_in_valid_r = 1'b0;
					in_smc_to_fp_r = 32'd0;
				end
				add_in_valid_r = 1'b0;
			end
			else begin
				next_state = S7;	
				add_in_valid_r = 1'b0;
				smc_to_fp_in_valid_r = 1'b0;
				mul_in_valid_r = 1'b0;
				in_mul_x_r = 32'd0;
				in_mul_y_r = 32'd0;
				in_smc_to_fp_r = 32'd0;
				accumulator_r = accumulator_w;
			end
			
			out_enable_r = 1'b0;
			case(loops_taken_r)
				1: loops_taken_r = 1;
				2: loops_taken_r = 2;
				3: loops_taken_r = 3;
				4: loops_taken_r = 4;
				5: loops_taken_r = 5;
				6: loops_taken_r = 6;
				7: loops_taken_r = 7;
				8: loops_taken_r = 8;
				9: loops_taken_r = 9;
				10: loops_taken_r = 10;
				11: loops_taken_r = 11;
				default: loops_taken_r = 0;
			endcase
			fp_to_smc_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = out_w;
			x_new_final_r = x_new_final_w;
			in_enable_r = in_enable_w;
		end
		S8: begin
			if(convert_to_fp_out_valid_w == 1'b1) begin
				out_r = out_smc_to_fp_w;
				out_enable_r = 1'b1;
				next_state = S0;
				smc_to_fp_in_valid_r = 1'b0;
			end
			else begin
				next_state = S8;
				smc_to_fp_in_valid_r = 1'b0;
				out_enable_r = 1'b0;
				out_r = out_w;
			end
			
			case(loops_taken_r)
				1: loops_taken_r = 1;
				2: loops_taken_r = 2;
				3: loops_taken_r = 3;
				4: loops_taken_r = 4;
				5: loops_taken_r = 5;
				6: loops_taken_r = 6;
				7: loops_taken_r = 7;
				8: loops_taken_r = 8;
				9: loops_taken_r = 9;
				10: loops_taken_r = 10;
				11: loops_taken_r = 11;
				default: loops_taken_r = 0;
			endcase
			fp_to_smc_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_mul_x_r = 32'd0;
			in_mul_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			x_new_final_r = x_new_final_w;
			accumulator_r = accumulator_w;
			in_enable_r = in_enable_w;
		end
		default: begin
			next_state = S0; //Should never hit this case
			out_enable_r = 1'b0;
			loops_taken_r = 0;
			fp_to_smc_in_valid_r = 1'b0;
			smc_to_fp_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			in_add_x_r = 32'd0;
			in_add_y_r = 32'd0;
			in_mul_x_r = 32'd0;
			in_mul_y_r = 32'd0;
			in_smc_to_fp_r = 32'd0;
			in_fp_to_smc_r = 21'd0;
			out_r = out_w;
			x_new_final_r = x_new_final_w;
			accumulator_r = accumulator_w;
			in_enable_r = in_enable_w;
		end
		endcase
end


////////////////////////////////////////////////////////////////////////////
//Determine section
always @(*) begin
	//Get abs of x_adc
		if(i_x_r[20] == 1'b1) begin
			abs_x = -i_x_r;
			//abs_x = {1'b0, ~i_x_r} + 1;
		end
		else begin
			abs_x = i_x_r;
		end
		
		//Determine which coeffs, mean, and std to use
		if(i_x_r[20] == 1'b0 && i_x_r != 21'd0 && abs_x > section_limit) begin //Section 4
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
		end
		else if(i_x_r[20] == 1'b0 && i_x_r != 21'd0 && abs_x <= section_limit) begin //Section 3
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
		end
		else if((i_x_r[20] == 1'b1 || i_x_r == 21'd0)  && abs_x <= section_limit) begin //Section 2
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
		end
		else if((i_x_r[20] == 1'b1 || i_x_r == 21'd0)  && abs_x > section_limit) begin //Section 1
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
		end
		else begin //Should never hit this case
			coeffs0_r = 32'd0;
			coeffs1_r = 32'd0;
			coeffs2_r = 32'd0;
			coeffs3_r = 32'd0;
			coeffs4_r = 32'd0;
			coeffs5_r = 32'd0;
			coeffs6_r = 32'd0;
			coeffs7_r = 32'd0;
			coeffs8_r = 32'd0;
			coeffs9_r = 32'd0;
			coeffs10_r = 32'd0;
			mean_r = 32'd0;
			std_r = 32'd0;
		end			
	end

////////////////////////////////////////////////////////////////////////////////
//At clock edge

always @(posedge clk) begin
	if(reset == 1'b1) begin
		rst <= reset;
		state <= S0;
		if(srdyi == 1'b1) 
			i_x_r = x_adc;
		else
			i_x_r = i_x_r;
	end
	else begin
		rst <= reset;
		state <= next_state;
		if(srdyi == 1'b1) 
			i_x_r = x_adc;
		else
			i_x_r = i_x_r;
	end	
end

endmodule

