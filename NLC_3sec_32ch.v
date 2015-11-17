///////////////////////////////////////////////////////////////////////
// ADC Non-linearity Correction Engine
//
// EEM216A Fall 2015
//
//
//
// Description: ADC Non-linearity Correction Engine - 32 channels
//				4 sections, 10th order
///////////////////////////////////////////////////////////////////////

module NLC_4sec_10th_32ch(

	//System clock and reset
	clk,
	reset,
  
	//ADC output
	srdyi, 
	x_lin_ch1,
	x_lin_ch2,
	x_lin_ch3,
	x_lin_ch4,
	x_lin_ch5,
	x_lin_ch6,
	x_lin_ch7,
	x_lin_ch8,
	x_lin_ch9,
	x_lin_ch10,
	x_lin_ch11,
	x_lin_ch12,
	x_lin_ch13,
	x_lin_ch14,
	x_lin_ch15,
	x_lin_ch16,
	x_lin_ch17,
	x_lin_ch18,
	x_lin_ch19,
	x_lin_ch20,
	x_lin_ch21,
	x_lin_ch22,
	x_lin_ch23,
	x_lin_ch24,
	x_lin_ch25,
	x_lin_ch26,
	x_lin_ch27,
	x_lin_ch28,
	x_lin_ch29,
	x_lin_ch30,
	x_lin_ch31,
	x_lin_ch32,

	//NLC output
	srdyo_ch1, 
	srdyo_ch2, 
	srdyo_ch3, 
	srdyo_ch4, 
	srdyo_ch5, 
	srdyo_ch6, 
	srdyo_ch7, 
	srdyo_ch8, 
	srdyo_ch9, 
	srdyo_ch10, 
	srdyo_ch11, 
	srdyo_ch12, 
	srdyo_ch13, 
	srdyo_ch14, 
	srdyo_ch15, 
	srdyo_ch16, 
	srdyo_ch17, 
	srdyo_ch18, 
	srdyo_ch19, 
	srdyo_ch20, 
	srdyo_ch21, 
	srdyo_ch22, 
	srdyo_ch23, 
	srdyo_ch24, 
	srdyo_ch25, 
	srdyo_ch26, 
	srdyo_ch27, 
	srdyo_ch28, 
	srdyo_ch29, 
	srdyo_ch30, 
	srdyo_ch31, 
	srdyo_ch32, 
	
	x_adc_ch1, 
	x_adc_ch2, 
	x_adc_ch3, 
	x_adc_ch4, 
	x_adc_ch5, 
	x_adc_ch6, 
	x_adc_ch7, 
	x_adc_ch8, 
	x_adc_ch9, 
	x_adc_ch10, 
	x_adc_ch11, 
	x_adc_ch12, 
	x_adc_ch13, 
	x_adc_ch14, 
	x_adc_ch15, 
	x_adc_ch16, 
	x_adc_ch17, 
	x_adc_ch18, 
	x_adc_ch19, 
	x_adc_ch20, 
	x_adc_ch21, 
	x_adc_ch22, 
	x_adc_ch23, 
	x_adc_ch24, 
	x_adc_ch25, 
	x_adc_ch26, 
	x_adc_ch27, 
	x_adc_ch28, 
	x_adc_ch29, 
	x_adc_ch30, 
	x_adc_ch31, 
	x_adc_ch32, 

	//X-value that separates the sections
	section_limit,

	//Reciprocal standard deviation for the centered and scaled fit
	recip_stdev_3, 
	recip_stdev_2, 
	recip_stdev_1, 

	//Negative meand for the centered and scaled fit
	neg_mean_3, 
	neg_mean_2, 
	neg_mean_1, 

	//Section 3 coefficients
	coeff_3_7, 
	coeff_3_6, 
	coeff_3_5, 
	coeff_3_4, 
	coeff_3_3, 
	coeff_3_2, 
	coeff_3_1, 
	coeff_3_0, 

	//Section 2 coefficients
	coeff_2_7, 
	coeff_2_6, 
	coeff_2_5, 
	coeff_2_4, 
	coeff_2_3, 
	coeff_2_2, 
	coeff_2_1, 
	coeff_2_0, 

	//Section 1 coefficients 
	coeff_1_7, 
	coeff_1_6, 
	coeff_1_5, 
	coeff_1_4, 
	coeff_1_3, 
	coeff_1_2, 
	coeff_1_1, 
	coeff_1_0
	
	//o_state,
	//o_section,
	//o_abs_x,
	//o_test
);

