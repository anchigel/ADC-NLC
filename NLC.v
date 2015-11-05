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
//
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
	o_y,
	o_xnew
);

///////////////////////////////////////////////////////////////////////
//Input & Output
	input i_x;
	input i_clk;
	input i_reset;
	input i_srdyi;
	output o_y;
	output o_xnew;
	
	reg reset;

////////////////////////////////////////////////////////////////////////
//Coefficients, mean, and std regs

//Section 1 coefficients, mean, std
reg section1_negmean = 32'd3356238336;
reg section1_invstd = 32'd955174400;
wire [31:0] section1_coeff_smcfp [0:6];
assign section1_coeff_smcfp[0] = 32'd1100438400;
assign section1_coeff_smcfp[1] = 32'd3247697664;
assign section1_coeff_smcfp[2] = 32'd3258095104;
assign section1_coeff_smcfp[3] = 32'd1128260224;
assign section1_coeff_smcfp[4] = 32'd1148082048;
assign section1_coeff_smcfp[5] = 32'd1189805952;
assign section1_coeff_smcfp[5] = 32'd1205795072;

//Section 2 coefficients, mean, std
reg section2_negmean = 32'd3341858560;
reg section2_invstd = 32'd956637504;
wire [31:0] section2_coeff_smcfp [0:5];
assign section2_coeff_smcfp[0] = 32'd1085389056;
assign section2_coeff_smcfp[1] = 32'd1099873664;
assign section2_coeff_smcfp[2] = 32'd1105653248;
assign section2_coeff_smcfp[3] = 32'd1124319360;
assign section2_coeff_smcfp[4] = 32'd1186917120;
assign section2_coeff_smcfp[5] = 32'd1191718272;

//Section 3 coefficients, mean, std
reg section3_negmean = 32'd1194374912;
reg section3_invstd = 32'd956637504;
wire [31:0] section3_coeff_smcfp [0:5];
assign section3_coeff_smcfp[0] = 32'd1085410688;
assign section3_coeff_smcfp[1] = 32'd3247357952;
assign section3_coeff_smcfp[2] = 32'd1105635968;
assign section3_coeff_smcfp[3] = 32'd3271802880;
assign section3_coeff_smcfp[4] = 32'd1186917120;
assign section3_coeff_smcfp[5] = 32'd3339202048;

//Section 4 coefficients, mean, std
reg section4_negmean = 32'd1194374912;
reg section4_invstd = 32'd956637504;
wire [31:0] section4_coeff_smcfp [0:6];
assign section4_coeff_smcfp[0] = 32'd3247953664;
assign section4_coeff_smcfp[1] = 32'd3247687168;
assign section4_coeff_smcfp[2] = 32'd1110671616;
assign section4_coeff_smcfp[3] = 32'd1128256640;
assign section4_coeff_smcfp[4] = 32'd3295569408;
assign section4_coeff_smcfp[5] = 32'd1189805952;
assign section4_coeff_smcfp[6] = 32'd3353278720;

/////////////////////////////////////////////////////////////////////////
//Convert input i_x to smc floating point
wire x_new_w;
wire convert_to_smc_out_valid_w;

fp_to_smc_float convert_to_smc(
	.clk(i_clk),
	.GlobalReset(reset),
	.y_o_portx(x_new_w),
	.x_i(i_x),
	.srdyo_o(convert_to_smc_out_valid_w),
	.srdyi_i(i_srdyi)
);

/////////////////////////////////////////////////////////////////////////////
//Instatiate multiplier
wire in_mul_x_w;
wire in_mul_y_w;
wire out_mul_z_w;
reg mul_in_valid_r;
wire multiply_out_valid_w;

smc_float_multiplier multiply(
	.clk(i_clk),
	.GlobalReset(reset),
	.x_i_porty(in_mul_x_w),
	.y_i_porty(in_mul_y_w),
	.z_i_porty(out_mul_z_w),
	.srdyi_i(mul_in_valid_r),
	.srdyo_o(multiply_out_valid_w)
);

//////////////////////////////////////////////////////////////////////////////
//Instatiate adder
wire in_add_x_w;
wire in_add_y_w;
wire out_add_z_w;
wire add_out_valid_w;
reg add_in_valid_r;

smc_float_adder add(
	.clk(i_clk),
	.GlobalReset(reset),
	.x_i_porty(in_add_x_w),
	.y_i_porty(in_add_y_w),
	.z_i_porty(out_add_z_w),
	.srdyi_i(add_in_valid_r),
	.srdyo_o(add_out_valid_w)
);

//////////////////////////////////////////////////////////////////////////
//Determine section of polynomial
reg section;
reg x_new_final_r;
reg x_ready_r;
reg in_mul_x_r;
reg in_mul_y_r;
reg in_add_x_r;
reg in_add_y_r;
assign in_add_x_w = in_add_x_r;
assign in_add_y_w = in_add_y_r;
assign in_mul_x_w = in_mul_x_r;
assign in_mul_y_w = in_mul_y_r;
assign o_xnew = x_new_final_r;

