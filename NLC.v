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
	o_y,
	o_xnew,
	o_srdyo,
	o_state,
	o_section,
	o_accum
);

///////////////////////////////////////////////////////////////////////
//Input & Output
	input [20:0] i_x;
	input i_clk;
	input i_reset;
	input i_srdyi;
	output [31:0] o_y;
	output [31:0] o_xnew;
	output o_srdyo;
	output [2:0]o_state;
	output [1:0]o_section;
	output [31:0] o_accum;
	
	//Reset
	reg reset;
	
	//Accumulator loop
	reg [31:0] accumulator_r;
	reg coeff_r;
	integer loops_taken_r;
	integer nloops_r;

	//Output
	reg [31:0] out_r;
	//reg [31:0] out_2_r;
	//wire [31:0] out_2_w;
	assign o_y = out_r;

	//Output enable
	//reg out_enable;
	reg out_enable_r;
	assign out_enable_w = out_enable_r;
	assign o_srdyo = out_enable_w;

	//integer i;
	
	//Convert x to smc
	reg [20:0] x_in_r;
	wire [31:0] x_new_w;
	wire convert_to_smc_out_valid_w;
	//wire [20:0] in_fp_to_smc_w;
	reg [20:0] in_fp_to_smc_r;
	//wire fp_to_smc_in_valid_w;
	reg fp_to_smc_in_valid_r;
	//assign in_fp_to_smc_w = in_fp_to_smc_r;
	//assign fp_to_smc_in_valid_w = fp_to_smc_in_valid_r;
	
	//Convert y to fp
	wire convert_to_fp_out_valid_w;
	wire [20:0] out_smc_to_fp_w;
	//wire [31:0] in_smc_to_fp_w;
	reg [31:0] in_smc_to_fp_r;
	//wire smc_to_fp_in_valid_w;
	reg smc_to_fp_in_valid_r;
	//assign smc_to_fp_in_valid_w = smc_to_fp_in_valid_r;
	
	//Multiplier
	//wire [31:0] in_mul_x_w;
	//wire [31:0] in_mul_y_w;
	wire [31:0] out_mul_z_w;
	//wire mul_in_valid_w;
	wire multiply_out_valid_w;
	reg mul_in_valid_r;
	reg [31:0] in_mul_x_r;
	reg [31:0] in_mul_y_r;
	reg [31:0] out_mul_z_r;
	//assign in_mul_x_w = in_mul_x_r;
	//assign in_mul_y_w = in_mul_y_r;
	//assign mul_in_valid_w = mul_in_valid_r;

	//Adder
	//wire [31:0] in_add_x_w;
	//wire [31:0] in_add_y_w;
	wire [31:0] out_add_z_w;
	wire add_out_valid_w;
	//wire add_in_valid_w;
	reg add_in_valid_r;
	reg [31:0] in_add_x_r;
	reg [31:0] in_add_y_r;
	reg [31:0] out_add_z_r;
	//assign in_add_x_w = in_add_x_r;
	//assign in_add_y_w = in_add_y_r;
	//assign add_in_valid_w = add_in_valid_r;
	
	//Determine sections
	reg [1:0] section_r;
	reg [31:0] x_new_final_r;
	reg [31:0] x_ready_r;
	reg [31:0] in_enable_r;
	assign o_xnew = x_new_final_r;
	
	//Parameters
	parameter S0 = 3'b000; //wait for x input 
	parameter S1 = 3'b001; //determine section and wait for fp to smc conversion
	parameter S2 = 3'b010; //precondition x -> add -mean
	parameter S3 = 3'b011; //precondition x -> multiply 1/std
	parameter S4 = 3'b100; //multiple x with sum
	parameter S5 = 3'b101; //add sum to coeff
	parameter S6 = 3'b110; //accumulate
	parameter S7 = 3'b111; //convert y to fp
	
	parameter section1_ub = -21'd44978;
	parameter section2_ub = 21'd0;
	parameter section3_ub = 21'd44978;
	
	//States
	reg [2:0] state;
	reg [2:0] next_state;
	assign o_state = state;
	assign o_section = section_r;
	assign o_accum = accumulator_r;

////////////////////////////////////////////////////////////////////////
//Coefficients, mean, and std regs