//System clock and reset
	input clk;
	input reset;
	
	//ADC output
	input [20:0] x_lin_ch1;
	input [20:0] x_lin_ch2;
	input [20:0] x_lin_ch3;
	input [20:0] x_lin_ch4;
	input [20:0] x_lin_ch5;
	input [20:0] x_lin_ch6;
	input [20:0] x_lin_ch7;
	input [20:0] x_lin_ch8;
	input [20:0] x_lin_ch9;
	input [20:0] x_lin_ch10;
	input [20:0] x_lin_ch11;
	input [20:0] x_lin_ch12;
	input [20:0] x_lin_ch13;
	input [20:0] x_lin_ch14;
	input [20:0] x_lin_ch15;
	input [20:0] x_lin_ch16;
	input [20:0] x_lin_ch17;
	input [20:0] x_lin_ch18;
	input [20:0] x_lin_ch19;
	input [20:0] x_lin_ch20;
	input [20:0] x_lin_ch21;
	input [20:0] x_lin_ch22;
	input [20:0] x_lin_ch23;
	input [20:0] x_lin_ch24;
	input [20:0] x_lin_ch25;
	input [20:0] x_lin_ch26;
	input [20:0] x_lin_ch27;
	input [20:0] x_lin_ch28;
	input [20:0] x_lin_ch29;
	input [20:0] x_lin_ch30;
	input [20:0] x_lin_ch31;
	input [20:0] x_lin_ch32;
	input srdyi;
	
	//NLC output
	output srdyo_ch1; 
	output srdyo_ch2; 
	output srdyo_ch3; 
	output srdyo_ch4; 
	output srdyo_ch5; 
	output srdyo_ch6; 
	output srdyo_ch7; 
	output srdyo_ch8; 
	output srdyo_ch9; 
	output srdyo_ch10; 
	output srdyo_ch11; 
	output srdyo_ch12; 
	output srdyo_ch13; 
	output srdyo_ch14; 
	output srdyo_ch15; 
	output srdyo_ch16; 
	output srdyo_ch17; 
	output srdyo_ch18; 
	output srdyo_ch19; 
	output srdyo_ch20; 
	output srdyo_ch21; 
	output srdyo_ch22; 
	output srdyo_ch23; 
	output srdyo_ch24; 
	output srdyo_ch25; 
	output srdyo_ch26; 
	output srdyo_ch27; 
	output srdyo_ch28; 
	output srdyo_ch29; 
	output srdyo_ch30; 
	output srdyo_ch31; 
	output srdyo_ch32; 
	
	output [20:0] x_adc_ch1; 
	output [20:0] x_adc_ch2; 
	output [20:0] x_adc_ch3; 
	output [20:0] x_adc_ch4; 
	output [20:0] x_adc_ch5; 
	output [20:0] x_adc_ch6; 
	output [20:0] x_adc_ch7; 
	output [20:0] x_adc_ch8; 
	output [20:0] x_adc_ch9; 
	output [20:0] x_adc_ch10; 
	output [20:0] x_adc_ch11; 
	output [20:0] x_adc_ch12; 
	output [20:0] x_adc_ch13; 
	output [20:0] x_adc_ch14; 
	output [20:0] x_adc_ch15; 
	output [20:0] x_adc_ch16; 
	output [20:0] x_adc_ch17; 
	output [20:0] x_adc_ch18; 
	output [20:0] x_adc_ch19; 
	output [20:0] x_adc_ch20; 
	output [20:0] x_adc_ch21; 
	output [20:0] x_adc_ch22; 
	output [20:0] x_adc_ch23; 
	output [20:0] x_adc_ch24; 
	output [20:0] x_adc_ch25; 
	output [20:0] x_adc_ch26; 
	output [20:0] x_adc_ch27; 
	output [20:0] x_adc_ch28; 
	output [20:0] x_adc_ch29; 
	output [20:0] x_adc_ch30; 
	output [20:0] x_adc_ch31; 
	output [20:0] x_adc_ch32;
	
	//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_3; 
	input [31:0] recip_stdev_2; 
	input [31:0] recip_stdev_1; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_3; 
	input [31:0] neg_mean_2; 
	input [31:0] neg_mean_1; 

	//Section 3 coefficients
	input [31:0] coeff_3_7; 
	input [31:0] coeff_3_6; 
	input [31:0] coeff_3_5; 
	input [31:0] coeff_3_4; 
	input [31:0] coeff_3_3; 
	input [31:0] coeff_3_2; 
	input [31:0] coeff_3_1; 
	input [31:0] coeff_3_0; 

	//Section 2 coefficients
	input [31:0] coeff_2_7; 
	input [31:0] coeff_2_6; 
	input [31:0] coeff_2_5; 
	input [31:0] coeff_2_4; 
	input [31:0] coeff_2_3; 
	input [31:0] coeff_2_2; 
	input [31:0] coeff_2_1; 
	input [31:0] coeff_2_0; 

	//Section 1 coefficients
	input [31:0] coeff_1_7; 
	input [31:0] coeff_1_6; 
	input [31:0] coeff_1_5; 
	input [31:0] coeff_1_4; 
	input [31:0] coeff_1_3; 
	input [31:0] coeff_1_2; 
	input [31:0] coeff_1_1; 
	input [31:0] coeff_1_0;
	
	//X-value that separates the sections
	input [19:0] section_limit1;
	input [19:0] section_limit2;
	
	reg GlobalReset;
	