always @(*) begin
	if(i_srdyi == 1'b1) begin
		x_ready_r = 1'b0;
		if(i_x <= -21'd44978) begin
			section = 2'd1;
			//precondition x
			in_add_x_r = x_new_w;
			in_add_y_r = section1_negmean;
			add_in_valid_r = 1'b1;
			//wait for adder to finish
			while(add_out_valid_w != 1'b1) begin end		
			if(add_out_valid_w == 1'b1) begin
				add_in_valid_r = 1'b0;
				in_mul_x_r = out_add_z_w;
				in_mul_y_r = section1_invstd;
				mul_in_valid_r = 1'b1;
				//wait for multiply to finish
				while(multiply_out_valid_w != 1'b1) begin end		
				if(multiply_out_valid_w == 1'b1) begin
					mul_in_valid_r = 1'b0;
					x_new_final_r = out_mul_z_w;
					x_ready_r = 1'b1;
				end
			end
		end
		else if(i_x <= 21'd0 && i_x > -21'd44978) begin
			section = 2'd2;
			//precondition x
			in_add_x_r = x_new_w;
			in_add_y_r = section2_negmean;
			add_in_valid_r = 1'b1;
			//wait for adder to finish
			while(add_out_valid_w != 1'b1) begin end		
			if(add_out_valid_w == 1'b1) begin
				add_in_valid_r = 1'b0;
				in_mul_x_r = out_add_z_w;
				in_mul_y_r = section2_invstd;
				mul_in_valid_r = 1'b1;
				//wait for multiply to finish
				while(multiply_out_valid_w != 1'b1) begin end		
				if(multiply_out_valid_w == 1'b1) begin
					mul_in_valid_r = 1'b0;
					x_new_final_r = out_mul_z_w;
					x_ready_r = 1'b1;
				end
			end
		end
		else if(i_x <= 21'd44978 && i_x > 21'd0) begin
			section = 2'd3;
			//precondition x
			in_add_x_r = x_new_w;
			in_add_y_r = section3_negmean;
			add_in_valid_r = 1'b1;
			//wait for adder to finish
			while(add_out_valid_w != 1'b1) begin end		
			if(add_out_valid_w == 1'b1) begin
				add_in_valid_r = 1'b0;
				in_mul_x_r = out_add_z_w;
				in_mul_y_r = section3_invstd;
				mul_in_valid_r = 1'b1;
				//wait for multiply to finish
				while(multiply_out_valid_w != 1'b1) begin end		
				if(multiply_out_valid_w == 1'b1) begin
					mul_in_valid_r = 1'b0;
					x_new_final_r = out_mul_z_w;
					x_ready_r = 1'b1;
				end
			end
		end
		else if(i_x > 21'd44978) begin
			section = 2'd4;	
			//precondition x
			in_add_x_r = x_new_w;
			in_add_y_r = section4_negmean;
			add_in_valid_r = 1'b1;
			//wait for adder to finish
			while(add_out_valid_w != 1'b1) begin end		
			if(add_out_valid_w == 1'b1) begin
				add_in_valid_r = 1'b0;
				in_mul_x_r = out_add_z_w;
				in_mul_y_r = section4_invstd;
				mul_in_valid_r = 1'b1;
				//wait for multiply to finish
				while(multiply_out_valid_w != 1'b1) begin end		
				if(multiply_out_valid_w == 1'b1) begin
					mul_in_valid_r = 1'b0;
					x_new_final_r = out_mul_z_w;
					x_ready_r = 1'b1;
				end
			end
		end
	end
end

///////////////////////////////////////////////////////////////////////////////
//Control
reg accumulator;
reg coeff;
reg loops_taken;
reg nloops_r;
reg out;
assign o_y = out;
integer i;

always @(*) begin
	case(section)
		2'd1: nloops_r = 7;
		2'd2: nloops_r = 6;
		2'd3: nloops_r = 6;
		2'd4: nloops_r = 7;
	endcase
end

always @(*) begin

	for(i = 0; i < nloops_r; i = i+1) begin
		//Select coefficients based on section
		case(section)
			2'd1: coeff = section1_coeff_smcfp[i];
			2'd2: coeff = section2_coeff_smcfp[i];
			2'd3: coeff = section3_coeff_smcfp[i];
			2'd4: coeff = section4_coeff_smcfp[i];
		endcase
		
		//Assign values to inputs of multiplier
		if(x_ready_r == 1'b1) begin
			in_mul_x_r = x_new_final_r;
			in_mul_y_r = accumulator;
			mul_in_valid_r = 1'b1;
			//When multiplier is done, assign value to inputs of adder
			while(multiply_out_valid_w != 1'b1) begin end				
			if(multiply_out_valid_w == 1) begin
				mul_in_valid_r = 1'b0;
				in_add_x_r = out_mul_z_w;
				in_add_y_r = coeff;
				add_in_valid_r = 1'b1;
				//when adder is done, put into accumulator
				while(add_out_valid_w != 1'b1) begin end	
				if(add_out_valid_w == 1'b1) begin
					add_in_valid_r = 1'b0;
					accumulator = accumulator + out_add_z_w;
					loops_taken = loops_taken + 1;
				end
			end
		end
	end	
	
	//output sum from accumulator
	out = accumulator;
end

////////////////////////////////////////////////////////////////////////////////
//At clock edge
always @(posedge i_clk) begin
	if(i_reset == 1'b1)
		reset <= 1'b1;
end

endmodule