//Section 1 coefficients, mean, std
wire [31:0] section1_negmean = 32'd3356238336;
wire [31:0] section1_invstd = 32'd955174400;
wire [31:0] section1_coeff_smcfp [0:6];
assign section1_coeff_smcfp[0] = 32'd1100438400;
assign section1_coeff_smcfp[1] = 32'd3247697664;
assign section1_coeff_smcfp[2] = 32'd3258095104;
assign section1_coeff_smcfp[3] = 32'd1128260224;
assign section1_coeff_smcfp[4] = 32'd1148082048;
assign section1_coeff_smcfp[5] = 32'd1189805952;
assign section1_coeff_smcfp[5] = 32'd1205795072;

//Section 2 coefficients, mean, std
wire [31:0] section2_negmean = 32'd3341858560;
wire [31:0] section2_invstd = 32'd956637504;
wire [31:0] section2_coeff_smcfp [0:5];
assign section2_coeff_smcfp[0] = 32'd1085389056;
assign section2_coeff_smcfp[1] = 32'd1099873664;
assign section2_coeff_smcfp[2] = 32'd1105653248;
assign section2_coeff_smcfp[3] = 32'd1124319360;
assign section2_coeff_smcfp[4] = 32'd1186917120;
assign section2_coeff_smcfp[5] = 32'd1191718272;

//Section 3 coefficients, mean, std
wire [31:0] section3_negmean = 32'd1194374912;
wire [31:0] section3_invstd = 32'd956637504;
wire [31:0] section3_coeff_smcfp [0:5];
assign section3_coeff_smcfp[0] = 32'd1085410688;
assign section3_coeff_smcfp[1] = 32'd3247357952;
assign section3_coeff_smcfp[2] = 32'd1105635968;
assign section3_coeff_smcfp[3] = 32'd3271802880;
assign section3_coeff_smcfp[4] = 32'd1186917120;
assign section3_coeff_smcfp[5] = 32'd3339202048;