/////////////////////////////////////////////////////////////
//32 channels

//Channel 1
NLC_3sec_1ch CH1(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch1),

  //NLC output
  .srdyo(srdyo_ch1), 
  .x_adc(x_adc_ch1), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 2
NLC_3sec_1ch CH2(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch2),

  //NLC output
  .srdyo(srdyo_ch2), 
  .x_adc(x_adc_ch2), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 3
NLC_3sec_1ch CH3(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch3),

  //NLC output
  .srdyo(srdyo_ch3), 
  .x_adc(x_adc_ch3), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 4
NLC_3sec_1ch CH4(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch4),

  //NLC output
  .srdyo(srdyo_ch4), 
  .x_adc(x_adc_ch4), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 5
NLC_3sec_1ch CH5(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch5),

  //NLC output
  .srdyo(srdyo_ch5), 
  .x_adc(x_adc_ch5), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 6
NLC_3sec_1ch CH6(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch6),

  //NLC output
  .srdyo(srdyo_ch6), 
  .x_adc(x_adc_ch6), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 7
NLC_3sec_1ch CH7(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch7),

  //NLC output
  .srdyo(srdyo_ch7), 
  .x_adc(x_adc_ch7), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 8
NLC_3sec_1ch CH8(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch8),

  //NLC output
  .srdyo(srdyo_ch8), 
  .x_adc(x_adc_ch8), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 9
NLC_3sec_1ch CH1(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch9),

  //NLC output
  .srdyo(srdyo_ch9), 
  .x_adc(x_adc_ch9), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 10
NLC_3sec_1ch CH10(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch10),

  //NLC output
  .srdyo(srdyo_ch10), 
  .x_adc(x_adc_ch10), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 11
NLC_3sec_1ch CH11(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch11),

  //NLC output
  .srdyo(srdyo_ch11), 
  .x_adc(x_adc_ch11), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 12
NLC_3sec_1ch CH12(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch12),

  //NLC output
  .srdyo(srdyo_ch12), 
  .x_adc(x_adc_ch12), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 13
NLC_3sec_1ch CH13(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch13),

  //NLC output
  .srdyo(srdyo_ch13), 
  .x_adc(x_adc_ch13), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channle 14
NLC_3sec_1ch CH14(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch14),

  //NLC output
  .srdyo(srdyo_ch14), 
  .x_adc(x_adc_ch14), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 15
NLC_3sec_1ch CH15(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch15),

  //NLC output
  .srdyo(srdyo_ch15), 
  .x_adc(x_adc_ch15), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 16
NLC_3sec_1ch CH16(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch16),

  //NLC output
  .srdyo(srdyo_ch16), 
  .x_adc(x_adc_ch16), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 17
NLC_3sec_1ch CH17(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch17),

  //NLC output
  .srdyo(srdyo_ch17), 
  .x_adc(x_adc_ch17), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 18
NLC_3sec_1ch CH18(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch18),

  //NLC output
  .srdyo(srdyo_ch18), 
  .x_adc(x_adc_ch18), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 19
NLC_3sec_1ch CH19(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch19),

  //NLC output
  .srdyo(srdyo_ch19), 
  .x_adc(x_adc_ch19), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 20
NLC_3sec_1ch CH20(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch20),

  //NLC output
  .srdyo(srdyo_ch20), 
  .x_adc(x_adc_ch20), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 21
