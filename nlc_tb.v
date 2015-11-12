`timescale 1ns/100ps

module NLC_tb();

	reg [20:0] i_x_tb;
	reg i_clk_tb;
	reg i_reset_tb;
	reg i_srdyi_tb;
	wire [31:0]o_y_tb;
	wire o_srdyo_tb;
	wire [2:0] o_state_tb;
	wire [31:0] o_accum_tb;
	wire [31:0] o_test_tb;
	reg [31:0] i_coeffs1_tb;
	reg [31:0] i_coeffs2_tb;
	reg [31:0] i_coeffs3_tb;
	reg [31:0] i_coeffs4_tb;
	reg [31:0] i_coeffs5_tb;
	reg [31:0] i_coeffs6_tb;
	reg [31:0] i_coeffs7_tb;
	reg [31:0] i_coeffs8_tb;
	reg [31:0] i_coeffs9_tb;
	reg [31:0] i_coeffs10_tb;
	reg [31:0] i_mean_tb;
	reg [31:0] i_std_tb;
	
	wire	[3:0]	test_instruction;
	
	//Section 1 coefficients, mean, std
	wire [31:0] section1_negmean = 32'd3356238336;
	wire [31:0] section1_invstd = 32'd955174400;
	wire [31:0] section1_coeff_smcfp [0:9];
	assign section1_coeff_smcfp[6] = 32'd1100438400;
	assign section1_coeff_smcfp[5] = 32'd3247697664;
	assign section1_coeff_smcfp[4] = 32'd3258095104;
	assign section1_coeff_smcfp[3] = 32'd1128260224;
	assign section1_coeff_smcfp[2] = 32'd1148082048;
	assign section1_coeff_smcfp[1] = 32'd1189805952;
	assign section1_coeff_smcfp[0] = 32'd1205795072;
	assign section1_coeff_smcfp[7] = 32'd0;
	assign section1_coeff_smcfp[8] = 32'd0;
	assign section1_coeff_smcfp[9] = 32'd0;

	//Section 2 coefficients, mean, std
	wire [31:0] section2_negmean = 32'd3341858560;
	wire [31:0] section2_invstd = 32'd956637504;
	wire [31:0] section2_coeff_smcfp [0:9];
	assign section2_coeff_smcfp[5] = 32'd1085389056;
	assign section2_coeff_smcfp[4] = 32'd1099873664;
	assign section2_coeff_smcfp[3] = 32'd1105653248;
	assign section2_coeff_smcfp[2] = 32'd1124319360;
	assign section2_coeff_smcfp[1] = 32'd1186917120;
	assign section2_coeff_smcfp[0] = 32'd1191718272;
	assign section2_coeff_smcfp[6] = 32'd0;
	assign section2_coeff_smcfp[7] = 32'd0;
	assign section2_coeff_smcfp[8] = 32'd0;
	assign section2_coeff_smcfp[9] = 32'd0;

	//Section 3 coefficients, mean, std
	wire [31:0] section3_negmean = 32'd1194374912;
	wire [31:0] section3_invstd = 32'd956637504;
	wire [31:0] section3_coeff_smcfp [0:9];
	assign section3_coeff_smcfp[5] = 32'd1085410688;
	assign section3_coeff_smcfp[4] = 32'd3247357952;
	assign section3_coeff_smcfp[3] = 32'd1105635968;
	assign section3_coeff_smcfp[2] = 32'd3271802880;
	assign section3_coeff_smcfp[1] = 32'd1186917120;
	assign section3_coeff_smcfp[0] = 32'd3339202048;
	assign section3_coeff_smcfp[6] = 32'd0;
	assign section3_coeff_smcfp[7] = 32'd0;
	assign section3_coeff_smcfp[8] = 32'd0;
	assign section3_coeff_smcfp[9] = 32'd0;

	//Section 4 coefficients, mean, std
	wire [31:0] section4_negmean = 32'd1194374912;
	wire [31:0] section4_invstd = 32'd956637504;
	wire [31:0] section4_coeff_smcfp [0:9];
	assign section4_coeff_smcfp[6] = 32'd3247953664;
	assign section4_coeff_smcfp[5] = 32'd3247687168;
	assign section4_coeff_smcfp[4] = 32'd1110671616;
	assign section4_coeff_smcfp[3] = 32'd1128256640;
	assign section4_coeff_smcfp[2] = 32'd3295569408;
	assign section4_coeff_smcfp[1] = 32'd1189805952;
	assign section4_coeff_smcfp[0] = 32'd3353278720;
	assign section4_coeff_smcfp[7] = 32'd0;
	assign section4_coeff_smcfp[8] = 32'd0;
	assign section4_coeff_smcfp[9] = 32'd0;
	
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
	.i_coeffs1(i_coeffs1_tb),
	.i_coeffs2(i_coeffs2_tb),
	.i_coeffs3(i_coeffs3_tb),
	.i_coeffs4(i_coeffs4_tb),
	.i_coeffs5(i_coeffs5_tb),
	.i_coeffs6(i_coeffs6_tb),
	.i_coeffs7(i_coeffs7_tb),
	.i_coeffs8(i_coeffs8_tb),
	.i_coeffs9(i_coeffs9_tb),
	.i_coeffs10(i_coeffs10_tb),
	.i_mean(i_mean_tb),
	.i_std(i_std_tb),
    .o_y     (   o_y_tb     ),
	.o_srdyo (o_srdyo_tb),
	.o_state(o_state_tb),
	.o_accum(o_accum_tb),
	.o_test(o_test_tb)
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

	//section 4
	#81 
	i_coeffs1_tb = section4_coeff_smcfp[0];
	i_coeffs2_tb = section4_coeff_smcfp[1];
	i_coeffs3_tb = section4_coeff_smcfp[2];
	i_coeffs4_tb = section4_coeff_smcfp[3];
	i_coeffs5_tb = section4_coeff_smcfp[4];
	i_coeffs6_tb = section4_coeff_smcfp[5];
	i_coeffs7_tb = section4_coeff_smcfp[6];
	i_coeffs8_tb = section4_coeff_smcfp[7];
	i_coeffs9_tb = section4_coeff_smcfp[8];
	i_coeffs10_tb = section4_coeff_smcfp[9];
	i_mean_tb = section4_negmean;
	i_std_tb = section4_invstd;
	i_x_tb = -21'd80000;
	i_srdyi_tb = 1'b1;
	#162 i_srdyi_tb = 1'b0;
	#25272
	
	//section 3
	#81 
	i_coeffs1_tb = section3_coeff_smcfp[0];
	i_coeffs2_tb = section3_coeff_smcfp[1];
	i_coeffs3_tb = section3_coeff_smcfp[2];
	i_coeffs4_tb = section3_coeff_smcfp[3];
	i_coeffs5_tb = section3_coeff_smcfp[4];
	i_coeffs6_tb = section3_coeff_smcfp[5];
	i_coeffs7_tb = section3_coeff_smcfp[6];
	i_coeffs8_tb = section3_coeff_smcfp[7];
	i_coeffs9_tb = section3_coeff_smcfp[8];
	i_coeffs10_tb = section3_coeff_smcfp[9];
	i_mean_tb = section3_negmean;
	i_std_tb = section3_invstd;
	i_x_tb = 21'd0;
	i_srdyi_tb = 1'b1;
	#162 i_srdyi_tb = 1'b0;
	#25272
	
	//section 2
	#81 
	i_coeffs1_tb = section2_coeff_smcfp[0];
	i_coeffs2_tb = section2_coeff_smcfp[1];
	i_coeffs3_tb = section2_coeff_smcfp[2];
	i_coeffs4_tb = section2_coeff_smcfp[3];
	i_coeffs5_tb = section2_coeff_smcfp[4];
	i_coeffs6_tb = section2_coeff_smcfp[5];
	i_coeffs7_tb = section2_coeff_smcfp[6];
	i_coeffs8_tb = section2_coeff_smcfp[7];
	i_coeffs9_tb = section2_coeff_smcfp[8];
	i_coeffs10_tb = section2_coeff_smcfp[9];
	i_mean_tb = section3_negmean;
	i_std_tb = section3_invstd;
	i_x_tb = 21'd40000;
	i_srdyi_tb = 1'b1;
	#162 i_srdyi_tb = 1'b0;
	#25272
	
	//section 1
	#81 
	i_coeffs1_tb = section1_coeff_smcfp[0];
	i_coeffs2_tb = section1_coeff_smcfp[1];
	i_coeffs3_tb = section1_coeff_smcfp[2];
	i_coeffs4_tb = section1_coeff_smcfp[3];
	i_coeffs5_tb = section1_coeff_smcfp[4];
	i_coeffs6_tb = section1_coeff_smcfp[5];
	i_coeffs7_tb = section1_coeff_smcfp[6];
	i_coeffs8_tb = section1_coeff_smcfp[7];
	i_coeffs9_tb = section1_coeff_smcfp[8];
	i_coeffs10_tb = section1_coeff_smcfp[9];
	i_mean_tb = section1_negmean;
	i_std_tb = section1_invstd;
	i_x_tb = 21'd60000;
	i_srdyi_tb = 1'b1;
	#162 i_srdyi_tb = 1'b0;
	
	#25272 $stop;
	end
	
	endmodule