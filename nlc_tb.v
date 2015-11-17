`timescale 1ns/100ps

module NLC_tb();

  reg clk;
  reg GlobalReset;
  reg [31:0] select_section_coefficients_stdev_4_porty; // ufix32
  reg [31:0] select_section_coefficients_stdev_3_porty; // ufix32
  reg [31:0] select_section_coefficients_stdev_2_porty; // ufix32
  reg [31:0] select_section_coefficients_stdev_1_porty; // ufix32
  reg [31:0] select_section_coefficients_mean_4_porty;// ufix32
  reg [31:0] select_section_coefficients_mean_3_porty; // ufix32
  reg [31:0] select_section_coefficients_mean_2_porty; // ufix32
  reg [31:0] select_section_coefficients_mean_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_9_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_8_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_7_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_6_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_5_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_4_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_3_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_2_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_10_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_4_0_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_9_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_8_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_7_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_6_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_5_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_4_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_3_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_2_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_10_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_0_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_9_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_8_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_7_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_6_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_5_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_4_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_3_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_2_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_10_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_0_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_9_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_8_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_7_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_6_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_5_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_4_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_3_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_2_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_10_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_0_porty; // ufix32
  wire [20:0] x_lin; // sfix21
  reg [20:0] x_adc; // sfix21
  wire srdyo; // ufix1
  reg srdyi; // ufix1
  reg [19:0] section_limit; // ufix20
  wire [2:0] o_state;
  wire [2:0] o_section;
  wire [20:0] o_abs_x;
  wire [31:0] o_test;
	
//////////////////////////////////////////////////////////////////////
// assign the instruction you want to test: 
// from 000 ~ 111 mapping to your instruction 000 ~ 111
// 1XXX means all instructions will be tested
assign	test_instruction = 4'b0000;
//////////////////////////////////////////////////////////////////////

// Instantiate a Design Under Test (DUT)
NLC_4sec_10th_1ch NLC00(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(x_adc), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(select_section_coefficients_stdev_4_porty), 
  .recip_stdev_3(select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2(select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1(select_section_coefficients_stdev_1_porty), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(select_section_coefficients_mean_4_porty), 
  .neg_mean_3(select_section_coefficients_mean_3_porty), 
  .neg_mean_2(select_section_coefficients_mean_2_porty), 
  .neg_mean_1(select_section_coefficients_mean_1_porty), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(select_section_coefficients_coeff_4_10_porty), 
  .coeff_4_9(select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8(select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7(select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6(select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5(select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4(select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3(select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2(select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1(select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0(select_section_coefficients_coeff_4_0_porty), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(select_section_coefficients_coeff_3_10_porty), 
  .coeff_3_9(select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8(select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7(select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6(select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5(select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4(select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3(select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2(select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1(select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0(select_section_coefficients_coeff_3_0_porty), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(select_section_coefficients_coeff_2_10_porty), 
  .coeff_2_9(select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8(select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7(select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6(select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5(select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4(select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3(select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2(select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1(select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0(select_section_coefficients_coeff_2_0_porty), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(select_section_coefficients_coeff_1_10_porty), 
  .coeff_1_9(select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8(select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7(select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6(select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5(select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4(select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3(select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2(select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1(select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0(select_section_coefficients_coeff_1_0_porty),
  
  //.o_section(o_section),
  //.o_state(o_state),
  //.o_abs_x(o_abs_x),
  .o_test(o_test)
	);


// Oscillate the clock (cycle time is 162ns and 6.14Mhz)
always #81 clk = ~clk;
//always #80 i_srdyi;


initial begin
	clk = 1'b1;
	GlobalReset = 1'b1;
	#162 GlobalReset = 1'b0;
	
  select_section_coefficients_stdev_4_porty = 32'b00111000110101110111110110000111;// ufix32
  select_section_coefficients_stdev_3_porty = 32'b00111000110110010001110110111100;// ufix32
  select_section_coefficients_stdev_2_porty = 32'b00111000110110010001110110111100;// ufix32
   select_section_coefficients_stdev_1_porty = 32'b00111000110101110111110110000111;// ufix32
   select_section_coefficients_mean_4_porty = 32'b11001000001011000110000010000000;// ufix32
   select_section_coefficients_mean_3_porty = 32'b11000111011000100010110000000000;// ufix32
   select_section_coefficients_mean_2_porty = 32'b01000111011000100010110000000000;// ufix32
   select_section_coefficients_mean_1_porty = 32'b01001000001011000110000000000000;// ufix32
   select_section_coefficients_coeff_4_9_porty = 32'b11000001110010011011100000000000;// ufix32
   select_section_coefficients_coeff_4_8_porty = 32'b01000011011100000101110010000000;// ufix32
   select_section_coefficients_coeff_4_7_porty = 32'b01000010110010110001110000000000;// ufix32
   select_section_coefficients_coeff_4_6_porty = 32'b11000011110001101000001000000000;// ufix32
   select_section_coefficients_coeff_4_5_porty = 32'b11000011000000000001010100000000;// ufix32
   select_section_coefficients_coeff_4_4_porty = 32'b01000011100001000001111100000000;// ufix32
   select_section_coefficients_coeff_4_3_porty = 32'b01000010111111110011010110000000;// ufix32
   select_section_coefficients_coeff_4_2_porty = 32'b01000011101110101010010000000000;// ufix32
   select_section_coefficients_coeff_4_10_porty = 32'b11000010010000100110000000000000;// ufix32
   select_section_coefficients_coeff_4_1_porty = 32'b01000110000010110111111000000000;// ufix32
   select_section_coefficients_coeff_4_0_porty = 32'b01000111000011000000101100000000;// ufix32
   select_section_coefficients_coeff_3_9_porty = 32'b00000000110111011101000001000110;// ufix32
   select_section_coefficients_coeff_3_8_porty = 32'b01000001100110101010010010000000;// ufix32
   select_section_coefficients_coeff_3_7_porty = 32'b01000000111100110111011110000000;// ufix32
   select_section_coefficients_coeff_3_6_porty = 32'b11000010100100110110011000000000;// ufix32
   select_section_coefficients_coeff_3_5_porty = 32'b11000001110100100110000000000000;// ufix32
   select_section_coefficients_coeff_3_4_porty = 32'b01000010101001100010101100000000;// ufix32
   select_section_coefficients_coeff_3_3_porty = 32'b01000010001110111100000100000000;// ufix32
   select_section_coefficients_coeff_3_2_porty = 32'b01000010010101010000000100000000;// ufix32
   select_section_coefficients_coeff_3_10_porty = 32'b00000000110111011101000001000110;// ufix32
   select_section_coefficients_coeff_3_1_porty = 32'b01000101111010110100111110000000;// ufix32
   select_section_coefficients_coeff_3_0_porty = 32'b01000110001011101010010010000000;// ufix32
   select_section_coefficients_coeff_2_9_porty = 32'b00000000110111011101000001000110;// ufix32
   select_section_coefficients_coeff_2_8_porty = 32'b11000001100110101000001000000000;// ufix32
   select_section_coefficients_coeff_2_7_porty = 32'b01000000111100110100011110000000;// ufix32
   select_section_coefficients_coeff_2_6_porty = 32'b01000010100100110011111110000000;// ufix32
   select_section_coefficients_coeff_2_5_porty = 32'b11000001110100100011011000000000;// ufix32
   select_section_coefficients_coeff_2_4_porty = 32'b11000010101001011111010000000000;// ufix32
   select_section_coefficients_coeff_2_3_porty = 32'b01000010001110111010110000000000;// ufix32
   select_section_coefficients_coeff_2_2_porty = 32'b11000010010101010011011000000000;// ufix32
   select_section_coefficients_coeff_2_10_porty = 32'b00000000110111011101000001000110;// ufix32
   select_section_coefficients_coeff_2_1_porty = 32'b01000101111010110101000000000000;// ufix32
   select_section_coefficients_coeff_2_0_porty = 32'b11000110001011101010010000000000;// ufix32
   select_section_coefficients_coeff_1_9_porty = 32'b11000001110010011011100000000000;// ufix32
   select_section_coefficients_coeff_1_8_porty = 32'b11000011011100000010001000000000;// ufix32
   select_section_coefficients_coeff_1_7_porty = 32'b01000010110010110010101010000000;// ufix32
   select_section_coefficients_coeff_1_6_porty = 32'b01000011110001100101101010000000;// ufix32
   select_section_coefficients_coeff_1_5_porty = 32'b11000011000000000010101000000000;// ufix32
   select_section_coefficients_coeff_1_4_porty = 32'b11000011100001000001000100000000;// ufix32
   select_section_coefficients_coeff_1_3_porty = 32'b01000010111111110101101010000000;// ufix32
   select_section_coefficients_coeff_1_2_porty = 32'b11000011101110101010001100000000;// ufix32
   select_section_coefficients_coeff_1_10_porty = 32'b01000010010000100010110000000000; // ufix32
   select_section_coefficients_coeff_1_1_porty = 32'b01000110000010110111111000000000;// ufix32
   select_section_coefficients_coeff_1_0_porty = 32'b11000111000011000000101100000000; // ufix32
	
	section_limit = 20'b00001101111111110000; // ufix20
	
  
	//section 4
	x_adc = 21'b000011100011100100011; // sfix21
	srdyi = 1'b1; // ufix1
	#162 srdyi = 1'b0; // ufix1
	#55000
	
	//section 3
	x_adc = 21'd25000;
	srdyi = 1'b1;
	#162 srdyi = 1'b0; // ufix1
	#55000
	
	//section 2
	x_adc = -21'd25000;
	srdyi = 1'b1;
	#162 srdyi = 1'b0; // ufix1
	#55000
	
	//section 1
	x_adc = -21'd80000;
	srdyi = 1'b1;
	#162 srdyi = 1'b0; // ufix1
	#35000
	
	#55000 $stop;
	
	
	end
	
	endmodule