NLC_3sec_1ch CH21(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch21),

  //NLC output
  .srdyo(srdyo_ch21), 
  .x_adc(x_adc_ch21), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4), 
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4), 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10), 
  .coeff_4_9(coeff_4_9), 
  .coeff_4_8(coeff_4_8), 
  .coeff_4_7(coeff_4_7), 
  .coeff_4_6(coeff_4_6), 
  .coeff_4_5(coeff_4_5), 
  .coeff_4_4(coeff_4_4), 
  .coeff_4_3(coeff_4_3), 
  .coeff_4_2(coeff_4_2), 
  .coeff_4_1(coeff_4_1), 
  .coeff_4_0(coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10), 
  .coeff_3_9(coeff_3_9), 
  .coeff_3_8(coeff_3_8), 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10), 
  .coeff_2_9(coeff_2_9), 
  .coeff_2_8(coeff_2_8), 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10), 
  .coeff_1_9(coeff_1_9), 
  .coeff_1_8(coeff_1_8), 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 22
NLC_3sec_1ch CH22(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch22),

  //NLC output
  .srdyo(srdyo_ch22), 
  .x_adc(x_adc_ch22), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit) 
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 23
NLC_3sec_1ch CH23(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch23),

  //NLC output
  .srdyo(srdyo_ch23), 
  .x_adc(x_adc_ch23), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1),  

  //Section 3 coefficients (x > 0, |x| <= section_limit) 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 24
NLC_3sec_1ch CH24(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch24),

  //NLC output
  .srdyo(srdyo_ch24), 
  .x_adc(x_adc_ch24), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit 
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit) 
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 25
NLC_3sec_1ch CH25(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch25),

  //NLC output
  .srdyo(srdyo_ch25), 
  .x_adc(x_adc_ch25), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 26
NLC_3sec_1ch CH26(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch26),

  //NLC output
  .srdyo(srdyo_ch26), 
  .x_adc(x_adc_ch26), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit) 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 27
NLC_3sec_1ch CH27(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch27),

  //NLC output
  .srdyo(srdyo_ch27), 
  .x_adc(x_adc_ch27), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit) 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 28
NLC_3sec_1ch CH28(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch28),

  //NLC output
  .srdyo(srdyo_ch28), 
  .x_adc(x_adc_ch28), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit) 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 29
NLC_3sec_1ch CH29(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch29),

  //NLC output
  .srdyo(srdyo_ch29), 
  .x_adc(x_adc_ch29), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 30
NLC_3sec_1ch CH30(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch30),

  //NLC output
  .srdyo(srdyo_ch30), 
  .x_adc(x_adc_ch30), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit) 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 31
NLC_3sec_1ch CH31(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch31),

  //NLC output
  .srdyo(srdyo_ch31), 
  .x_adc(x_adc_ch31), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit) 
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);

//Channel 32
NLC_3sec_1ch CH32(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(x_lin_ch32),

  //NLC output
  .srdyo(srdyo_ch32), 
  .x_adc(x_adc_ch32), 

  //X-value that separates the sections
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(recip_stdev_3), 
  .recip_stdev_2(recip_stdev_2), 
  .recip_stdev_1(recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(neg_mean_3), 
  .neg_mean_2(neg_mean_2), 
  .neg_mean_1(neg_mean_1), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_7(coeff_3_7), 
  .coeff_3_6(coeff_3_6), 
  .coeff_3_5(coeff_3_5), 
  .coeff_3_4(coeff_3_4), 
  .coeff_3_3(coeff_3_3), 
  .coeff_3_2(coeff_3_2), 
  .coeff_3_1(coeff_3_1), 
  .coeff_3_0(coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_7(coeff_2_7), 
  .coeff_2_6(coeff_2_6), 
  .coeff_2_5(coeff_2_5), 
  .coeff_2_4(coeff_2_4), 
  .coeff_2_3(coeff_2_3), 
  .coeff_2_2(coeff_2_2), 
  .coeff_2_1(coeff_2_1), 
  .coeff_2_0(coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_7(coeff_1_7), 
  .coeff_1_6(coeff_1_6), 
  .coeff_1_5(coeff_1_5), 
  .coeff_1_4(coeff_1_4), 
  .coeff_1_3(coeff_1_3), 
  .coeff_1_2(coeff_1_2), 
  .coeff_1_1(coeff_1_1), 
  .coeff_1_0(coeff_1_0) 
);


////////////////////////////////////////////////////////////////////////////////
//At clock edge

always @(posedge clk) begin
	GlobalReset <= reset;
end

endmodule