//Section 4 coefficients, mean, std
wire [31:0] section4_negmean = 32'd1194374912;
wire [31:0] section4_invstd = 32'd956637504;
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
	.y_o(out_smc_to_fp_w),
	.x_i_porty(in_smc_to_fp_r),
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
		S1: begin
			if(convert_to_smc_out_valid_w == 1'b1) begin
				next_state = S2;
				//fp_to_smc_in_valid_r = 1'b0;
				//reset = 1'b1;
			end
			else begin
				//reset = 1'b0;
				next_state = S1;
			end
		end
		S2: begin
			if(add_out_valid_w == 1'b1) begin
				next_state = S3;
				out_add_z_r = out_add_z_w;
				//add_in_valid_r = 1'b0;
				//reset = 1'b1;
				//mul_in_valid_r = 1'b0;
			end
			else begin
				next_state = S2;
				//reset = 1'b0;
			end
		end
		S3: begin
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S4;
				//add_in_valid_r = 1'b0;
				//mul_in_valid_r = 1'b0;
				x_new_final_r = out_mul_z_w;
				//reset = 1'b1;
			end
			else begin
				next_state = S3;	
				//reset = 1'b0;
			end
		end
		S4: begin
			if(multiply_out_valid_w == 1'b1) begin
				next_state = S5;
				out_mul_z_r = out_mul_z_w;
				//add_in_valid_r = 1'b0;
				//mul_in_valid_r = 1'b0;
				//reset = 1'b1;
			end
			else begin
				next_state = S4;
				//reset = 1'b0;
			end
		end
		S5: begin
			if(add_out_valid_w == 1'b1) begin
				next_state = S6;
				out_add_z_r = out_add_z_w;
				//add_in_valid_r = 1'b0;
				//mul_in_valid_r = 1'b0;
				//reset = 1'b1;
			end
			else begin
				next_state = S5;	
				//reset = 1'b0;
			end
		end
		S6: begin
			if(loops_taken_r == nloops_r) begin
				//reset = 1'b1;
				next_state = S7;
			end
			else if(add_out_valid_w == 1'b1) begin
				out_add_z_r = out_add_z_w;
				accumulator_r = out_add_z_r;
				loops_taken_r = loops_taken_r + 1;	
				if(loops_taken_r == nloops_r)
					next_state = S7;
				else
					next_state = S4;
				//reset = 1'b1;
				//add_in_valid_r = 1'b0;
				//mul_in_valid_r = 1'b0;		
			end
			else begin
				next_state = S6;
				reset = 1'b0;
			end
		end
		S7: begin
			if(convert_to_fp_out_valid_w == 1'b1) begin
				next_state = S0;
				out_r = out_smc_to_fp_w;
				out_enable_r = 1'b1;
				//reset = 1'b1;
			end
			else begin
				next_state = S7;
				//reset = 1'b0;
			end
		end
	endcase
end

///////////////////////////////////////////////////////////////////////////
//State logic
always @(*) begin
	if(x_in_r < section1_ub) begin
		section_r = 2'd0;
		nloops_r = 7;
	end
	else if((x_in_r < section2_ub) && (x_in_r >= section1_ub)) begin
		section_r = 2'd1;
		nloops_r = 6;
	end
	else if((x_in_r < section3_ub) && (x_in_r >= section2_ub)) begin
		section_r = 2'd2;
		nloops_r = 6;
	end
	else if(x_in_r >= section3_ub) begin
		section_r = 2'd3;
		nloops_r = 7;
	end
end

always @(state) begin
	case(state) 
		S0: begin //initial state
			out_enable_r = 1'b0;
			x_ready_r = 1'b0;
			fp_to_smc_in_valid_r = 1'b0;
			add_in_valid_r = 1'b0;
			mul_in_valid_r = 1'b0;
			loops_taken_r = 0;
			accumulator_r = 32'd0;
			smc_to_fp_in_valid_r = 1'b0;
		end
		S1: begin //onvert x from fp to smc
			in_fp_to_smc_r = x_in_r;
			fp_to_smc_in_valid_r = 1'b1;
		end
		S2: begin //add -mean to x
			case(section_r)
				2'd0: begin
					in_add_x_r = x_new_w;
					in_add_y_r = section1_negmean;
					add_in_valid_r = 1'b1;
				end
				2'd1: begin
					in_add_x_r = x_new_w;
					in_add_y_r = section2_negmean;
					add_in_valid_r = 1'b1;
				end
				2'd2: begin
					in_add_x_r = x_new_w;
					in_add_y_r = section2_negmean;
					add_in_valid_r = 1'b1;
				end
				2'd3: begin
					in_add_x_r = x_new_w;
					in_add_y_r = section2_negmean;
					add_in_valid_r = 1'b1;
				end
			endcase
		end
		S3: begin //multiply 1/std and x-mean
			case(section_r)
				2'd0: begin
					in_mul_x_r = out_add_z_r;
					in_mul_y_r = section1_invstd;
					mul_in_valid_r = 1'b1;
				end
				2'd1: begin
					in_mul_x_r = out_add_z_r;
					in_mul_y_r = section2_invstd;
					mul_in_valid_r = 1'b1;
				end
				2'd2: begin
					in_mul_x_r = out_add_z_r;
					in_mul_y_r = section3_invstd;
					mul_in_valid_r = 1'b1;
				end
				2'd3: begin
					in_mul_x_r = out_add_z_r;
					in_mul_y_r = section3_invstd;
					mul_in_valid_r = 1'b1;
				end
			endcase
		end
		S4: begin //multiple current sum and x
			in_mul_x_r = x_new_final_r;
			in_mul_y_r = accumulator_r;
			mul_in_valid_r = 1'b1;
		end
		S5: begin //add coeff and product
			case(section_r)
				2'd0: coeff_r = section1_coeff_smcfp[nloops_r - loops_taken_r - 1];
				2'd1: coeff_r = section2_coeff_smcfp[nloops_r - loops_taken_r - 1];
				2'd2: coeff_r = section3_coeff_smcfp[nloops_r - loops_taken_r - 1];
				2'd3: coeff_r = section4_coeff_smcfp[nloops_r - loops_taken_r - 1];
			endcase
			in_add_x_r = out_mul_z_r;
			in_add_y_r = coeff_r;
			add_in_valid_r = 1'b1;
		end
		S6: begin //Accumulate sum
			in_add_x_r = accumulator_r;
			in_add_y_r = out_add_z_r;
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
		x_in_r <= i_x;
		//out_enable <= out_enable_w;
		//out_2_r <= out_2_w;
	end	
end

endmodule

