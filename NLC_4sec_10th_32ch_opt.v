///////////////////////////////////////////////////////////////////////
// ADC Non-linearity Correction Engine
//
// EEM216A Fall 2015
//
// Anchi Su
// Giovoni King
//
// Description: ADC Non-linearity Correction Engine - 32 channels
//				4 sections, 10th order
//				4-channel interleaving -> 8 blocks
///////////////////////////////////////////////////////////////////////

module NLC_4sec_10th_32ch_opt(
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
	srdyo, 

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

	//Channel 1
		//X-value that separates the sections
		section_limit_ch1,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch1, 
		recip_stdev_3_ch1, 
		recip_stdev_2_ch1, 
		recip_stdev_1_ch1, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch1, 
		neg_mean_3_ch1, 
		neg_mean_2_ch1, 
		neg_mean_1_ch1, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch1, 
		coeff_4_9_ch1, 
		coeff_4_8_ch1, 
		coeff_4_7_ch1, 
		coeff_4_6_ch1, 
		coeff_4_5_ch1, 
		coeff_4_4_ch1, 
		coeff_4_3_ch1, 
		coeff_4_2_ch1, 
		coeff_4_1_ch1, 
		coeff_4_0_ch1, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch1, 
		coeff_3_9_ch1, 
		coeff_3_8_ch1, 
		coeff_3_7_ch1, 
		coeff_3_6_ch1, 
		coeff_3_5_ch1, 
		coeff_3_4_ch1, 
		coeff_3_3_ch1, 
		coeff_3_2_ch1, 
		coeff_3_1_ch1, 
		coeff_3_0_ch1, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch1, 
		coeff_2_9_ch1, 
		coeff_2_8_ch1, 
		coeff_2_7_ch1, 
		coeff_2_6_ch1, 
		coeff_2_5_ch1, 
		coeff_2_4_ch1, 
		coeff_2_3_ch1, 
		coeff_2_2_ch1, 
		coeff_2_1_ch1, 
		coeff_2_0_ch1, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch1, 
		coeff_1_9_ch1, 
		coeff_1_8_ch1, 
		coeff_1_7_ch1, 
		coeff_1_6_ch1, 
		coeff_1_5_ch1, 
		coeff_1_4_ch1, 
		coeff_1_3_ch1, 
		coeff_1_2_ch1, 
		coeff_1_1_ch1, 
		coeff_1_0_ch1,
	
	//Channel 2
		//X-value that separates the sections
		section_limit_ch2,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch2, 
		recip_stdev_3_ch2, 
		recip_stdev_2_ch2, 
		recip_stdev_1_ch2, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch2, 
		neg_mean_3_ch2, 
		neg_mean_2_ch2, 
		neg_mean_1_ch2, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch2, 
		coeff_4_9_ch2, 
		coeff_4_8_ch2, 
		coeff_4_7_ch2, 
		coeff_4_6_ch2, 
		coeff_4_5_ch2, 
		coeff_4_4_ch2, 
		coeff_4_3_ch2, 
		coeff_4_2_ch2, 
		coeff_4_1_ch2, 
		coeff_4_0_ch2, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch2, 
		coeff_3_9_ch2, 
		coeff_3_8_ch2, 
		coeff_3_7_ch2, 
		coeff_3_6_ch2, 
		coeff_3_5_ch2, 
		coeff_3_4_ch2, 
		coeff_3_3_ch2, 
		coeff_3_2_ch2, 
		coeff_3_1_ch2, 
		coeff_3_0_ch2, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch2, 
		coeff_2_9_ch2, 
		coeff_2_8_ch2, 
		coeff_2_7_ch2, 
		coeff_2_6_ch2, 
		coeff_2_5_ch2, 
		coeff_2_4_ch2, 
		coeff_2_3_ch2, 
		coeff_2_2_ch2, 
		coeff_2_1_ch2, 
		coeff_2_0_ch2, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch2, 
		coeff_1_9_ch2, 
		coeff_1_8_ch2, 
		coeff_1_7_ch2, 
		coeff_1_6_ch2, 
		coeff_1_5_ch2, 
		coeff_1_4_ch2, 
		coeff_1_3_ch2, 
		coeff_1_2_ch2, 
		coeff_1_1_ch2, 
		coeff_1_0_ch2,

	//Channel 3
		//X-value that separates the sections
		section_limit_ch3,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch3, 
		recip_stdev_3_ch3, 
		recip_stdev_2_ch3, 
		recip_stdev_1_ch3, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch3, 
		neg_mean_3_ch3, 
		neg_mean_2_ch3, 
		neg_mean_1_ch3, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch3, 
		coeff_4_9_ch3, 
		coeff_4_8_ch3, 
		coeff_4_7_ch3, 
		coeff_4_6_ch3, 
		coeff_4_5_ch3, 
		coeff_4_4_ch3, 
		coeff_4_3_ch3, 
		coeff_4_2_ch3, 
		coeff_4_1_ch3, 
		coeff_4_0_ch3, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch3, 
		coeff_3_9_ch3, 
		coeff_3_8_ch3, 
		coeff_3_7_ch3, 
		coeff_3_6_ch3, 
		coeff_3_5_ch3, 
		coeff_3_4_ch3, 
		coeff_3_3_ch3, 
		coeff_3_2_ch3, 
		coeff_3_1_ch3, 
		coeff_3_0_ch3, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch3, 
		coeff_2_9_ch3, 
		coeff_2_8_ch3, 
		coeff_2_7_ch3, 
		coeff_2_6_ch3, 
		coeff_2_5_ch3, 
		coeff_2_4_ch3, 
		coeff_2_3_ch3, 
		coeff_2_2_ch3, 
		coeff_2_1_ch3, 
		coeff_2_0_ch3, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch3, 
		coeff_1_9_ch3, 
		coeff_1_8_ch3, 
		coeff_1_7_ch3, 
		coeff_1_6_ch3, 
		coeff_1_5_ch3, 
		coeff_1_4_ch3, 
		coeff_1_3_ch3, 
		coeff_1_2_ch3, 
		coeff_1_1_ch3, 
		coeff_1_0_ch3,

	//Channel 4
		//X-value that separates the sections
		section_limit_ch4,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch4, 
		recip_stdev_3_ch4, 
		recip_stdev_2_ch4, 
		recip_stdev_1_ch4, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch4, 
		neg_mean_3_ch4, 
		neg_mean_2_ch4, 
		neg_mean_1_ch4, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch4, 
		coeff_4_9_ch4, 
		coeff_4_8_ch4, 
		coeff_4_7_ch4, 
		coeff_4_6_ch4, 
		coeff_4_5_ch4, 
		coeff_4_4_ch4, 
		coeff_4_3_ch4, 
		coeff_4_2_ch4, 
		coeff_4_1_ch4, 
		coeff_4_0_ch4, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch4, 
		coeff_3_9_ch4, 
		coeff_3_8_ch4, 
		coeff_3_7_ch4, 
		coeff_3_6_ch4, 
		coeff_3_5_ch4, 
		coeff_3_4_ch4, 
		coeff_3_3_ch4, 
		coeff_3_2_ch4, 
		coeff_3_1_ch4, 
		coeff_3_0_ch4, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch4, 
		coeff_2_9_ch4, 
		coeff_2_8_ch4, 
		coeff_2_7_ch4, 
		coeff_2_6_ch4, 
		coeff_2_5_ch4, 
		coeff_2_4_ch4, 
		coeff_2_3_ch4, 
		coeff_2_2_ch4, 
		coeff_2_1_ch4, 
		coeff_2_0_ch4, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch4, 
		coeff_1_9_ch4, 
		coeff_1_8_ch4, 
		coeff_1_7_ch4, 
		coeff_1_6_ch4, 
		coeff_1_5_ch4, 
		coeff_1_4_ch4, 
		coeff_1_3_ch4, 
		coeff_1_2_ch4, 
		coeff_1_1_ch4, 
		coeff_1_0_ch4,

	//Channel 5
			//X-value that separates the sections
		section_limit_ch5,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch5, 
		recip_stdev_3_ch5, 
		recip_stdev_2_ch5, 
		recip_stdev_1_ch5, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch5, 
		neg_mean_3_ch5, 
		neg_mean_2_ch5, 
		neg_mean_1_ch5, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch5, 
		coeff_4_9_ch5, 
		coeff_4_8_ch5, 
		coeff_4_7_ch5, 
		coeff_4_6_ch5, 
		coeff_4_5_ch5, 
		coeff_4_4_ch5, 
		coeff_4_3_ch5, 
		coeff_4_2_ch5, 
		coeff_4_1_ch5, 
		coeff_4_0_ch5, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch5, 
		coeff_3_9_ch5, 
		coeff_3_8_ch5, 
		coeff_3_7_ch5, 
		coeff_3_6_ch5, 
		coeff_3_5_ch5, 
		coeff_3_4_ch5, 
		coeff_3_3_ch5, 
		coeff_3_2_ch5, 
		coeff_3_1_ch5, 
		coeff_3_0_ch5, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch5, 
		coeff_2_9_ch5, 
		coeff_2_8_ch5, 
		coeff_2_7_ch5, 
		coeff_2_6_ch5, 
		coeff_2_5_ch5, 
		coeff_2_4_ch5, 
		coeff_2_3_ch5, 
		coeff_2_2_ch5, 
		coeff_2_1_ch5, 
		coeff_2_0_ch5, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch5, 
		coeff_1_9_ch5, 
		coeff_1_8_ch5, 
		coeff_1_7_ch5, 
		coeff_1_6_ch5, 
		coeff_1_5_ch5, 
		coeff_1_4_ch5, 
		coeff_1_3_ch5, 
		coeff_1_2_ch5, 
		coeff_1_1_ch5, 
		coeff_1_0_ch5,

	//Channel 6
		//X-value that separates the sections
		section_limit_ch6,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch6, 
		recip_stdev_3_ch6, 
		recip_stdev_2_ch6, 
		recip_stdev_1_ch6, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch6, 
		neg_mean_3_ch6, 
		neg_mean_2_ch6, 
		neg_mean_1_ch6, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch6, 
		coeff_4_9_ch6, 
		coeff_4_8_ch6, 
		coeff_4_7_ch6, 
		coeff_4_6_ch6, 
		coeff_4_5_ch6, 
		coeff_4_4_ch6, 
		coeff_4_3_ch6, 
		coeff_4_2_ch6, 
		coeff_4_1_ch6, 
		coeff_4_0_ch6, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch6, 
		coeff_3_9_ch6, 
		coeff_3_8_ch6, 
		coeff_3_7_ch6, 
		coeff_3_6_ch6, 
		coeff_3_5_ch6, 
		coeff_3_4_ch6, 
		coeff_3_3_ch6, 
		coeff_3_2_ch6, 
		coeff_3_1_ch6, 
		coeff_3_0_ch6, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch6, 
		coeff_2_9_ch6, 
		coeff_2_8_ch6, 
		coeff_2_7_ch6, 
		coeff_2_6_ch6, 
		coeff_2_5_ch6, 
		coeff_2_4_ch6, 
		coeff_2_3_ch6, 
		coeff_2_2_ch6, 
		coeff_2_1_ch6, 
		coeff_2_0_ch6, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch6, 
		coeff_1_9_ch6, 
		coeff_1_8_ch6, 
		coeff_1_7_ch6, 
		coeff_1_6_ch6, 
		coeff_1_5_ch6, 
		coeff_1_4_ch6, 
		coeff_1_3_ch6, 
		coeff_1_2_ch6, 
		coeff_1_1_ch6, 
		coeff_1_0_ch6,

	//Channel 7
			//X-value that separates the sections
		section_limit_ch7,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch7, 
		recip_stdev_3_ch7, 
		recip_stdev_2_ch7, 
		recip_stdev_1_ch7, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch7, 
		neg_mean_3_ch7, 
		neg_mean_2_ch7, 
		neg_mean_1_ch7, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch7, 
		coeff_4_9_ch7, 
		coeff_4_8_ch7, 
		coeff_4_7_ch7, 
		coeff_4_6_ch7, 
		coeff_4_5_ch7, 
		coeff_4_4_ch7, 
		coeff_4_3_ch7, 
		coeff_4_2_ch7, 
		coeff_4_1_ch7, 
		coeff_4_0_ch7, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch7, 
		coeff_3_9_ch7, 
		coeff_3_8_ch7, 
		coeff_3_7_ch7, 
		coeff_3_6_ch7, 
		coeff_3_5_ch7, 
		coeff_3_4_ch7, 
		coeff_3_3_ch7, 
		coeff_3_2_ch7, 
		coeff_3_1_ch7, 
		coeff_3_0_ch7, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch7, 
		coeff_2_9_ch7, 
		coeff_2_8_ch7, 
		coeff_2_7_ch7, 
		coeff_2_6_ch7, 
		coeff_2_5_ch7, 
		coeff_2_4_ch7, 
		coeff_2_3_ch7, 
		coeff_2_2_ch7, 
		coeff_2_1_ch7, 
		coeff_2_0_ch7, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch7, 
		coeff_1_9_ch7, 
		coeff_1_8_ch7, 
		coeff_1_7_ch7, 
		coeff_1_6_ch7, 
		coeff_1_5_ch7, 
		coeff_1_4_ch7, 
		coeff_1_3_ch7, 
		coeff_1_2_ch7, 
		coeff_1_1_ch7, 
		coeff_1_0_ch7,

	//Channel 8
			//X-value that separates the sections
		section_limit_ch8,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch8, 
		recip_stdev_3_ch8, 
		recip_stdev_2_ch8, 
		recip_stdev_1_ch8, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch8, 
		neg_mean_3_ch8, 
		neg_mean_2_ch8, 
		neg_mean_1_ch8, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch8, 
		coeff_4_9_ch8, 
		coeff_4_8_ch8, 
		coeff_4_7_ch8, 
		coeff_4_6_ch8, 
		coeff_4_5_ch8, 
		coeff_4_4_ch8, 
		coeff_4_3_ch8, 
		coeff_4_2_ch8, 
		coeff_4_1_ch8, 
		coeff_4_0_ch8, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch8, 
		coeff_3_9_ch8, 
		coeff_3_8_ch8, 
		coeff_3_7_ch8, 
		coeff_3_6_ch8, 
		coeff_3_5_ch8, 
		coeff_3_4_ch8, 
		coeff_3_3_ch8, 
		coeff_3_2_ch8, 
		coeff_3_1_ch8, 
		coeff_3_0_ch8, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch8, 
		coeff_2_9_ch8, 
		coeff_2_8_ch8, 
		coeff_2_7_ch8, 
		coeff_2_6_ch8, 
		coeff_2_5_ch8, 
		coeff_2_4_ch8, 
		coeff_2_3_ch8, 
		coeff_2_2_ch8, 
		coeff_2_1_ch8, 
		coeff_2_0_ch8, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch8, 
		coeff_1_9_ch8, 
		coeff_1_8_ch8, 
		coeff_1_7_ch8, 
		coeff_1_6_ch8, 
		coeff_1_5_ch8, 
		coeff_1_4_ch8, 
		coeff_1_3_ch8, 
		coeff_1_2_ch8, 
		coeff_1_1_ch8, 
		coeff_1_0_ch8,

	//Channel 9
			//X-value that separates the sections
		section_limit_ch9,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch9, 
		recip_stdev_3_ch9, 
		recip_stdev_2_ch9, 
		recip_stdev_1_ch9, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch9, 
		neg_mean_3_ch9, 
		neg_mean_2_ch9, 
		neg_mean_1_ch9, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch9, 
		coeff_4_9_ch9, 
		coeff_4_8_ch9, 
		coeff_4_7_ch9, 
		coeff_4_6_ch9, 
		coeff_4_5_ch9, 
		coeff_4_4_ch9, 
		coeff_4_3_ch9, 
		coeff_4_2_ch9, 
		coeff_4_1_ch9, 
		coeff_4_0_ch9, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch9, 
		coeff_3_9_ch9, 
		coeff_3_8_ch9, 
		coeff_3_7_ch9, 
		coeff_3_6_ch9, 
		coeff_3_5_ch9, 
		coeff_3_4_ch9, 
		coeff_3_3_ch9, 
		coeff_3_2_ch9, 
		coeff_3_1_ch9, 
		coeff_3_0_ch9, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch9, 
		coeff_2_9_ch9, 
		coeff_2_8_ch9, 
		coeff_2_7_ch9, 
		coeff_2_6_ch9, 
		coeff_2_5_ch9, 
		coeff_2_4_ch9, 
		coeff_2_3_ch9, 
		coeff_2_2_ch9, 
		coeff_2_1_ch9, 
		coeff_2_0_ch9, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch9, 
		coeff_1_9_ch9, 
		coeff_1_8_ch9, 
		coeff_1_7_ch9, 
		coeff_1_6_ch9, 
		coeff_1_5_ch9, 
		coeff_1_4_ch9, 
		coeff_1_3_ch9, 
		coeff_1_2_ch9, 
		coeff_1_1_ch9, 
		coeff_1_0_ch9,

	//Channel 10
			//X-value that separates the sections
		section_limit_ch10,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch10, 
		recip_stdev_3_ch10, 
		recip_stdev_2_ch10, 
		recip_stdev_1_ch10, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch10, 
		neg_mean_3_ch10, 
		neg_mean_2_ch10, 
		neg_mean_1_ch10, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch10, 
		coeff_4_9_ch10, 
		coeff_4_8_ch10, 
		coeff_4_7_ch10, 
		coeff_4_6_ch10, 
		coeff_4_5_ch10, 
		coeff_4_4_ch10, 
		coeff_4_3_ch10, 
		coeff_4_2_ch10, 
		coeff_4_1_ch10, 
		coeff_4_0_ch10, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch10, 
		coeff_3_9_ch10, 
		coeff_3_8_ch10, 
		coeff_3_7_ch10, 
		coeff_3_6_ch10, 
		coeff_3_5_ch10, 
		coeff_3_4_ch10, 
		coeff_3_3_ch10, 
		coeff_3_2_ch10, 
		coeff_3_1_ch10, 
		coeff_3_0_ch10, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch10, 
		coeff_2_9_ch10, 
		coeff_2_8_ch10, 
		coeff_2_7_ch10, 
		coeff_2_6_ch10, 
		coeff_2_5_ch10, 
		coeff_2_4_ch10, 
		coeff_2_3_ch10, 
		coeff_2_2_ch10, 
		coeff_2_1_ch10, 
		coeff_2_0_ch10, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch10, 
		coeff_1_9_ch10, 
		coeff_1_8_ch10, 
		coeff_1_7_ch10, 
		coeff_1_6_ch10, 
		coeff_1_5_ch10, 
		coeff_1_4_ch10, 
		coeff_1_3_ch10, 
		coeff_1_2_ch10, 
		coeff_1_1_ch10, 
		coeff_1_0_ch10,

	//Channel 11
			//X-value that separates the sections
		section_limit_ch11,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch11, 
		recip_stdev_3_ch11, 
		recip_stdev_2_ch11, 
		recip_stdev_1_ch11, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch11, 
		neg_mean_3_ch11, 
		neg_mean_2_ch11, 
		neg_mean_1_ch11, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch11, 
		coeff_4_9_ch11, 
		coeff_4_8_ch11, 
		coeff_4_7_ch11, 
		coeff_4_6_ch11, 
		coeff_4_5_ch11, 
		coeff_4_4_ch11, 
		coeff_4_3_ch11, 
		coeff_4_2_ch11, 
		coeff_4_1_ch11, 
		coeff_4_0_ch11, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch11, 
		coeff_3_9_ch11, 
		coeff_3_8_ch11, 
		coeff_3_7_ch11, 
		coeff_3_6_ch11, 
		coeff_3_5_ch11, 
		coeff_3_4_ch11, 
		coeff_3_3_ch11, 
		coeff_3_2_ch11, 
		coeff_3_1_ch11, 
		coeff_3_0_ch11, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch11, 
		coeff_2_9_ch11, 
		coeff_2_8_ch11, 
		coeff_2_7_ch11, 
		coeff_2_6_ch11, 
		coeff_2_5_ch11, 
		coeff_2_4_ch11, 
		coeff_2_3_ch11, 
		coeff_2_2_ch11, 
		coeff_2_1_ch11, 
		coeff_2_0_ch11, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch11, 
		coeff_1_9_ch11, 
		coeff_1_8_ch11, 
		coeff_1_7_ch11, 
		coeff_1_6_ch11, 
		coeff_1_5_ch11, 
		coeff_1_4_ch11, 
		coeff_1_3_ch11, 
		coeff_1_2_ch11, 
		coeff_1_1_ch11, 
		coeff_1_0_ch11,

	//Channel 12
			//X-value that separates the sections
		section_limit_ch12,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch12, 
		recip_stdev_3_ch12, 
		recip_stdev_2_ch12, 
		recip_stdev_1_ch12, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch12, 
		neg_mean_3_ch12, 
		neg_mean_2_ch12, 
		neg_mean_1_ch12, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch12, 
		coeff_4_9_ch12, 
		coeff_4_8_ch12, 
		coeff_4_7_ch12, 
		coeff_4_6_ch12, 
		coeff_4_5_ch12, 
		coeff_4_4_ch12, 
		coeff_4_3_ch12, 
		coeff_4_2_ch12, 
		coeff_4_1_ch12, 
		coeff_4_0_ch12, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch12, 
		coeff_3_9_ch12, 
		coeff_3_8_ch12, 
		coeff_3_7_ch12, 
		coeff_3_6_ch12, 
		coeff_3_5_ch12, 
		coeff_3_4_ch12, 
		coeff_3_3_ch12, 
		coeff_3_2_ch12, 
		coeff_3_1_ch12, 
		coeff_3_0_ch12, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch12, 
		coeff_2_9_ch12, 
		coeff_2_8_ch12, 
		coeff_2_7_ch12, 
		coeff_2_6_ch12, 
		coeff_2_5_ch12, 
		coeff_2_4_ch12, 
		coeff_2_3_ch12, 
		coeff_2_2_ch12, 
		coeff_2_1_ch12, 
		coeff_2_0_ch12, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch12, 
		coeff_1_9_ch12, 
		coeff_1_8_ch12, 
		coeff_1_7_ch12, 
		coeff_1_6_ch12, 
		coeff_1_5_ch12, 
		coeff_1_4_ch12, 
		coeff_1_3_ch12, 
		coeff_1_2_ch12, 
		coeff_1_1_ch12, 
		coeff_1_0_ch12,

	//Channel 13
			//X-value that separates the sections
		section_limit_ch13,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch13, 
		recip_stdev_3_ch13, 
		recip_stdev_2_ch13, 
		recip_stdev_1_ch13, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch13, 
		neg_mean_3_ch13, 
		neg_mean_2_ch13, 
		neg_mean_1_ch13, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch13, 
		coeff_4_9_ch13, 
		coeff_4_8_ch13, 
		coeff_4_7_ch13, 
		coeff_4_6_ch13, 
		coeff_4_5_ch13, 
		coeff_4_4_ch13, 
		coeff_4_3_ch13, 
		coeff_4_2_ch13, 
		coeff_4_1_ch13, 
		coeff_4_0_ch13, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch13, 
		coeff_3_9_ch13, 
		coeff_3_8_ch13, 
		coeff_3_7_ch13, 
		coeff_3_6_ch13, 
		coeff_3_5_ch13, 
		coeff_3_4_ch13, 
		coeff_3_3_ch13, 
		coeff_3_2_ch13, 
		coeff_3_1_ch13, 
		coeff_3_0_ch13, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch13, 
		coeff_2_9_ch13, 
		coeff_2_8_ch13, 
		coeff_2_7_ch13, 
		coeff_2_6_ch13, 
		coeff_2_5_ch13, 
		coeff_2_4_ch13, 
		coeff_2_3_ch13, 
		coeff_2_2_ch13, 
		coeff_2_1_ch13, 
		coeff_2_0_ch13, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch13, 
		coeff_1_9_ch13, 
		coeff_1_8_ch13, 
		coeff_1_7_ch13, 
		coeff_1_6_ch13, 
		coeff_1_5_ch13, 
		coeff_1_4_ch13, 
		coeff_1_3_ch13, 
		coeff_1_2_ch13, 
		coeff_1_1_ch13, 
		coeff_1_0_ch13,

	//Channel 14
			//X-value that separates the sections
		section_limit_ch14,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch14, 
		recip_stdev_3_ch14, 
		recip_stdev_2_ch14, 
		recip_stdev_1_ch14, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch14, 
		neg_mean_3_ch14, 
		neg_mean_2_ch14, 
		neg_mean_1_ch14, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch14, 
		coeff_4_9_ch14, 
		coeff_4_8_ch14, 
		coeff_4_7_ch14, 
		coeff_4_6_ch14, 
		coeff_4_5_ch14, 
		coeff_4_4_ch14, 
		coeff_4_3_ch14, 
		coeff_4_2_ch14, 
		coeff_4_1_ch14, 
		coeff_4_0_ch14, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch14, 
		coeff_3_9_ch14, 
		coeff_3_8_ch14, 
		coeff_3_7_ch14, 
		coeff_3_6_ch14, 
		coeff_3_5_ch14, 
		coeff_3_4_ch14, 
		coeff_3_3_ch14, 
		coeff_3_2_ch14, 
		coeff_3_1_ch14, 
		coeff_3_0_ch14, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch14, 
		coeff_2_9_ch14, 
		coeff_2_8_ch14, 
		coeff_2_7_ch14, 
		coeff_2_6_ch14, 
		coeff_2_5_ch14, 
		coeff_2_4_ch14, 
		coeff_2_3_ch14, 
		coeff_2_2_ch14, 
		coeff_2_1_ch14, 
		coeff_2_0_ch14, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch14, 
		coeff_1_9_ch14, 
		coeff_1_8_ch14, 
		coeff_1_7_ch14, 
		coeff_1_6_ch14, 
		coeff_1_5_ch14, 
		coeff_1_4_ch14, 
		coeff_1_3_ch14, 
		coeff_1_2_ch14, 
		coeff_1_1_ch14, 
		coeff_1_0_ch14,

	//Channel 15
			//X-value that separates the sections
		section_limit_ch15,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch15, 
		recip_stdev_3_ch15, 
		recip_stdev_2_ch15, 
		recip_stdev_1_ch15, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch15, 
		neg_mean_3_ch15, 
		neg_mean_2_ch15, 
		neg_mean_1_ch15, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch15, 
		coeff_4_9_ch15, 
		coeff_4_8_ch15, 
		coeff_4_7_ch15, 
		coeff_4_6_ch15, 
		coeff_4_5_ch15, 
		coeff_4_4_ch15, 
		coeff_4_3_ch15, 
		coeff_4_2_ch15, 
		coeff_4_1_ch15, 
		coeff_4_0_ch15, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch15, 
		coeff_3_9_ch15, 
		coeff_3_8_ch15, 
		coeff_3_7_ch15, 
		coeff_3_6_ch15, 
		coeff_3_5_ch15, 
		coeff_3_4_ch15, 
		coeff_3_3_ch15, 
		coeff_3_2_ch15, 
		coeff_3_1_ch15, 
		coeff_3_0_ch15, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch15, 
		coeff_2_9_ch15, 
		coeff_2_8_ch15, 
		coeff_2_7_ch15, 
		coeff_2_6_ch15, 
		coeff_2_5_ch15, 
		coeff_2_4_ch15, 
		coeff_2_3_ch15, 
		coeff_2_2_ch15, 
		coeff_2_1_ch15, 
		coeff_2_0_ch15, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch15, 
		coeff_1_9_ch15, 
		coeff_1_8_ch15, 
		coeff_1_7_ch15, 
		coeff_1_6_ch15, 
		coeff_1_5_ch15, 
		coeff_1_4_ch15, 
		coeff_1_3_ch15, 
		coeff_1_2_ch15, 
		coeff_1_1_ch15, 
		coeff_1_0_ch15,

	//Channel 16
			//X-value that separates the sections
		section_limit_ch16,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch16, 
		recip_stdev_3_ch16, 
		recip_stdev_2_ch16, 
		recip_stdev_1_ch16, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch16, 
		neg_mean_3_ch16, 
		neg_mean_2_ch16, 
		neg_mean_1_ch16, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch16, 
		coeff_4_9_ch16, 
		coeff_4_8_ch16, 
		coeff_4_7_ch16, 
		coeff_4_6_ch16, 
		coeff_4_5_ch16, 
		coeff_4_4_ch16, 
		coeff_4_3_ch16, 
		coeff_4_2_ch16, 
		coeff_4_1_ch16, 
		coeff_4_0_ch16, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch16, 
		coeff_3_9_ch16, 
		coeff_3_8_ch16, 
		coeff_3_7_ch16, 
		coeff_3_6_ch16, 
		coeff_3_5_ch16, 
		coeff_3_4_ch16, 
		coeff_3_3_ch16, 
		coeff_3_2_ch16, 
		coeff_3_1_ch16, 
		coeff_3_0_ch16, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch16, 
		coeff_2_9_ch16, 
		coeff_2_8_ch16, 
		coeff_2_7_ch16, 
		coeff_2_6_ch16, 
		coeff_2_5_ch16, 
		coeff_2_4_ch16, 
		coeff_2_3_ch16, 
		coeff_2_2_ch16, 
		coeff_2_1_ch16, 
		coeff_2_0_ch16, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch16, 
		coeff_1_9_ch16, 
		coeff_1_8_ch16, 
		coeff_1_7_ch16, 
		coeff_1_6_ch16, 
		coeff_1_5_ch16, 
		coeff_1_4_ch16, 
		coeff_1_3_ch16, 
		coeff_1_2_ch16, 
		coeff_1_1_ch16, 
		coeff_1_0_ch16,

	//Channel 17
			//X-value that separates the sections
		section_limit_ch17,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch17, 
		recip_stdev_3_ch17, 
		recip_stdev_2_ch17, 
		recip_stdev_1_ch17, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch17, 
		neg_mean_3_ch17, 
		neg_mean_2_ch17, 
		neg_mean_1_ch17, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch17, 
		coeff_4_9_ch17, 
		coeff_4_8_ch17, 
		coeff_4_7_ch17, 
		coeff_4_6_ch17, 
		coeff_4_5_ch17, 
		coeff_4_4_ch17, 
		coeff_4_3_ch17, 
		coeff_4_2_ch17, 
		coeff_4_1_ch17, 
		coeff_4_0_ch17, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch17, 
		coeff_3_9_ch17, 
		coeff_3_8_ch17, 
		coeff_3_7_ch17, 
		coeff_3_6_ch17, 
		coeff_3_5_ch17, 
		coeff_3_4_ch17, 
		coeff_3_3_ch17, 
		coeff_3_2_ch17, 
		coeff_3_1_ch17, 
		coeff_3_0_ch17, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch17, 
		coeff_2_9_ch17, 
		coeff_2_8_ch17, 
		coeff_2_7_ch17, 
		coeff_2_6_ch17, 
		coeff_2_5_ch17, 
		coeff_2_4_ch17, 
		coeff_2_3_ch17, 
		coeff_2_2_ch17, 
		coeff_2_1_ch17, 
		coeff_2_0_ch17, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch17, 
		coeff_1_9_ch17, 
		coeff_1_8_ch17, 
		coeff_1_7_ch17, 
		coeff_1_6_ch17, 
		coeff_1_5_ch17, 
		coeff_1_4_ch17, 
		coeff_1_3_ch17, 
		coeff_1_2_ch17, 
		coeff_1_1_ch17, 
		coeff_1_0_ch17,

	//Channel 18
			//X-value that separates the sections
		section_limit_ch18,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch18, 
		recip_stdev_3_ch18, 
		recip_stdev_2_ch18, 
		recip_stdev_1_ch18, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch18, 
		neg_mean_3_ch18, 
		neg_mean_2_ch18, 
		neg_mean_1_ch18, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch18, 
		coeff_4_9_ch18, 
		coeff_4_8_ch18, 
		coeff_4_7_ch18, 
		coeff_4_6_ch18, 
		coeff_4_5_ch18, 
		coeff_4_4_ch18, 
		coeff_4_3_ch18, 
		coeff_4_2_ch18, 
		coeff_4_1_ch18, 
		coeff_4_0_ch18, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch18, 
		coeff_3_9_ch18, 
		coeff_3_8_ch18, 
		coeff_3_7_ch18, 
		coeff_3_6_ch18, 
		coeff_3_5_ch18, 
		coeff_3_4_ch18, 
		coeff_3_3_ch18, 
		coeff_3_2_ch18, 
		coeff_3_1_ch18, 
		coeff_3_0_ch18, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch18, 
		coeff_2_9_ch18, 
		coeff_2_8_ch18, 
		coeff_2_7_ch18, 
		coeff_2_6_ch18, 
		coeff_2_5_ch18, 
		coeff_2_4_ch18, 
		coeff_2_3_ch18, 
		coeff_2_2_ch18, 
		coeff_2_1_ch18, 
		coeff_2_0_ch18, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch18, 
		coeff_1_9_ch18, 
		coeff_1_8_ch18, 
		coeff_1_7_ch18, 
		coeff_1_6_ch18, 
		coeff_1_5_ch18, 
		coeff_1_4_ch18, 
		coeff_1_3_ch18, 
		coeff_1_2_ch18, 
		coeff_1_1_ch18, 
		coeff_1_0_ch18,

	//Channel 19
			//X-value that separates the sections
		section_limit_ch19,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch19, 
		recip_stdev_3_ch19, 
		recip_stdev_2_ch19, 
		recip_stdev_1_ch19, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch19, 
		neg_mean_3_ch19, 
		neg_mean_2_ch19, 
		neg_mean_1_ch19, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch19, 
		coeff_4_9_ch19, 
		coeff_4_8_ch19, 
		coeff_4_7_ch19, 
		coeff_4_6_ch19, 
		coeff_4_5_ch19, 
		coeff_4_4_ch19, 
		coeff_4_3_ch19, 
		coeff_4_2_ch19, 
		coeff_4_1_ch19, 
		coeff_4_0_ch19, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch19, 
		coeff_3_9_ch19, 
		coeff_3_8_ch19, 
		coeff_3_7_ch19, 
		coeff_3_6_ch19, 
		coeff_3_5_ch19, 
		coeff_3_4_ch19, 
		coeff_3_3_ch19, 
		coeff_3_2_ch19, 
		coeff_3_1_ch19, 
		coeff_3_0_ch19, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch19, 
		coeff_2_9_ch19, 
		coeff_2_8_ch19, 
		coeff_2_7_ch19, 
		coeff_2_6_ch19, 
		coeff_2_5_ch19, 
		coeff_2_4_ch19, 
		coeff_2_3_ch19, 
		coeff_2_2_ch19, 
		coeff_2_1_ch19, 
		coeff_2_0_ch19, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch19, 
		coeff_1_9_ch19, 
		coeff_1_8_ch19, 
		coeff_1_7_ch19, 
		coeff_1_6_ch19, 
		coeff_1_5_ch19, 
		coeff_1_4_ch19, 
		coeff_1_3_ch19, 
		coeff_1_2_ch19, 
		coeff_1_1_ch19, 
		coeff_1_0_ch19,

	//Channel 20
			//X-value that separates the sections
		section_limit_ch20,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch20, 
		recip_stdev_3_ch20, 
		recip_stdev_2_ch20, 
		recip_stdev_1_ch20, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch20, 
		neg_mean_3_ch20, 
		neg_mean_2_ch20, 
		neg_mean_1_ch20, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch20, 
		coeff_4_9_ch20, 
		coeff_4_8_ch20, 
		coeff_4_7_ch20, 
		coeff_4_6_ch20, 
		coeff_4_5_ch20, 
		coeff_4_4_ch20, 
		coeff_4_3_ch20, 
		coeff_4_2_ch20, 
		coeff_4_1_ch20, 
		coeff_4_0_ch20, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch20, 
		coeff_3_9_ch20, 
		coeff_3_8_ch20, 
		coeff_3_7_ch20, 
		coeff_3_6_ch20, 
		coeff_3_5_ch20, 
		coeff_3_4_ch20, 
		coeff_3_3_ch20, 
		coeff_3_2_ch20, 
		coeff_3_1_ch20, 
		coeff_3_0_ch20, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch20, 
		coeff_2_9_ch20, 
		coeff_2_8_ch20, 
		coeff_2_7_ch20, 
		coeff_2_6_ch20, 
		coeff_2_5_ch20, 
		coeff_2_4_ch20, 
		coeff_2_3_ch20, 
		coeff_2_2_ch20, 
		coeff_2_1_ch20, 
		coeff_2_0_ch20, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch20, 
		coeff_1_9_ch20, 
		coeff_1_8_ch20, 
		coeff_1_7_ch20, 
		coeff_1_6_ch20, 
		coeff_1_5_ch20, 
		coeff_1_4_ch20, 
		coeff_1_3_ch20, 
		coeff_1_2_ch20, 
		coeff_1_1_ch20, 
		coeff_1_0_ch20,

	//Channel 21
			//X-value that separates the sections
		section_limit_ch21,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch21, 
		recip_stdev_3_ch21, 
		recip_stdev_2_ch21, 
		recip_stdev_1_ch21, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch21, 
		neg_mean_3_ch21, 
		neg_mean_2_ch21, 
		neg_mean_1_ch21, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch21, 
		coeff_4_9_ch21, 
		coeff_4_8_ch21, 
		coeff_4_7_ch21, 
		coeff_4_6_ch21, 
		coeff_4_5_ch21, 
		coeff_4_4_ch21, 
		coeff_4_3_ch21, 
		coeff_4_2_ch21, 
		coeff_4_1_ch21, 
		coeff_4_0_ch21, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch21, 
		coeff_3_9_ch21, 
		coeff_3_8_ch21, 
		coeff_3_7_ch21, 
		coeff_3_6_ch21, 
		coeff_3_5_ch21, 
		coeff_3_4_ch21, 
		coeff_3_3_ch21, 
		coeff_3_2_ch21, 
		coeff_3_1_ch21, 
		coeff_3_0_ch21, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch21, 
		coeff_2_9_ch21, 
		coeff_2_8_ch21, 
		coeff_2_7_ch21, 
		coeff_2_6_ch21, 
		coeff_2_5_ch21, 
		coeff_2_4_ch21, 
		coeff_2_3_ch21, 
		coeff_2_2_ch21, 
		coeff_2_1_ch21, 
		coeff_2_0_ch21, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch21, 
		coeff_1_9_ch21, 
		coeff_1_8_ch21, 
		coeff_1_7_ch21, 
		coeff_1_6_ch21, 
		coeff_1_5_ch21, 
		coeff_1_4_ch21, 
		coeff_1_3_ch21, 
		coeff_1_2_ch21, 
		coeff_1_1_ch21, 
		coeff_1_0_ch21,

	//Channel 22
			//X-value that separates the sections
		section_limit_ch22,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch22, 
		recip_stdev_3_ch22, 
		recip_stdev_2_ch22, 
		recip_stdev_1_ch22, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch22, 
		neg_mean_3_ch22, 
		neg_mean_2_ch22, 
		neg_mean_1_ch22, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch22, 
		coeff_4_9_ch22, 
		coeff_4_8_ch22, 
		coeff_4_7_ch22, 
		coeff_4_6_ch22, 
		coeff_4_5_ch22, 
		coeff_4_4_ch22, 
		coeff_4_3_ch22, 
		coeff_4_2_ch22, 
		coeff_4_1_ch22, 
		coeff_4_0_ch22, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch22, 
		coeff_3_9_ch22, 
		coeff_3_8_ch22, 
		coeff_3_7_ch22, 
		coeff_3_6_ch22, 
		coeff_3_5_ch22, 
		coeff_3_4_ch22, 
		coeff_3_3_ch22, 
		coeff_3_2_ch22, 
		coeff_3_1_ch22, 
		coeff_3_0_ch22, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch22, 
		coeff_2_9_ch22, 
		coeff_2_8_ch22, 
		coeff_2_7_ch22, 
		coeff_2_6_ch22, 
		coeff_2_5_ch22, 
		coeff_2_4_ch22, 
		coeff_2_3_ch22, 
		coeff_2_2_ch22, 
		coeff_2_1_ch22, 
		coeff_2_0_ch22, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch22, 
		coeff_1_9_ch22, 
		coeff_1_8_ch22, 
		coeff_1_7_ch22, 
		coeff_1_6_ch22, 
		coeff_1_5_ch22, 
		coeff_1_4_ch22, 
		coeff_1_3_ch22, 
		coeff_1_2_ch22, 
		coeff_1_1_ch22, 
		coeff_1_0_ch22,

	//Channel 23
			//X-value that separates the sections
		section_limit_ch23,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch23, 
		recip_stdev_3_ch23, 
		recip_stdev_2_ch23, 
		recip_stdev_1_ch23, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch23, 
		neg_mean_3_ch23, 
		neg_mean_2_ch23, 
		neg_mean_1_ch23, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch23, 
		coeff_4_9_ch23, 
		coeff_4_8_ch23, 
		coeff_4_7_ch23, 
		coeff_4_6_ch23, 
		coeff_4_5_ch23, 
		coeff_4_4_ch23, 
		coeff_4_3_ch23, 
		coeff_4_2_ch23, 
		coeff_4_1_ch23, 
		coeff_4_0_ch23, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch23, 
		coeff_3_9_ch23, 
		coeff_3_8_ch23, 
		coeff_3_7_ch23, 
		coeff_3_6_ch23, 
		coeff_3_5_ch23, 
		coeff_3_4_ch23, 
		coeff_3_3_ch23, 
		coeff_3_2_ch23, 
		coeff_3_1_ch23, 
		coeff_3_0_ch23, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch23, 
		coeff_2_9_ch23, 
		coeff_2_8_ch23, 
		coeff_2_7_ch23, 
		coeff_2_6_ch23, 
		coeff_2_5_ch23, 
		coeff_2_4_ch23, 
		coeff_2_3_ch23, 
		coeff_2_2_ch23, 
		coeff_2_1_ch23, 
		coeff_2_0_ch23, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch23, 
		coeff_1_9_ch23, 
		coeff_1_8_ch23, 
		coeff_1_7_ch23, 
		coeff_1_6_ch23, 
		coeff_1_5_ch23, 
		coeff_1_4_ch23, 
		coeff_1_3_ch23, 
		coeff_1_2_ch23, 
		coeff_1_1_ch23, 
		coeff_1_0_ch23,

	//Channel 24
			//X-value that separates the sections
		section_limit_ch24,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch24, 
		recip_stdev_3_ch24, 
		recip_stdev_2_ch24, 
		recip_stdev_1_ch24, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch24, 
		neg_mean_3_ch24, 
		neg_mean_2_ch24, 
		neg_mean_1_ch24, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch24, 
		coeff_4_9_ch24, 
		coeff_4_8_ch24, 
		coeff_4_7_ch24, 
		coeff_4_6_ch24, 
		coeff_4_5_ch24, 
		coeff_4_4_ch24, 
		coeff_4_3_ch24, 
		coeff_4_2_ch24, 
		coeff_4_1_ch24, 
		coeff_4_0_ch24, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch24, 
		coeff_3_9_ch24, 
		coeff_3_8_ch24, 
		coeff_3_7_ch24, 
		coeff_3_6_ch24, 
		coeff_3_5_ch24, 
		coeff_3_4_ch24, 
		coeff_3_3_ch24, 
		coeff_3_2_ch24, 
		coeff_3_1_ch24, 
		coeff_3_0_ch24, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch24, 
		coeff_2_9_ch24, 
		coeff_2_8_ch24, 
		coeff_2_7_ch24, 
		coeff_2_6_ch24, 
		coeff_2_5_ch24, 
		coeff_2_4_ch24, 
		coeff_2_3_ch24, 
		coeff_2_2_ch24, 
		coeff_2_1_ch24, 
		coeff_2_0_ch24, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch24, 
		coeff_1_9_ch24, 
		coeff_1_8_ch24, 
		coeff_1_7_ch24, 
		coeff_1_6_ch24, 
		coeff_1_5_ch24, 
		coeff_1_4_ch24, 
		coeff_1_3_ch24, 
		coeff_1_2_ch24, 
		coeff_1_1_ch24, 
		coeff_1_0_ch24,

	//Channel 25
			//X-value that separates the sections
		section_limit_ch25,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch25, 
		recip_stdev_3_ch25, 
		recip_stdev_2_ch25, 
		recip_stdev_1_ch25, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch25, 
		neg_mean_3_ch25, 
		neg_mean_2_ch25, 
		neg_mean_1_ch25, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch25, 
		coeff_4_9_ch25, 
		coeff_4_8_ch25, 
		coeff_4_7_ch25, 
		coeff_4_6_ch25, 
		coeff_4_5_ch25, 
		coeff_4_4_ch25, 
		coeff_4_3_ch25, 
		coeff_4_2_ch25, 
		coeff_4_1_ch25, 
		coeff_4_0_ch25, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch25, 
		coeff_3_9_ch25, 
		coeff_3_8_ch25, 
		coeff_3_7_ch25, 
		coeff_3_6_ch25, 
		coeff_3_5_ch25, 
		coeff_3_4_ch25, 
		coeff_3_3_ch25, 
		coeff_3_2_ch25, 
		coeff_3_1_ch25, 
		coeff_3_0_ch25, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch25, 
		coeff_2_9_ch25, 
		coeff_2_8_ch25, 
		coeff_2_7_ch25, 
		coeff_2_6_ch25, 
		coeff_2_5_ch25, 
		coeff_2_4_ch25, 
		coeff_2_3_ch25, 
		coeff_2_2_ch25, 
		coeff_2_1_ch25, 
		coeff_2_0_ch25, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch25, 
		coeff_1_9_ch25, 
		coeff_1_8_ch25, 
		coeff_1_7_ch25, 
		coeff_1_6_ch25, 
		coeff_1_5_ch25, 
		coeff_1_4_ch25, 
		coeff_1_3_ch25, 
		coeff_1_2_ch25, 
		coeff_1_1_ch25, 
		coeff_1_0_ch25,

	//Channel 26
			//X-value that separates the sections
		section_limit_ch26,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch26, 
		recip_stdev_3_ch26, 
		recip_stdev_2_ch26, 
		recip_stdev_1_ch26, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch26, 
		neg_mean_3_ch26, 
		neg_mean_2_ch26, 
		neg_mean_1_ch26, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch26, 
		coeff_4_9_ch26, 
		coeff_4_8_ch26, 
		coeff_4_7_ch26, 
		coeff_4_6_ch26, 
		coeff_4_5_ch26, 
		coeff_4_4_ch26, 
		coeff_4_3_ch26, 
		coeff_4_2_ch26, 
		coeff_4_1_ch26, 
		coeff_4_0_ch26, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch26, 
		coeff_3_9_ch26, 
		coeff_3_8_ch26, 
		coeff_3_7_ch26, 
		coeff_3_6_ch26, 
		coeff_3_5_ch26, 
		coeff_3_4_ch26, 
		coeff_3_3_ch26, 
		coeff_3_2_ch26, 
		coeff_3_1_ch26, 
		coeff_3_0_ch26, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch26, 
		coeff_2_9_ch26, 
		coeff_2_8_ch26, 
		coeff_2_7_ch26, 
		coeff_2_6_ch26, 
		coeff_2_5_ch26, 
		coeff_2_4_ch26, 
		coeff_2_3_ch26, 
		coeff_2_2_ch26, 
		coeff_2_1_ch26, 
		coeff_2_0_ch26, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch26, 
		coeff_1_9_ch26, 
		coeff_1_8_ch26, 
		coeff_1_7_ch26, 
		coeff_1_6_ch26, 
		coeff_1_5_ch26, 
		coeff_1_4_ch26, 
		coeff_1_3_ch26, 
		coeff_1_2_ch26, 
		coeff_1_1_ch26, 
		coeff_1_0_ch26,

	//Channel 27
			//X-value that separates the sections
		section_limit_ch27,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch27, 
		recip_stdev_3_ch27, 
		recip_stdev_2_ch27, 
		recip_stdev_1_ch27, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch27, 
		neg_mean_3_ch27, 
		neg_mean_2_ch27, 
		neg_mean_1_ch27, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch27, 
		coeff_4_9_ch27, 
		coeff_4_8_ch27, 
		coeff_4_7_ch27, 
		coeff_4_6_ch27, 
		coeff_4_5_ch27, 
		coeff_4_4_ch27, 
		coeff_4_3_ch27, 
		coeff_4_2_ch27, 
		coeff_4_1_ch27, 
		coeff_4_0_ch27, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch27, 
		coeff_3_9_ch27, 
		coeff_3_8_ch27, 
		coeff_3_7_ch27, 
		coeff_3_6_ch27, 
		coeff_3_5_ch27, 
		coeff_3_4_ch27, 
		coeff_3_3_ch27, 
		coeff_3_2_ch27, 
		coeff_3_1_ch27, 
		coeff_3_0_ch27, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch27, 
		coeff_2_9_ch27, 
		coeff_2_8_ch27, 
		coeff_2_7_ch27, 
		coeff_2_6_ch27, 
		coeff_2_5_ch27, 
		coeff_2_4_ch27, 
		coeff_2_3_ch27, 
		coeff_2_2_ch27, 
		coeff_2_1_ch27, 
		coeff_2_0_ch27, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch27, 
		coeff_1_9_ch27, 
		coeff_1_8_ch27, 
		coeff_1_7_ch27, 
		coeff_1_6_ch27, 
		coeff_1_5_ch27, 
		coeff_1_4_ch27, 
		coeff_1_3_ch27, 
		coeff_1_2_ch27, 
		coeff_1_1_ch27, 
		coeff_1_0_ch27,

	//Channel 28
			//X-value that separates the sections
		section_limit_ch28,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch28, 
		recip_stdev_3_ch28, 
		recip_stdev_2_ch28, 
		recip_stdev_1_ch28, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch28, 
		neg_mean_3_ch28, 
		neg_mean_2_ch28, 
		neg_mean_1_ch28, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch28, 
		coeff_4_9_ch28, 
		coeff_4_8_ch28, 
		coeff_4_7_ch28, 
		coeff_4_6_ch28, 
		coeff_4_5_ch28, 
		coeff_4_4_ch28, 
		coeff_4_3_ch28, 
		coeff_4_2_ch28, 
		coeff_4_1_ch28, 
		coeff_4_0_ch28, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch28, 
		coeff_3_9_ch28, 
		coeff_3_8_ch28, 
		coeff_3_7_ch28, 
		coeff_3_6_ch28, 
		coeff_3_5_ch28, 
		coeff_3_4_ch28, 
		coeff_3_3_ch28, 
		coeff_3_2_ch28, 
		coeff_3_1_ch28, 
		coeff_3_0_ch28, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch28, 
		coeff_2_9_ch28, 
		coeff_2_8_ch28, 
		coeff_2_7_ch28, 
		coeff_2_6_ch28, 
		coeff_2_5_ch28, 
		coeff_2_4_ch28, 
		coeff_2_3_ch28, 
		coeff_2_2_ch28, 
		coeff_2_1_ch28, 
		coeff_2_0_ch28, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch28, 
		coeff_1_9_ch28, 
		coeff_1_8_ch28, 
		coeff_1_7_ch28, 
		coeff_1_6_ch28, 
		coeff_1_5_ch28, 
		coeff_1_4_ch28, 
		coeff_1_3_ch28, 
		coeff_1_2_ch28, 
		coeff_1_1_ch28, 
		coeff_1_0_ch28,

	//Channel 29
			//X-value that separates the sections
		section_limit_ch29,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch29, 
		recip_stdev_3_ch29, 
		recip_stdev_2_ch29, 
		recip_stdev_1_ch29, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch29, 
		neg_mean_3_ch29, 
		neg_mean_2_ch29, 
		neg_mean_1_ch29, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch29, 
		coeff_4_9_ch29, 
		coeff_4_8_ch29, 
		coeff_4_7_ch29, 
		coeff_4_6_ch29, 
		coeff_4_5_ch29, 
		coeff_4_4_ch29, 
		coeff_4_3_ch29, 
		coeff_4_2_ch29, 
		coeff_4_1_ch29, 
		coeff_4_0_ch29, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch29, 
		coeff_3_9_ch29, 
		coeff_3_8_ch29, 
		coeff_3_7_ch29, 
		coeff_3_6_ch29, 
		coeff_3_5_ch29, 
		coeff_3_4_ch29, 
		coeff_3_3_ch29, 
		coeff_3_2_ch29, 
		coeff_3_1_ch29, 
		coeff_3_0_ch29, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch29, 
		coeff_2_9_ch29, 
		coeff_2_8_ch29, 
		coeff_2_7_ch29, 
		coeff_2_6_ch29, 
		coeff_2_5_ch29, 
		coeff_2_4_ch29, 
		coeff_2_3_ch29, 
		coeff_2_2_ch29, 
		coeff_2_1_ch29, 
		coeff_2_0_ch29, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch29, 
		coeff_1_9_ch29, 
		coeff_1_8_ch29, 
		coeff_1_7_ch29, 
		coeff_1_6_ch29, 
		coeff_1_5_ch29, 
		coeff_1_4_ch29, 
		coeff_1_3_ch29, 
		coeff_1_2_ch29, 
		coeff_1_1_ch29, 
		coeff_1_0_ch29,

	//Channel 30
			//X-value that separates the sections
		section_limit_ch30,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch30, 
		recip_stdev_3_ch30, 
		recip_stdev_2_ch30, 
		recip_stdev_1_ch30, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch30, 
		neg_mean_3_ch30, 
		neg_mean_2_ch30, 
		neg_mean_1_ch30, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch30, 
		coeff_4_9_ch30, 
		coeff_4_8_ch30, 
		coeff_4_7_ch30, 
		coeff_4_6_ch30, 
		coeff_4_5_ch30, 
		coeff_4_4_ch30, 
		coeff_4_3_ch30, 
		coeff_4_2_ch30, 
		coeff_4_1_ch30, 
		coeff_4_0_ch30, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch30, 
		coeff_3_9_ch30, 
		coeff_3_8_ch30, 
		coeff_3_7_ch30, 
		coeff_3_6_ch30, 
		coeff_3_5_ch30, 
		coeff_3_4_ch30, 
		coeff_3_3_ch30, 
		coeff_3_2_ch30, 
		coeff_3_1_ch30, 
		coeff_3_0_ch30, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch30, 
		coeff_2_9_ch30, 
		coeff_2_8_ch30, 
		coeff_2_7_ch30, 
		coeff_2_6_ch30, 
		coeff_2_5_ch30, 
		coeff_2_4_ch30, 
		coeff_2_3_ch30, 
		coeff_2_2_ch30, 
		coeff_2_1_ch30, 
		coeff_2_0_ch30, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch30, 
		coeff_1_9_ch30, 
		coeff_1_8_ch30, 
		coeff_1_7_ch30, 
		coeff_1_6_ch30, 
		coeff_1_5_ch30, 
		coeff_1_4_ch30, 
		coeff_1_3_ch30, 
		coeff_1_2_ch30, 
		coeff_1_1_ch30, 
		coeff_1_0_ch30,

	//Channel 31
			//X-value that separates the sections
		section_limit_ch31,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch31, 
		recip_stdev_3_ch31, 
		recip_stdev_2_ch31, 
		recip_stdev_1_ch31, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch31, 
		neg_mean_3_ch31, 
		neg_mean_2_ch31, 
		neg_mean_1_ch31, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch31, 
		coeff_4_9_ch31, 
		coeff_4_8_ch31, 
		coeff_4_7_ch31, 
		coeff_4_6_ch31, 
		coeff_4_5_ch31, 
		coeff_4_4_ch31, 
		coeff_4_3_ch31, 
		coeff_4_2_ch31, 
		coeff_4_1_ch31, 
		coeff_4_0_ch31, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch31, 
		coeff_3_9_ch31, 
		coeff_3_8_ch31, 
		coeff_3_7_ch31, 
		coeff_3_6_ch31, 
		coeff_3_5_ch31, 
		coeff_3_4_ch31, 
		coeff_3_3_ch31, 
		coeff_3_2_ch31, 
		coeff_3_1_ch31, 
		coeff_3_0_ch31, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch31, 
		coeff_2_9_ch31, 
		coeff_2_8_ch31, 
		coeff_2_7_ch31, 
		coeff_2_6_ch31, 
		coeff_2_5_ch31, 
		coeff_2_4_ch31, 
		coeff_2_3_ch31, 
		coeff_2_2_ch31, 
		coeff_2_1_ch31, 
		coeff_2_0_ch31, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch31, 
		coeff_1_9_ch31, 
		coeff_1_8_ch31, 
		coeff_1_7_ch31, 
		coeff_1_6_ch31, 
		coeff_1_5_ch31, 
		coeff_1_4_ch31, 
		coeff_1_3_ch31, 
		coeff_1_2_ch31, 
		coeff_1_1_ch31, 
		coeff_1_0_ch31,

	//Channel 32
			//X-value that separates the sections
		section_limit_ch32,

		//Reciprocal standard deviation for the centered and scaled fit
		recip_stdev_4_ch32, 
		recip_stdev_3_ch32, 
		recip_stdev_2_ch32, 
		recip_stdev_1_ch32, 

		//Negative meand for the centered and scaled fit
		neg_mean_4_ch32, 
		neg_mean_3_ch32, 
		neg_mean_2_ch32, 
		neg_mean_1_ch32, 

		//Section 4 coefficients (x > 0, |x| > section_limit)
		coeff_4_10_ch32, 
		coeff_4_9_ch32, 
		coeff_4_8_ch32, 
		coeff_4_7_ch32, 
		coeff_4_6_ch32, 
		coeff_4_5_ch32, 
		coeff_4_4_ch32, 
		coeff_4_3_ch32, 
		coeff_4_2_ch32, 
		coeff_4_1_ch32, 
		coeff_4_0_ch32, 

		//Section 3 coefficients (x > 0, |x| <= section_limit)
		coeff_3_10_ch32, 
		coeff_3_9_ch32, 
		coeff_3_8_ch32, 
		coeff_3_7_ch32, 
		coeff_3_6_ch32, 
		coeff_3_5_ch32, 
		coeff_3_4_ch32, 
		coeff_3_3_ch32, 
		coeff_3_2_ch32, 
		coeff_3_1_ch32, 
		coeff_3_0_ch32, 

		//Section 2 coefficients (x <= 0, |x| <= section_limit)
		coeff_2_10_ch32, 
		coeff_2_9_ch32, 
		coeff_2_8_ch32, 
		coeff_2_7_ch32, 
		coeff_2_6_ch32, 
		coeff_2_5_ch32, 
		coeff_2_4_ch32, 
		coeff_2_3_ch32, 
		coeff_2_2_ch32, 
		coeff_2_1_ch32, 
		coeff_2_0_ch32, 

		//Section 1 coefficients (x <= 0, |x| > section_limit)
		coeff_1_10_ch32, 
		coeff_1_9_ch32, 
		coeff_1_8_ch32, 
		coeff_1_7_ch32, 
		coeff_1_6_ch32, 
		coeff_1_5_ch32, 
		coeff_1_4_ch32, 
		coeff_1_3_ch32, 
		coeff_1_2_ch32, 
		coeff_1_1_ch32, 
		coeff_1_0_ch32	
);

//System clock and reset
	input clk;
	input reset;
	
	//ADC output
	output [20:0] x_lin_ch1;
	output [20:0] x_lin_ch2;
	output [20:0] x_lin_ch3;
	output [20:0] x_lin_ch4;
	output [20:0] x_lin_ch5;
	output [20:0] x_lin_ch6;
	output [20:0] x_lin_ch7;
	output [20:0] x_lin_ch8;
	output [20:0] x_lin_ch9;
	output [20:0] x_lin_ch10;
	output [20:0] x_lin_ch11;
	output [20:0] x_lin_ch12;
	output [20:0] x_lin_ch13;
	output [20:0] x_lin_ch14;
	output [20:0] x_lin_ch15;
	output [20:0] x_lin_ch16;
	output [20:0] x_lin_ch17;
	output [20:0] x_lin_ch18;
	output [20:0] x_lin_ch19;
	output [20:0] x_lin_ch20;
	output [20:0] x_lin_ch21;
	output [20:0] x_lin_ch22;
	output [20:0] x_lin_ch23;
	output [20:0] x_lin_ch24;
	output [20:0] x_lin_ch25;
	output [20:0] x_lin_ch26;
	output [20:0] x_lin_ch27;
	output [20:0] x_lin_ch28;
	output [20:0] x_lin_ch29;
	output [20:0] x_lin_ch30;
	output [20:0] x_lin_ch31;
	output [20:0] x_lin_ch32;
	output srdyi;
	
	//NLC output
	output srdyo; 

	input [20:0] x_adc_ch1; 
	input [20:0] x_adc_ch2; 
	input [20:0] x_adc_ch3; 
	input [20:0] x_adc_ch4; 
	input [20:0] x_adc_ch5; 
	input [20:0] x_adc_ch6; 
	input [20:0] x_adc_ch7; 
	input [20:0] x_adc_ch8; 
	input [20:0] x_adc_ch9; 
	input [20:0] x_adc_ch10; 
	input [20:0] x_adc_ch11; 
	input [20:0] x_adc_ch12; 
	input [20:0] x_adc_ch13; 
	input [20:0] x_adc_ch14; 
	input [20:0] x_adc_ch15; 
	input [20:0] x_adc_ch16; 
	input [20:0] x_adc_ch17; 
	input [20:0] x_adc_ch18; 
	input [20:0] x_adc_ch19; 
	input [20:0] x_adc_ch20; 
	input [20:0] x_adc_ch21; 
	input [20:0] x_adc_ch22; 
	input [20:0] x_adc_ch23; 
	input [20:0] x_adc_ch24; 
	input [20:0] x_adc_ch25; 
	input [20:0] x_adc_ch26; 
	input [20:0] x_adc_ch27; 
	input [20:0] x_adc_ch28; 
	input [20:0] x_adc_ch29; 
	input [20:0] x_adc_ch30; 
	input [20:0] x_adc_ch31; 
	input [20:0] x_adc_ch32;
	
	//Channel 1
	//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch1; 
	input [31:0] recip_stdev_3_ch1; 
	input [31:0] recip_stdev_2_ch1; 
	input [31:0] recip_stdev_1_ch1; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch1;
	input [31:0] neg_mean_3_ch1; 
	input [31:0] neg_mean_2_ch1; 
	input [31:0] neg_mean_1_ch1; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch1;
	input [31:0] coeff_4_9_ch1;
	input [31:0] coeff_4_8_ch1; 
	input [31:0] coeff_4_7_ch1; 
	input [31:0] coeff_4_6_ch1; 
	input [31:0] coeff_4_5_ch1; 
	input [31:0] coeff_4_4_ch1; 
	input [31:0] coeff_4_3_ch1; 
	input [31:0] coeff_4_2_ch1; 
	input [31:0] coeff_4_1_ch1; 
	input [31:0] coeff_4_0_ch1; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch1; 
	input [31:0] coeff_3_9_ch1; 
	input [31:0] coeff_3_8_ch1; 
	input [31:0] coeff_3_7_ch1; 
	input [31:0] coeff_3_6_ch1; 
	input [31:0] coeff_3_5_ch1; 
	input [31:0] coeff_3_4_ch1; 
	input [31:0] coeff_3_3_ch1; 
	input [31:0] coeff_3_2_ch1; 
	input [31:0] coeff_3_1_ch1; 
	input [31:0] coeff_3_0_ch1; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch1; 
	input [31:0] coeff_2_9_ch1; 
	input [31:0] coeff_2_8_ch1; 
	input [31:0] coeff_2_7_ch1; 
	input [31:0] coeff_2_6_ch1; 
	input [31:0] coeff_2_5_ch1; 
	input [31:0] coeff_2_4_ch1; 
	input [31:0] coeff_2_3_ch1; 
	input [31:0] coeff_2_2_ch1; 
	input [31:0] coeff_2_1_ch1; 
	input [31:0] coeff_2_0_ch1; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch1;
	input [31:0] coeff_1_9_ch1; 
	input [31:0] coeff_1_8_ch1; 
	input [31:0] coeff_1_7_ch1; 
	input [31:0] coeff_1_6_ch1; 
	input [31:0] coeff_1_5_ch1; 
	input [31:0] coeff_1_4_ch1; 
	input [31:0] coeff_1_3_ch1; 
	input [31:0] coeff_1_2_ch1; 
	input [31:0] coeff_1_1_ch1; 
	input [31:0] coeff_1_0_ch1;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch1;
	
	//Channel 2
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch2; 
	input [31:0] recip_stdev_3_ch2; 
	input [31:0] recip_stdev_2_ch2; 
	input [31:0] recip_stdev_1_ch2; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch2;
	input [31:0] neg_mean_3_ch2; 
	input [31:0] neg_mean_2_ch2; 
	input [31:0] neg_mean_1_ch2; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch2;
	input [31:0] coeff_4_9_ch2;
	input [31:0] coeff_4_8_ch2; 
	input [31:0] coeff_4_7_ch2; 
	input [31:0] coeff_4_6_ch2; 
	input [31:0] coeff_4_5_ch2; 
	input [31:0] coeff_4_4_ch2; 
	input [31:0] coeff_4_3_ch2; 
	input [31:0] coeff_4_2_ch2; 
	input [31:0] coeff_4_1_ch2; 
	input [31:0] coeff_4_0_ch2; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch2; 
	input [31:0] coeff_3_9_ch2; 
	input [31:0] coeff_3_8_ch2; 
	input [31:0] coeff_3_7_ch2; 
	input [31:0] coeff_3_6_ch2; 
	input [31:0] coeff_3_5_ch2; 
	input [31:0] coeff_3_4_ch2; 
	input [31:0] coeff_3_3_ch2; 
	input [31:0] coeff_3_2_ch2; 
	input [31:0] coeff_3_1_ch2; 
	input [31:0] coeff_3_0_ch2; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch2; 
	input [31:0] coeff_2_9_ch2; 
	input [31:0] coeff_2_8_ch2; 
	input [31:0] coeff_2_7_ch2; 
	input [31:0] coeff_2_6_ch2; 
	input [31:0] coeff_2_5_ch2; 
	input [31:0] coeff_2_4_ch2; 
	input [31:0] coeff_2_3_ch2; 
	input [31:0] coeff_2_2_ch2; 
	input [31:0] coeff_2_1_ch2; 
	input [31:0] coeff_2_0_ch2; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch2;
	input [31:0] coeff_1_9_ch2; 
	input [31:0] coeff_1_8_ch2; 
	input [31:0] coeff_1_7_ch2; 
	input [31:0] coeff_1_6_ch2; 
	input [31:0] coeff_1_5_ch2; 
	input [31:0] coeff_1_4_ch2; 
	input [31:0] coeff_1_3_ch2; 
	input [31:0] coeff_1_2_ch2; 
	input [31:0] coeff_1_1_ch2; 
	input [31:0] coeff_1_0_ch2;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch2;
	
	//Channel 3
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch3; 
	input [31:0] recip_stdev_3_ch3; 
	input [31:0] recip_stdev_2_ch3; 
	input [31:0] recip_stdev_1_ch3; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch3;
	input [31:0] neg_mean_3_ch3; 
	input [31:0] neg_mean_2_ch3; 
	input [31:0] neg_mean_1_ch3; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch3;
	input [31:0] coeff_4_9_ch3;
	input [31:0] coeff_4_8_ch3; 
	input [31:0] coeff_4_7_ch3; 
	input [31:0] coeff_4_6_ch3; 
	input [31:0] coeff_4_5_ch3; 
	input [31:0] coeff_4_4_ch3; 
	input [31:0] coeff_4_3_ch3; 
	input [31:0] coeff_4_2_ch3; 
	input [31:0] coeff_4_1_ch3; 
	input [31:0] coeff_4_0_ch3; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch3; 
	input [31:0] coeff_3_9_ch3; 
	input [31:0] coeff_3_8_ch3; 
	input [31:0] coeff_3_7_ch3; 
	input [31:0] coeff_3_6_ch3; 
	input [31:0] coeff_3_5_ch3; 
	input [31:0] coeff_3_4_ch3; 
	input [31:0] coeff_3_3_ch3; 
	input [31:0] coeff_3_2_ch3; 
	input [31:0] coeff_3_1_ch3; 
	input [31:0] coeff_3_0_ch3; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch3; 
	input [31:0] coeff_2_9_ch3; 
	input [31:0] coeff_2_8_ch3; 
	input [31:0] coeff_2_7_ch3; 
	input [31:0] coeff_2_6_ch3; 
	input [31:0] coeff_2_5_ch3; 
	input [31:0] coeff_2_4_ch3; 
	input [31:0] coeff_2_3_ch3; 
	input [31:0] coeff_2_2_ch3; 
	input [31:0] coeff_2_1_ch3; 
	input [31:0] coeff_2_0_ch3; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch3;
	input [31:0] coeff_1_9_ch3; 
	input [31:0] coeff_1_8_ch3; 
	input [31:0] coeff_1_7_ch3; 
	input [31:0] coeff_1_6_ch3; 
	input [31:0] coeff_1_5_ch3; 
	input [31:0] coeff_1_4_ch3; 
	input [31:0] coeff_1_3_ch3; 
	input [31:0] coeff_1_2_ch3; 
	input [31:0] coeff_1_1_ch3; 
	input [31:0] coeff_1_0_ch3;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch3;
	
	//Channel 4
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch4; 
	input [31:0] recip_stdev_3_ch4; 
	input [31:0] recip_stdev_2_ch4; 
	input [31:0] recip_stdev_1_ch4; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch4;
	input [31:0] neg_mean_3_ch4; 
	input [31:0] neg_mean_2_ch4; 
	input [31:0] neg_mean_1_ch4; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch4;
	input [31:0] coeff_4_9_ch4;
	input [31:0] coeff_4_8_ch4; 
	input [31:0] coeff_4_7_ch4; 
	input [31:0] coeff_4_6_ch4; 
	input [31:0] coeff_4_5_ch4; 
	input [31:0] coeff_4_4_ch4; 
	input [31:0] coeff_4_3_ch4; 
	input [31:0] coeff_4_2_ch4; 
	input [31:0] coeff_4_1_ch4; 
	input [31:0] coeff_4_0_ch4; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch4; 
	input [31:0] coeff_3_9_ch4; 
	input [31:0] coeff_3_8_ch4; 
	input [31:0] coeff_3_7_ch4; 
	input [31:0] coeff_3_6_ch4; 
	input [31:0] coeff_3_5_ch4; 
	input [31:0] coeff_3_4_ch4; 
	input [31:0] coeff_3_3_ch4; 
	input [31:0] coeff_3_2_ch4; 
	input [31:0] coeff_3_1_ch4; 
	input [31:0] coeff_3_0_ch4; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch4; 
	input [31:0] coeff_2_9_ch4; 
	input [31:0] coeff_2_8_ch4; 
	input [31:0] coeff_2_7_ch4; 
	input [31:0] coeff_2_6_ch4; 
	input [31:0] coeff_2_5_ch4; 
	input [31:0] coeff_2_4_ch4; 
	input [31:0] coeff_2_3_ch4; 
	input [31:0] coeff_2_2_ch4; 
	input [31:0] coeff_2_1_ch4; 
	input [31:0] coeff_2_0_ch4; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch4;
	input [31:0] coeff_1_9_ch4; 
	input [31:0] coeff_1_8_ch4; 
	input [31:0] coeff_1_7_ch4; 
	input [31:0] coeff_1_6_ch4; 
	input [31:0] coeff_1_5_ch4; 
	input [31:0] coeff_1_4_ch4; 
	input [31:0] coeff_1_3_ch4; 
	input [31:0] coeff_1_2_ch4; 
	input [31:0] coeff_1_1_ch4; 
	input [31:0] coeff_1_0_ch4;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch4;
	
	//Channel 5
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch5; 
	input [31:0] recip_stdev_3_ch5; 
	input [31:0] recip_stdev_2_ch5; 
	input [31:0] recip_stdev_1_ch5; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch5;
	input [31:0] neg_mean_3_ch5; 
	input [31:0] neg_mean_2_ch5; 
	input [31:0] neg_mean_1_ch5; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch5;
	input [31:0] coeff_4_9_ch5;
	input [31:0] coeff_4_8_ch5; 
	input [31:0] coeff_4_7_ch5; 
	input [31:0] coeff_4_6_ch5; 
	input [31:0] coeff_4_5_ch5; 
	input [31:0] coeff_4_4_ch5; 
	input [31:0] coeff_4_3_ch5; 
	input [31:0] coeff_4_2_ch5; 
	input [31:0] coeff_4_1_ch5; 
	input [31:0] coeff_4_0_ch5; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch5; 
	input [31:0] coeff_3_9_ch5; 
	input [31:0] coeff_3_8_ch5; 
	input [31:0] coeff_3_7_ch5; 
	input [31:0] coeff_3_6_ch5; 
	input [31:0] coeff_3_5_ch5; 
	input [31:0] coeff_3_4_ch5; 
	input [31:0] coeff_3_3_ch5; 
	input [31:0] coeff_3_2_ch5; 
	input [31:0] coeff_3_1_ch5; 
	input [31:0] coeff_3_0_ch5; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch5; 
	input [31:0] coeff_2_9_ch5; 
	input [31:0] coeff_2_8_ch5; 
	input [31:0] coeff_2_7_ch5; 
	input [31:0] coeff_2_6_ch5; 
	input [31:0] coeff_2_5_ch5; 
	input [31:0] coeff_2_4_ch5; 
	input [31:0] coeff_2_3_ch5; 
	input [31:0] coeff_2_2_ch5; 
	input [31:0] coeff_2_1_ch5; 
	input [31:0] coeff_2_0_ch5; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch5;
	input [31:0] coeff_1_9_ch5; 
	input [31:0] coeff_1_8_ch5; 
	input [31:0] coeff_1_7_ch5; 
	input [31:0] coeff_1_6_ch5; 
	input [31:0] coeff_1_5_ch5; 
	input [31:0] coeff_1_4_ch5; 
	input [31:0] coeff_1_3_ch5; 
	input [31:0] coeff_1_2_ch5; 
	input [31:0] coeff_1_1_ch5; 
	input [31:0] coeff_1_0_ch5;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch5;
	
	//Channel 6
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch6; 
	input [31:0] recip_stdev_3_ch6; 
	input [31:0] recip_stdev_2_ch6; 
	input [31:0] recip_stdev_1_ch6; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch6;
	input [31:0] neg_mean_3_ch6; 
	input [31:0] neg_mean_2_ch6; 
	input [31:0] neg_mean_1_ch6; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch6;
	input [31:0] coeff_4_9_ch6;
	input [31:0] coeff_4_8_ch6; 
	input [31:0] coeff_4_7_ch6; 
	input [31:0] coeff_4_6_ch6; 
	input [31:0] coeff_4_5_ch6; 
	input [31:0] coeff_4_4_ch6; 
	input [31:0] coeff_4_3_ch6; 
	input [31:0] coeff_4_2_ch6; 
	input [31:0] coeff_4_1_ch6; 
	input [31:0] coeff_4_0_ch6; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch6; 
	input [31:0] coeff_3_9_ch6; 
	input [31:0] coeff_3_8_ch6; 
	input [31:0] coeff_3_7_ch6; 
	input [31:0] coeff_3_6_ch6; 
	input [31:0] coeff_3_5_ch6; 
	input [31:0] coeff_3_4_ch6; 
	input [31:0] coeff_3_3_ch6; 
	input [31:0] coeff_3_2_ch6; 
	input [31:0] coeff_3_1_ch6; 
	input [31:0] coeff_3_0_ch6; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch6; 
	input [31:0] coeff_2_9_ch6; 
	input [31:0] coeff_2_8_ch6; 
	input [31:0] coeff_2_7_ch6; 
	input [31:0] coeff_2_6_ch6; 
	input [31:0] coeff_2_5_ch6; 
	input [31:0] coeff_2_4_ch6; 
	input [31:0] coeff_2_3_ch6; 
	input [31:0] coeff_2_2_ch6; 
	input [31:0] coeff_2_1_ch6; 
	input [31:0] coeff_2_0_ch6; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch6;
	input [31:0] coeff_1_9_ch6; 
	input [31:0] coeff_1_8_ch6; 
	input [31:0] coeff_1_7_ch6; 
	input [31:0] coeff_1_6_ch6; 
	input [31:0] coeff_1_5_ch6; 
	input [31:0] coeff_1_4_ch6; 
	input [31:0] coeff_1_3_ch6; 
	input [31:0] coeff_1_2_ch6; 
	input [31:0] coeff_1_1_ch6; 
	input [31:0] coeff_1_0_ch6;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch6;
	
	//Channel 7
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch7; 
	input [31:0] recip_stdev_3_ch7; 
	input [31:0] recip_stdev_2_ch7; 
	input [31:0] recip_stdev_1_ch7; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch7;
	input [31:0] neg_mean_3_ch7; 
	input [31:0] neg_mean_2_ch7; 
	input [31:0] neg_mean_1_ch7; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch7;
	input [31:0] coeff_4_9_ch7;
	input [31:0] coeff_4_8_ch7; 
	input [31:0] coeff_4_7_ch7; 
	input [31:0] coeff_4_6_ch7; 
	input [31:0] coeff_4_5_ch7; 
	input [31:0] coeff_4_4_ch7; 
	input [31:0] coeff_4_3_ch7; 
	input [31:0] coeff_4_2_ch7; 
	input [31:0] coeff_4_1_ch7; 
	input [31:0] coeff_4_0_ch7; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch7; 
	input [31:0] coeff_3_9_ch7; 
	input [31:0] coeff_3_8_ch7; 
	input [31:0] coeff_3_7_ch7; 
	input [31:0] coeff_3_6_ch7; 
	input [31:0] coeff_3_5_ch7; 
	input [31:0] coeff_3_4_ch7; 
	input [31:0] coeff_3_3_ch7; 
	input [31:0] coeff_3_2_ch7; 
	input [31:0] coeff_3_1_ch7; 
	input [31:0] coeff_3_0_ch7; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch7; 
	input [31:0] coeff_2_9_ch7; 
	input [31:0] coeff_2_8_ch7; 
	input [31:0] coeff_2_7_ch7; 
	input [31:0] coeff_2_6_ch7; 
	input [31:0] coeff_2_5_ch7; 
	input [31:0] coeff_2_4_ch7; 
	input [31:0] coeff_2_3_ch7; 
	input [31:0] coeff_2_2_ch7; 
	input [31:0] coeff_2_1_ch7; 
	input [31:0] coeff_2_0_ch7; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch7;
	input [31:0] coeff_1_9_ch7; 
	input [31:0] coeff_1_8_ch7; 
	input [31:0] coeff_1_7_ch7; 
	input [31:0] coeff_1_6_ch7; 
	input [31:0] coeff_1_5_ch7; 
	input [31:0] coeff_1_4_ch7; 
	input [31:0] coeff_1_3_ch7; 
	input [31:0] coeff_1_2_ch7; 
	input [31:0] coeff_1_1_ch7; 
	input [31:0] coeff_1_0_ch7;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch7;
	
	//Channel 8
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch8; 
	input [31:0] recip_stdev_3_ch8; 
	input [31:0] recip_stdev_2_ch8; 
	input [31:0] recip_stdev_1_ch8; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch8;
	input [31:0] neg_mean_3_ch8; 
	input [31:0] neg_mean_2_ch8; 
	input [31:0] neg_mean_1_ch8; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch8;
	input [31:0] coeff_4_9_ch8;
	input [31:0] coeff_4_8_ch8; 
	input [31:0] coeff_4_7_ch8; 
	input [31:0] coeff_4_6_ch8; 
	input [31:0] coeff_4_5_ch8; 
	input [31:0] coeff_4_4_ch8; 
	input [31:0] coeff_4_3_ch8; 
	input [31:0] coeff_4_2_ch8; 
	input [31:0] coeff_4_1_ch8; 
	input [31:0] coeff_4_0_ch8; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch8; 
	input [31:0] coeff_3_9_ch8; 
	input [31:0] coeff_3_8_ch8; 
	input [31:0] coeff_3_7_ch8; 
	input [31:0] coeff_3_6_ch8; 
	input [31:0] coeff_3_5_ch8; 
	input [31:0] coeff_3_4_ch8; 
	input [31:0] coeff_3_3_ch8; 
	input [31:0] coeff_3_2_ch8; 
	input [31:0] coeff_3_1_ch8; 
	input [31:0] coeff_3_0_ch8; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch8; 
	input [31:0] coeff_2_9_ch8; 
	input [31:0] coeff_2_8_ch8; 
	input [31:0] coeff_2_7_ch8; 
	input [31:0] coeff_2_6_ch8; 
	input [31:0] coeff_2_5_ch8; 
	input [31:0] coeff_2_4_ch8; 
	input [31:0] coeff_2_3_ch8; 
	input [31:0] coeff_2_2_ch8; 
	input [31:0] coeff_2_1_ch8; 
	input [31:0] coeff_2_0_ch8; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch8;
	input [31:0] coeff_1_9_ch8; 
	input [31:0] coeff_1_8_ch8; 
	input [31:0] coeff_1_7_ch8; 
	input [31:0] coeff_1_6_ch8; 
	input [31:0] coeff_1_5_ch8; 
	input [31:0] coeff_1_4_ch8; 
	input [31:0] coeff_1_3_ch8; 
	input [31:0] coeff_1_2_ch8; 
	input [31:0] coeff_1_1_ch8; 
	input [31:0] coeff_1_0_ch8;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch8;
	
	//Channel 9
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch9; 
	input [31:0] recip_stdev_3_ch9; 
	input [31:0] recip_stdev_2_ch9; 
	input [31:0] recip_stdev_1_ch9; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch9;
	input [31:0] neg_mean_3_ch9; 
	input [31:0] neg_mean_2_ch9; 
	input [31:0] neg_mean_1_ch9; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch9;
	input [31:0] coeff_4_9_ch9;
	input [31:0] coeff_4_8_ch9; 
	input [31:0] coeff_4_7_ch9; 
	input [31:0] coeff_4_6_ch9; 
	input [31:0] coeff_4_5_ch9; 
	input [31:0] coeff_4_4_ch9; 
	input [31:0] coeff_4_3_ch9; 
	input [31:0] coeff_4_2_ch9; 
	input [31:0] coeff_4_1_ch9; 
	input [31:0] coeff_4_0_ch9; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch9; 
	input [31:0] coeff_3_9_ch9; 
	input [31:0] coeff_3_8_ch9; 
	input [31:0] coeff_3_7_ch9; 
	input [31:0] coeff_3_6_ch9; 
	input [31:0] coeff_3_5_ch9; 
	input [31:0] coeff_3_4_ch9; 
	input [31:0] coeff_3_3_ch9; 
	input [31:0] coeff_3_2_ch9; 
	input [31:0] coeff_3_1_ch9; 
	input [31:0] coeff_3_0_ch9; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch9; 
	input [31:0] coeff_2_9_ch9; 
	input [31:0] coeff_2_8_ch9; 
	input [31:0] coeff_2_7_ch9; 
	input [31:0] coeff_2_6_ch9; 
	input [31:0] coeff_2_5_ch9; 
	input [31:0] coeff_2_4_ch9; 
	input [31:0] coeff_2_3_ch9; 
	input [31:0] coeff_2_2_ch9; 
	input [31:0] coeff_2_1_ch9; 
	input [31:0] coeff_2_0_ch9; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch9;
	input [31:0] coeff_1_9_ch9; 
	input [31:0] coeff_1_8_ch9; 
	input [31:0] coeff_1_7_ch9; 
	input [31:0] coeff_1_6_ch9; 
	input [31:0] coeff_1_5_ch9; 
	input [31:0] coeff_1_4_ch9; 
	input [31:0] coeff_1_3_ch9; 
	input [31:0] coeff_1_2_ch9; 
	input [31:0] coeff_1_1_ch9; 
	input [31:0] coeff_1_0_ch9;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch9;
	
	//Channel 10
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch10; 
	input [31:0] recip_stdev_3_ch10; 
	input [31:0] recip_stdev_2_ch10; 
	input [31:0] recip_stdev_1_ch10; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch10;
	input [31:0] neg_mean_3_ch10; 
	input [31:0] neg_mean_2_ch10; 
	input [31:0] neg_mean_1_ch10; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch10;
	input [31:0] coeff_4_9_ch10;
	input [31:0] coeff_4_8_ch10; 
	input [31:0] coeff_4_7_ch10; 
	input [31:0] coeff_4_6_ch10; 
	input [31:0] coeff_4_5_ch10; 
	input [31:0] coeff_4_4_ch10; 
	input [31:0] coeff_4_3_ch10; 
	input [31:0] coeff_4_2_ch10; 
	input [31:0] coeff_4_1_ch10; 
	input [31:0] coeff_4_0_ch10; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch10; 
	input [31:0] coeff_3_9_ch10; 
	input [31:0] coeff_3_8_ch10; 
	input [31:0] coeff_3_7_ch10; 
	input [31:0] coeff_3_6_ch10; 
	input [31:0] coeff_3_5_ch10; 
	input [31:0] coeff_3_4_ch10; 
	input [31:0] coeff_3_3_ch10; 
	input [31:0] coeff_3_2_ch10; 
	input [31:0] coeff_3_1_ch10; 
	input [31:0] coeff_3_0_ch10; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch10; 
	input [31:0] coeff_2_9_ch10; 
	input [31:0] coeff_2_8_ch10; 
	input [31:0] coeff_2_7_ch10; 
	input [31:0] coeff_2_6_ch10; 
	input [31:0] coeff_2_5_ch10; 
	input [31:0] coeff_2_4_ch10; 
	input [31:0] coeff_2_3_ch10; 
	input [31:0] coeff_2_2_ch10; 
	input [31:0] coeff_2_1_ch10; 
	input [31:0] coeff_2_0_ch10; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch10;
	input [31:0] coeff_1_9_ch10; 
	input [31:0] coeff_1_8_ch10; 
	input [31:0] coeff_1_7_ch10; 
	input [31:0] coeff_1_6_ch10; 
	input [31:0] coeff_1_5_ch10; 
	input [31:0] coeff_1_4_ch10; 
	input [31:0] coeff_1_3_ch10; 
	input [31:0] coeff_1_2_ch10; 
	input [31:0] coeff_1_1_ch10; 
	input [31:0] coeff_1_0_ch10;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch10;
	
	//Channel 11
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch11; 
	input [31:0] recip_stdev_3_ch11; 
	input [31:0] recip_stdev_2_ch11; 
	input [31:0] recip_stdev_1_ch11; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch11;
	input [31:0] neg_mean_3_ch11; 
	input [31:0] neg_mean_2_ch11; 
	input [31:0] neg_mean_1_ch11; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch11;
	input [31:0] coeff_4_9_ch11;
	input [31:0] coeff_4_8_ch11; 
	input [31:0] coeff_4_7_ch11; 
	input [31:0] coeff_4_6_ch11; 
	input [31:0] coeff_4_5_ch11; 
	input [31:0] coeff_4_4_ch11; 
	input [31:0] coeff_4_3_ch11; 
	input [31:0] coeff_4_2_ch11; 
	input [31:0] coeff_4_1_ch11; 
	input [31:0] coeff_4_0_ch11; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch11; 
	input [31:0] coeff_3_9_ch11; 
	input [31:0] coeff_3_8_ch11; 
	input [31:0] coeff_3_7_ch11; 
	input [31:0] coeff_3_6_ch11; 
	input [31:0] coeff_3_5_ch11; 
	input [31:0] coeff_3_4_ch11; 
	input [31:0] coeff_3_3_ch11; 
	input [31:0] coeff_3_2_ch11; 
	input [31:0] coeff_3_1_ch11; 
	input [31:0] coeff_3_0_ch11; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch11; 
	input [31:0] coeff_2_9_ch11; 
	input [31:0] coeff_2_8_ch11; 
	input [31:0] coeff_2_7_ch11; 
	input [31:0] coeff_2_6_ch11; 
	input [31:0] coeff_2_5_ch11; 
	input [31:0] coeff_2_4_ch11; 
	input [31:0] coeff_2_3_ch11; 
	input [31:0] coeff_2_2_ch11; 
	input [31:0] coeff_2_1_ch11; 
	input [31:0] coeff_2_0_ch11; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch11;
	input [31:0] coeff_1_9_ch11; 
	input [31:0] coeff_1_8_ch11; 
	input [31:0] coeff_1_7_ch11; 
	input [31:0] coeff_1_6_ch11; 
	input [31:0] coeff_1_5_ch11; 
	input [31:0] coeff_1_4_ch11; 
	input [31:0] coeff_1_3_ch11; 
	input [31:0] coeff_1_2_ch11; 
	input [31:0] coeff_1_1_ch11; 
	input [31:0] coeff_1_0_ch11;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch11;
	
	//Channel 12
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch12; 
	input [31:0] recip_stdev_3_ch12; 
	input [31:0] recip_stdev_2_ch12; 
	input [31:0] recip_stdev_1_ch12; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch12;
	input [31:0] neg_mean_3_ch12; 
	input [31:0] neg_mean_2_ch12; 
	input [31:0] neg_mean_1_ch12; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch12;
	input [31:0] coeff_4_9_ch12;
	input [31:0] coeff_4_8_ch12; 
	input [31:0] coeff_4_7_ch12; 
	input [31:0] coeff_4_6_ch12; 
	input [31:0] coeff_4_5_ch12; 
	input [31:0] coeff_4_4_ch12; 
	input [31:0] coeff_4_3_ch12; 
	input [31:0] coeff_4_2_ch12; 
	input [31:0] coeff_4_1_ch12; 
	input [31:0] coeff_4_0_ch12; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch12; 
	input [31:0] coeff_3_9_ch12; 
	input [31:0] coeff_3_8_ch12; 
	input [31:0] coeff_3_7_ch12; 
	input [31:0] coeff_3_6_ch12; 
	input [31:0] coeff_3_5_ch12; 
	input [31:0] coeff_3_4_ch12; 
	input [31:0] coeff_3_3_ch12; 
	input [31:0] coeff_3_2_ch12; 
	input [31:0] coeff_3_1_ch12; 
	input [31:0] coeff_3_0_ch12; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch12; 
	input [31:0] coeff_2_9_ch12; 
	input [31:0] coeff_2_8_ch12; 
	input [31:0] coeff_2_7_ch12; 
	input [31:0] coeff_2_6_ch12; 
	input [31:0] coeff_2_5_ch12; 
	input [31:0] coeff_2_4_ch12; 
	input [31:0] coeff_2_3_ch12; 
	input [31:0] coeff_2_2_ch12; 
	input [31:0] coeff_2_1_ch12; 
	input [31:0] coeff_2_0_ch12; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch12;
	input [31:0] coeff_1_9_ch12; 
	input [31:0] coeff_1_8_ch12; 
	input [31:0] coeff_1_7_ch12; 
	input [31:0] coeff_1_6_ch12; 
	input [31:0] coeff_1_5_ch12; 
	input [31:0] coeff_1_4_ch12; 
	input [31:0] coeff_1_3_ch12; 
	input [31:0] coeff_1_2_ch12; 
	input [31:0] coeff_1_1_ch12; 
	input [31:0] coeff_1_0_ch12;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch12;
	
	//Channel 13
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch13; 
	input [31:0] recip_stdev_3_ch13; 
	input [31:0] recip_stdev_2_ch13; 
	input [31:0] recip_stdev_1_ch13; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch13;
	input [31:0] neg_mean_3_ch13; 
	input [31:0] neg_mean_2_ch13; 
	input [31:0] neg_mean_1_ch13; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch13;
	input [31:0] coeff_4_9_ch13;
	input [31:0] coeff_4_8_ch13; 
	input [31:0] coeff_4_7_ch13; 
	input [31:0] coeff_4_6_ch13; 
	input [31:0] coeff_4_5_ch13; 
	input [31:0] coeff_4_4_ch13; 
	input [31:0] coeff_4_3_ch13; 
	input [31:0] coeff_4_2_ch13; 
	input [31:0] coeff_4_1_ch13; 
	input [31:0] coeff_4_0_ch13; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch13; 
	input [31:0] coeff_3_9_ch13; 
	input [31:0] coeff_3_8_ch13; 
	input [31:0] coeff_3_7_ch13; 
	input [31:0] coeff_3_6_ch13; 
	input [31:0] coeff_3_5_ch13; 
	input [31:0] coeff_3_4_ch13; 
	input [31:0] coeff_3_3_ch13; 
	input [31:0] coeff_3_2_ch13; 
	input [31:0] coeff_3_1_ch13; 
	input [31:0] coeff_3_0_ch13; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch13; 
	input [31:0] coeff_2_9_ch13; 
	input [31:0] coeff_2_8_ch13; 
	input [31:0] coeff_2_7_ch13; 
	input [31:0] coeff_2_6_ch13; 
	input [31:0] coeff_2_5_ch13; 
	input [31:0] coeff_2_4_ch13; 
	input [31:0] coeff_2_3_ch13; 
	input [31:0] coeff_2_2_ch13; 
	input [31:0] coeff_2_1_ch13; 
	input [31:0] coeff_2_0_ch13; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch13;
	input [31:0] coeff_1_9_ch13; 
	input [31:0] coeff_1_8_ch13; 
	input [31:0] coeff_1_7_ch13; 
	input [31:0] coeff_1_6_ch13; 
	input [31:0] coeff_1_5_ch13; 
	input [31:0] coeff_1_4_ch13; 
	input [31:0] coeff_1_3_ch13; 
	input [31:0] coeff_1_2_ch13; 
	input [31:0] coeff_1_1_ch13; 
	input [31:0] coeff_1_0_ch13;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch13;
	
	//Channel 14
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch14; 
	input [31:0] recip_stdev_3_ch14; 
	input [31:0] recip_stdev_2_ch14; 
	input [31:0] recip_stdev_1_ch14; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch14;
	input [31:0] neg_mean_3_ch14; 
	input [31:0] neg_mean_2_ch14; 
	input [31:0] neg_mean_1_ch14; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch14;
	input [31:0] coeff_4_9_ch14;
	input [31:0] coeff_4_8_ch14; 
	input [31:0] coeff_4_7_ch14; 
	input [31:0] coeff_4_6_ch14; 
	input [31:0] coeff_4_5_ch14; 
	input [31:0] coeff_4_4_ch14; 
	input [31:0] coeff_4_3_ch14; 
	input [31:0] coeff_4_2_ch14; 
	input [31:0] coeff_4_1_ch14; 
	input [31:0] coeff_4_0_ch14; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch14; 
	input [31:0] coeff_3_9_ch14; 
	input [31:0] coeff_3_8_ch14; 
	input [31:0] coeff_3_7_ch14; 
	input [31:0] coeff_3_6_ch14; 
	input [31:0] coeff_3_5_ch14; 
	input [31:0] coeff_3_4_ch14; 
	input [31:0] coeff_3_3_ch14; 
	input [31:0] coeff_3_2_ch14; 
	input [31:0] coeff_3_1_ch14; 
	input [31:0] coeff_3_0_ch14; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch14; 
	input [31:0] coeff_2_9_ch14; 
	input [31:0] coeff_2_8_ch14; 
	input [31:0] coeff_2_7_ch14; 
	input [31:0] coeff_2_6_ch14; 
	input [31:0] coeff_2_5_ch14; 
	input [31:0] coeff_2_4_ch14; 
	input [31:0] coeff_2_3_ch14; 
	input [31:0] coeff_2_2_ch14; 
	input [31:0] coeff_2_1_ch14; 
	input [31:0] coeff_2_0_ch14; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch14;
	input [31:0] coeff_1_9_ch14; 
	input [31:0] coeff_1_8_ch14; 
	input [31:0] coeff_1_7_ch14; 
	input [31:0] coeff_1_6_ch14; 
	input [31:0] coeff_1_5_ch14; 
	input [31:0] coeff_1_4_ch14; 
	input [31:0] coeff_1_3_ch14; 
	input [31:0] coeff_1_2_ch14; 
	input [31:0] coeff_1_1_ch14; 
	input [31:0] coeff_1_0_ch14;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch14;
	
	//Channel 15
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch15; 
	input [31:0] recip_stdev_3_ch15; 
	input [31:0] recip_stdev_2_ch15; 
	input [31:0] recip_stdev_1_ch15; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch15;
	input [31:0] neg_mean_3_ch15; 
	input [31:0] neg_mean_2_ch15; 
	input [31:0] neg_mean_1_ch15; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch15;
	input [31:0] coeff_4_9_ch15;
	input [31:0] coeff_4_8_ch15; 
	input [31:0] coeff_4_7_ch15; 
	input [31:0] coeff_4_6_ch15; 
	input [31:0] coeff_4_5_ch15; 
	input [31:0] coeff_4_4_ch15; 
	input [31:0] coeff_4_3_ch15; 
	input [31:0] coeff_4_2_ch15; 
	input [31:0] coeff_4_1_ch15; 
	input [31:0] coeff_4_0_ch15; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch15; 
	input [31:0] coeff_3_9_ch15; 
	input [31:0] coeff_3_8_ch15; 
	input [31:0] coeff_3_7_ch15; 
	input [31:0] coeff_3_6_ch15; 
	input [31:0] coeff_3_5_ch15; 
	input [31:0] coeff_3_4_ch15; 
	input [31:0] coeff_3_3_ch15; 
	input [31:0] coeff_3_2_ch15; 
	input [31:0] coeff_3_1_ch15; 
	input [31:0] coeff_3_0_ch15; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch15; 
	input [31:0] coeff_2_9_ch15; 
	input [31:0] coeff_2_8_ch15; 
	input [31:0] coeff_2_7_ch15; 
	input [31:0] coeff_2_6_ch15; 
	input [31:0] coeff_2_5_ch15; 
	input [31:0] coeff_2_4_ch15; 
	input [31:0] coeff_2_3_ch15; 
	input [31:0] coeff_2_2_ch15; 
	input [31:0] coeff_2_1_ch15; 
	input [31:0] coeff_2_0_ch15; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch15;
	input [31:0] coeff_1_9_ch15; 
	input [31:0] coeff_1_8_ch15; 
	input [31:0] coeff_1_7_ch15; 
	input [31:0] coeff_1_6_ch15; 
	input [31:0] coeff_1_5_ch15; 
	input [31:0] coeff_1_4_ch15; 
	input [31:0] coeff_1_3_ch15; 
	input [31:0] coeff_1_2_ch15; 
	input [31:0] coeff_1_1_ch15; 
	input [31:0] coeff_1_0_ch15;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch15;
	
	//Channel 16
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch16; 
	input [31:0] recip_stdev_3_ch16; 
	input [31:0] recip_stdev_2_ch16; 
	input [31:0] recip_stdev_1_ch16; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch16;
	input [31:0] neg_mean_3_ch16; 
	input [31:0] neg_mean_2_ch16; 
	input [31:0] neg_mean_1_ch16; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch16;
	input [31:0] coeff_4_9_ch16;
	input [31:0] coeff_4_8_ch16; 
	input [31:0] coeff_4_7_ch16; 
	input [31:0] coeff_4_6_ch16; 
	input [31:0] coeff_4_5_ch16; 
	input [31:0] coeff_4_4_ch16; 
	input [31:0] coeff_4_3_ch16; 
	input [31:0] coeff_4_2_ch16; 
	input [31:0] coeff_4_1_ch16; 
	input [31:0] coeff_4_0_ch16; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch16; 
	input [31:0] coeff_3_9_ch16; 
	input [31:0] coeff_3_8_ch16; 
	input [31:0] coeff_3_7_ch16; 
	input [31:0] coeff_3_6_ch16; 
	input [31:0] coeff_3_5_ch16; 
	input [31:0] coeff_3_4_ch16; 
	input [31:0] coeff_3_3_ch16; 
	input [31:0] coeff_3_2_ch16; 
	input [31:0] coeff_3_1_ch16; 
	input [31:0] coeff_3_0_ch16; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch16; 
	input [31:0] coeff_2_9_ch16; 
	input [31:0] coeff_2_8_ch16; 
	input [31:0] coeff_2_7_ch16; 
	input [31:0] coeff_2_6_ch16; 
	input [31:0] coeff_2_5_ch16; 
	input [31:0] coeff_2_4_ch16; 
	input [31:0] coeff_2_3_ch16; 
	input [31:0] coeff_2_2_ch16; 
	input [31:0] coeff_2_1_ch16; 
	input [31:0] coeff_2_0_ch16; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch16;
	input [31:0] coeff_1_9_ch16; 
	input [31:0] coeff_1_8_ch16; 
	input [31:0] coeff_1_7_ch16; 
	input [31:0] coeff_1_6_ch16; 
	input [31:0] coeff_1_5_ch16; 
	input [31:0] coeff_1_4_ch16; 
	input [31:0] coeff_1_3_ch16; 
	input [31:0] coeff_1_2_ch16; 
	input [31:0] coeff_1_1_ch16; 
	input [31:0] coeff_1_0_ch16;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch16;
	
	//Channel 17
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch17; 
	input [31:0] recip_stdev_3_ch17; 
	input [31:0] recip_stdev_2_ch17; 
	input [31:0] recip_stdev_1_ch17; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch17;
	input [31:0] neg_mean_3_ch17; 
	input [31:0] neg_mean_2_ch17; 
	input [31:0] neg_mean_1_ch17; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch17;
	input [31:0] coeff_4_9_ch17;
	input [31:0] coeff_4_8_ch17; 
	input [31:0] coeff_4_7_ch17; 
	input [31:0] coeff_4_6_ch17; 
	input [31:0] coeff_4_5_ch17; 
	input [31:0] coeff_4_4_ch17; 
	input [31:0] coeff_4_3_ch17; 
	input [31:0] coeff_4_2_ch17; 
	input [31:0] coeff_4_1_ch17; 
	input [31:0] coeff_4_0_ch17; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch17; 
	input [31:0] coeff_3_9_ch17; 
	input [31:0] coeff_3_8_ch17; 
	input [31:0] coeff_3_7_ch17; 
	input [31:0] coeff_3_6_ch17; 
	input [31:0] coeff_3_5_ch17; 
	input [31:0] coeff_3_4_ch17; 
	input [31:0] coeff_3_3_ch17; 
	input [31:0] coeff_3_2_ch17; 
	input [31:0] coeff_3_1_ch17; 
	input [31:0] coeff_3_0_ch17; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch17; 
	input [31:0] coeff_2_9_ch17; 
	input [31:0] coeff_2_8_ch17; 
	input [31:0] coeff_2_7_ch17; 
	input [31:0] coeff_2_6_ch17; 
	input [31:0] coeff_2_5_ch17; 
	input [31:0] coeff_2_4_ch17; 
	input [31:0] coeff_2_3_ch17; 
	input [31:0] coeff_2_2_ch17; 
	input [31:0] coeff_2_1_ch17; 
	input [31:0] coeff_2_0_ch17; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch17;
	input [31:0] coeff_1_9_ch17; 
	input [31:0] coeff_1_8_ch17; 
	input [31:0] coeff_1_7_ch17; 
	input [31:0] coeff_1_6_ch17; 
	input [31:0] coeff_1_5_ch17; 
	input [31:0] coeff_1_4_ch17; 
	input [31:0] coeff_1_3_ch17; 
	input [31:0] coeff_1_2_ch17; 
	input [31:0] coeff_1_1_ch17; 
	input [31:0] coeff_1_0_ch17;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch17;
	
	//Channel 18
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch18; 
	input [31:0] recip_stdev_3_ch18; 
	input [31:0] recip_stdev_2_ch18; 
	input [31:0] recip_stdev_1_ch18; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch18;
	input [31:0] neg_mean_3_ch18; 
	input [31:0] neg_mean_2_ch18; 
	input [31:0] neg_mean_1_ch18; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch18;
	input [31:0] coeff_4_9_ch18;
	input [31:0] coeff_4_8_ch18; 
	input [31:0] coeff_4_7_ch18; 
	input [31:0] coeff_4_6_ch18; 
	input [31:0] coeff_4_5_ch18; 
	input [31:0] coeff_4_4_ch18; 
	input [31:0] coeff_4_3_ch18; 
	input [31:0] coeff_4_2_ch18; 
	input [31:0] coeff_4_1_ch18; 
	input [31:0] coeff_4_0_ch18; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch18; 
	input [31:0] coeff_3_9_ch18; 
	input [31:0] coeff_3_8_ch18; 
	input [31:0] coeff_3_7_ch18; 
	input [31:0] coeff_3_6_ch18; 
	input [31:0] coeff_3_5_ch18; 
	input [31:0] coeff_3_4_ch18; 
	input [31:0] coeff_3_3_ch18; 
	input [31:0] coeff_3_2_ch18; 
	input [31:0] coeff_3_1_ch18; 
	input [31:0] coeff_3_0_ch18; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch18; 
	input [31:0] coeff_2_9_ch18; 
	input [31:0] coeff_2_8_ch18; 
	input [31:0] coeff_2_7_ch18; 
	input [31:0] coeff_2_6_ch18; 
	input [31:0] coeff_2_5_ch18; 
	input [31:0] coeff_2_4_ch18; 
	input [31:0] coeff_2_3_ch18; 
	input [31:0] coeff_2_2_ch18; 
	input [31:0] coeff_2_1_ch18; 
	input [31:0] coeff_2_0_ch18; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch18;
	input [31:0] coeff_1_9_ch18; 
	input [31:0] coeff_1_8_ch18; 
	input [31:0] coeff_1_7_ch18; 
	input [31:0] coeff_1_6_ch18; 
	input [31:0] coeff_1_5_ch18; 
	input [31:0] coeff_1_4_ch18; 
	input [31:0] coeff_1_3_ch18; 
	input [31:0] coeff_1_2_ch18; 
	input [31:0] coeff_1_1_ch18; 
	input [31:0] coeff_1_0_ch18;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch18;
	
	//Channel 19
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch19; 
	input [31:0] recip_stdev_3_ch19; 
	input [31:0] recip_stdev_2_ch19; 
	input [31:0] recip_stdev_1_ch19; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch19;
	input [31:0] neg_mean_3_ch19; 
	input [31:0] neg_mean_2_ch19; 
	input [31:0] neg_mean_1_ch19; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch19;
	input [31:0] coeff_4_9_ch19;
	input [31:0] coeff_4_8_ch19; 
	input [31:0] coeff_4_7_ch19; 
	input [31:0] coeff_4_6_ch19; 
	input [31:0] coeff_4_5_ch19; 
	input [31:0] coeff_4_4_ch19; 
	input [31:0] coeff_4_3_ch19; 
	input [31:0] coeff_4_2_ch19; 
	input [31:0] coeff_4_1_ch19; 
	input [31:0] coeff_4_0_ch19; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch19; 
	input [31:0] coeff_3_9_ch19; 
	input [31:0] coeff_3_8_ch19; 
	input [31:0] coeff_3_7_ch19; 
	input [31:0] coeff_3_6_ch19; 
	input [31:0] coeff_3_5_ch19; 
	input [31:0] coeff_3_4_ch19; 
	input [31:0] coeff_3_3_ch19; 
	input [31:0] coeff_3_2_ch19; 
	input [31:0] coeff_3_1_ch19; 
	input [31:0] coeff_3_0_ch19; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch19; 
	input [31:0] coeff_2_9_ch19; 
	input [31:0] coeff_2_8_ch19; 
	input [31:0] coeff_2_7_ch19; 
	input [31:0] coeff_2_6_ch19; 
	input [31:0] coeff_2_5_ch19; 
	input [31:0] coeff_2_4_ch19; 
	input [31:0] coeff_2_3_ch19; 
	input [31:0] coeff_2_2_ch19; 
	input [31:0] coeff_2_1_ch19; 
	input [31:0] coeff_2_0_ch19; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch19;
	input [31:0] coeff_1_9_ch19; 
	input [31:0] coeff_1_8_ch19; 
	input [31:0] coeff_1_7_ch19; 
	input [31:0] coeff_1_6_ch19; 
	input [31:0] coeff_1_5_ch19; 
	input [31:0] coeff_1_4_ch19; 
	input [31:0] coeff_1_3_ch19; 
	input [31:0] coeff_1_2_ch19; 
	input [31:0] coeff_1_1_ch19; 
	input [31:0] coeff_1_0_ch19;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch19;
	
	//Channel 20
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch20; 
	input [31:0] recip_stdev_3_ch20; 
	input [31:0] recip_stdev_2_ch20; 
	input [31:0] recip_stdev_1_ch20; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch20;
	input [31:0] neg_mean_3_ch20; 
	input [31:0] neg_mean_2_ch20; 
	input [31:0] neg_mean_1_ch20; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch20;
	input [31:0] coeff_4_9_ch20;
	input [31:0] coeff_4_8_ch20; 
	input [31:0] coeff_4_7_ch20; 
	input [31:0] coeff_4_6_ch20; 
	input [31:0] coeff_4_5_ch20; 
	input [31:0] coeff_4_4_ch20; 
	input [31:0] coeff_4_3_ch20; 
	input [31:0] coeff_4_2_ch20; 
	input [31:0] coeff_4_1_ch20; 
	input [31:0] coeff_4_0_ch20; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch20; 
	input [31:0] coeff_3_9_ch20; 
	input [31:0] coeff_3_8_ch20; 
	input [31:0] coeff_3_7_ch20; 
	input [31:0] coeff_3_6_ch20; 
	input [31:0] coeff_3_5_ch20; 
	input [31:0] coeff_3_4_ch20; 
	input [31:0] coeff_3_3_ch20; 
	input [31:0] coeff_3_2_ch20; 
	input [31:0] coeff_3_1_ch20; 
	input [31:0] coeff_3_0_ch20; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch20; 
	input [31:0] coeff_2_9_ch20; 
	input [31:0] coeff_2_8_ch20; 
	input [31:0] coeff_2_7_ch20; 
	input [31:0] coeff_2_6_ch20; 
	input [31:0] coeff_2_5_ch20; 
	input [31:0] coeff_2_4_ch20; 
	input [31:0] coeff_2_3_ch20; 
	input [31:0] coeff_2_2_ch20; 
	input [31:0] coeff_2_1_ch20; 
	input [31:0] coeff_2_0_ch20; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch20;
	input [31:0] coeff_1_9_ch20; 
	input [31:0] coeff_1_8_ch20; 
	input [31:0] coeff_1_7_ch20; 
	input [31:0] coeff_1_6_ch20; 
	input [31:0] coeff_1_5_ch20; 
	input [31:0] coeff_1_4_ch20; 
	input [31:0] coeff_1_3_ch20; 
	input [31:0] coeff_1_2_ch20; 
	input [31:0] coeff_1_1_ch20; 
	input [31:0] coeff_1_0_ch20;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch20;
	
	//Channel 21
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch21; 
	input [31:0] recip_stdev_3_ch21; 
	input [31:0] recip_stdev_2_ch21; 
	input [31:0] recip_stdev_1_ch21; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch21;
	input [31:0] neg_mean_3_ch21; 
	input [31:0] neg_mean_2_ch21; 
	input [31:0] neg_mean_1_ch21; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch21;
	input [31:0] coeff_4_9_ch21;
	input [31:0] coeff_4_8_ch21; 
	input [31:0] coeff_4_7_ch21; 
	input [31:0] coeff_4_6_ch21; 
	input [31:0] coeff_4_5_ch21; 
	input [31:0] coeff_4_4_ch21; 
	input [31:0] coeff_4_3_ch21; 
	input [31:0] coeff_4_2_ch21; 
	input [31:0] coeff_4_1_ch21; 
	input [31:0] coeff_4_0_ch21; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch21; 
	input [31:0] coeff_3_9_ch21; 
	input [31:0] coeff_3_8_ch21; 
	input [31:0] coeff_3_7_ch21; 
	input [31:0] coeff_3_6_ch21; 
	input [31:0] coeff_3_5_ch21; 
	input [31:0] coeff_3_4_ch21; 
	input [31:0] coeff_3_3_ch21; 
	input [31:0] coeff_3_2_ch21; 
	input [31:0] coeff_3_1_ch21; 
	input [31:0] coeff_3_0_ch21; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch21; 
	input [31:0] coeff_2_9_ch21; 
	input [31:0] coeff_2_8_ch21; 
	input [31:0] coeff_2_7_ch21; 
	input [31:0] coeff_2_6_ch21; 
	input [31:0] coeff_2_5_ch21; 
	input [31:0] coeff_2_4_ch21; 
	input [31:0] coeff_2_3_ch21; 
	input [31:0] coeff_2_2_ch21; 
	input [31:0] coeff_2_1_ch21; 
	input [31:0] coeff_2_0_ch21; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch21;
	input [31:0] coeff_1_9_ch21; 
	input [31:0] coeff_1_8_ch21; 
	input [31:0] coeff_1_7_ch21; 
	input [31:0] coeff_1_6_ch21; 
	input [31:0] coeff_1_5_ch21; 
	input [31:0] coeff_1_4_ch21; 
	input [31:0] coeff_1_3_ch21; 
	input [31:0] coeff_1_2_ch21; 
	input [31:0] coeff_1_1_ch21; 
	input [31:0] coeff_1_0_ch21;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch21;
	
	//Channel 22
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch22; 
	input [31:0] recip_stdev_3_ch22; 
	input [31:0] recip_stdev_2_ch22; 
	input [31:0] recip_stdev_1_ch22; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch22;
	input [31:0] neg_mean_3_ch22; 
	input [31:0] neg_mean_2_ch22; 
	input [31:0] neg_mean_1_ch22; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch22;
	input [31:0] coeff_4_9_ch22;
	input [31:0] coeff_4_8_ch22; 
	input [31:0] coeff_4_7_ch22; 
	input [31:0] coeff_4_6_ch22; 
	input [31:0] coeff_4_5_ch22; 
	input [31:0] coeff_4_4_ch22; 
	input [31:0] coeff_4_3_ch22; 
	input [31:0] coeff_4_2_ch22; 
	input [31:0] coeff_4_1_ch22; 
	input [31:0] coeff_4_0_ch22; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch22; 
	input [31:0] coeff_3_9_ch22; 
	input [31:0] coeff_3_8_ch22; 
	input [31:0] coeff_3_7_ch22; 
	input [31:0] coeff_3_6_ch22; 
	input [31:0] coeff_3_5_ch22; 
	input [31:0] coeff_3_4_ch22; 
	input [31:0] coeff_3_3_ch22; 
	input [31:0] coeff_3_2_ch22; 
	input [31:0] coeff_3_1_ch22; 
	input [31:0] coeff_3_0_ch22; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch22; 
	input [31:0] coeff_2_9_ch22; 
	input [31:0] coeff_2_8_ch22; 
	input [31:0] coeff_2_7_ch22; 
	input [31:0] coeff_2_6_ch22; 
	input [31:0] coeff_2_5_ch22; 
	input [31:0] coeff_2_4_ch22; 
	input [31:0] coeff_2_3_ch22; 
	input [31:0] coeff_2_2_ch22; 
	input [31:0] coeff_2_1_ch22; 
	input [31:0] coeff_2_0_ch22; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch22;
	input [31:0] coeff_1_9_ch22; 
	input [31:0] coeff_1_8_ch22; 
	input [31:0] coeff_1_7_ch22; 
	input [31:0] coeff_1_6_ch22; 
	input [31:0] coeff_1_5_ch22; 
	input [31:0] coeff_1_4_ch22; 
	input [31:0] coeff_1_3_ch22; 
	input [31:0] coeff_1_2_ch22; 
	input [31:0] coeff_1_1_ch22; 
	input [31:0] coeff_1_0_ch22;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch22;
	
	//Channel 23
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch23; 
	input [31:0] recip_stdev_3_ch23; 
	input [31:0] recip_stdev_2_ch23; 
	input [31:0] recip_stdev_1_ch23; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch23;
	input [31:0] neg_mean_3_ch23; 
	input [31:0] neg_mean_2_ch23; 
	input [31:0] neg_mean_1_ch23; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch23;
	input [31:0] coeff_4_9_ch23;
	input [31:0] coeff_4_8_ch23; 
	input [31:0] coeff_4_7_ch23; 
	input [31:0] coeff_4_6_ch23; 
	input [31:0] coeff_4_5_ch23; 
	input [31:0] coeff_4_4_ch23; 
	input [31:0] coeff_4_3_ch23; 
	input [31:0] coeff_4_2_ch23; 
	input [31:0] coeff_4_1_ch23; 
	input [31:0] coeff_4_0_ch23; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch23; 
	input [31:0] coeff_3_9_ch23; 
	input [31:0] coeff_3_8_ch23; 
	input [31:0] coeff_3_7_ch23; 
	input [31:0] coeff_3_6_ch23; 
	input [31:0] coeff_3_5_ch23; 
	input [31:0] coeff_3_4_ch23; 
	input [31:0] coeff_3_3_ch23; 
	input [31:0] coeff_3_2_ch23; 
	input [31:0] coeff_3_1_ch23; 
	input [31:0] coeff_3_0_ch23; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch23; 
	input [31:0] coeff_2_9_ch23; 
	input [31:0] coeff_2_8_ch23; 
	input [31:0] coeff_2_7_ch23; 
	input [31:0] coeff_2_6_ch23; 
	input [31:0] coeff_2_5_ch23; 
	input [31:0] coeff_2_4_ch23; 
	input [31:0] coeff_2_3_ch23; 
	input [31:0] coeff_2_2_ch23; 
	input [31:0] coeff_2_1_ch23; 
	input [31:0] coeff_2_0_ch23; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch23;
	input [31:0] coeff_1_9_ch23; 
	input [31:0] coeff_1_8_ch23; 
	input [31:0] coeff_1_7_ch23; 
	input [31:0] coeff_1_6_ch23; 
	input [31:0] coeff_1_5_ch23; 
	input [31:0] coeff_1_4_ch23; 
	input [31:0] coeff_1_3_ch23; 
	input [31:0] coeff_1_2_ch23; 
	input [31:0] coeff_1_1_ch23; 
	input [31:0] coeff_1_0_ch23;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch23;
	
	//Channel 24
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch24; 
	input [31:0] recip_stdev_3_ch24; 
	input [31:0] recip_stdev_2_ch24; 
	input [31:0] recip_stdev_1_ch24; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch24;
	input [31:0] neg_mean_3_ch24; 
	input [31:0] neg_mean_2_ch24; 
	input [31:0] neg_mean_1_ch24; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch24;
	input [31:0] coeff_4_9_ch24;
	input [31:0] coeff_4_8_ch24; 
	input [31:0] coeff_4_7_ch24; 
	input [31:0] coeff_4_6_ch24; 
	input [31:0] coeff_4_5_ch24; 
	input [31:0] coeff_4_4_ch24; 
	input [31:0] coeff_4_3_ch24; 
	input [31:0] coeff_4_2_ch24; 
	input [31:0] coeff_4_1_ch24; 
	input [31:0] coeff_4_0_ch24; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch24; 
	input [31:0] coeff_3_9_ch24; 
	input [31:0] coeff_3_8_ch24; 
	input [31:0] coeff_3_7_ch24; 
	input [31:0] coeff_3_6_ch24; 
	input [31:0] coeff_3_5_ch24; 
	input [31:0] coeff_3_4_ch24; 
	input [31:0] coeff_3_3_ch24; 
	input [31:0] coeff_3_2_ch24; 
	input [31:0] coeff_3_1_ch24; 
	input [31:0] coeff_3_0_ch24; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch24; 
	input [31:0] coeff_2_9_ch24; 
	input [31:0] coeff_2_8_ch24; 
	input [31:0] coeff_2_7_ch24; 
	input [31:0] coeff_2_6_ch24; 
	input [31:0] coeff_2_5_ch24; 
	input [31:0] coeff_2_4_ch24; 
	input [31:0] coeff_2_3_ch24; 
	input [31:0] coeff_2_2_ch24; 
	input [31:0] coeff_2_1_ch24; 
	input [31:0] coeff_2_0_ch24; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch24;
	input [31:0] coeff_1_9_ch24; 
	input [31:0] coeff_1_8_ch24; 
	input [31:0] coeff_1_7_ch24; 
	input [31:0] coeff_1_6_ch24; 
	input [31:0] coeff_1_5_ch24; 
	input [31:0] coeff_1_4_ch24; 
	input [31:0] coeff_1_3_ch24; 
	input [31:0] coeff_1_2_ch24; 
	input [31:0] coeff_1_1_ch24; 
	input [31:0] coeff_1_0_ch24;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch24;
	
	//Channel 25
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch25; 
	input [31:0] recip_stdev_3_ch25; 
	input [31:0] recip_stdev_2_ch25; 
	input [31:0] recip_stdev_1_ch25; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch25;
	input [31:0] neg_mean_3_ch25; 
	input [31:0] neg_mean_2_ch25; 
	input [31:0] neg_mean_1_ch25; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch25;
	input [31:0] coeff_4_9_ch25;
	input [31:0] coeff_4_8_ch25; 
	input [31:0] coeff_4_7_ch25; 
	input [31:0] coeff_4_6_ch25; 
	input [31:0] coeff_4_5_ch25; 
	input [31:0] coeff_4_4_ch25; 
	input [31:0] coeff_4_3_ch25; 
	input [31:0] coeff_4_2_ch25; 
	input [31:0] coeff_4_1_ch25; 
	input [31:0] coeff_4_0_ch25; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch25; 
	input [31:0] coeff_3_9_ch25; 
	input [31:0] coeff_3_8_ch25; 
	input [31:0] coeff_3_7_ch25; 
	input [31:0] coeff_3_6_ch25; 
	input [31:0] coeff_3_5_ch25; 
	input [31:0] coeff_3_4_ch25; 
	input [31:0] coeff_3_3_ch25; 
	input [31:0] coeff_3_2_ch25; 
	input [31:0] coeff_3_1_ch25; 
	input [31:0] coeff_3_0_ch25; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch25; 
	input [31:0] coeff_2_9_ch25; 
	input [31:0] coeff_2_8_ch25; 
	input [31:0] coeff_2_7_ch25; 
	input [31:0] coeff_2_6_ch25; 
	input [31:0] coeff_2_5_ch25; 
	input [31:0] coeff_2_4_ch25; 
	input [31:0] coeff_2_3_ch25; 
	input [31:0] coeff_2_2_ch25; 
	input [31:0] coeff_2_1_ch25; 
	input [31:0] coeff_2_0_ch25; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch25;
	input [31:0] coeff_1_9_ch25; 
	input [31:0] coeff_1_8_ch25; 
	input [31:0] coeff_1_7_ch25; 
	input [31:0] coeff_1_6_ch25; 
	input [31:0] coeff_1_5_ch25; 
	input [31:0] coeff_1_4_ch25; 
	input [31:0] coeff_1_3_ch25; 
	input [31:0] coeff_1_2_ch25; 
	input [31:0] coeff_1_1_ch25; 
	input [31:0] coeff_1_0_ch25;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch25;
	
	//Channel 26
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch26; 
	input [31:0] recip_stdev_3_ch26; 
	input [31:0] recip_stdev_2_ch26; 
	input [31:0] recip_stdev_1_ch26; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch26;
	input [31:0] neg_mean_3_ch26; 
	input [31:0] neg_mean_2_ch26; 
	input [31:0] neg_mean_1_ch26; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch26;
	input [31:0] coeff_4_9_ch26;
	input [31:0] coeff_4_8_ch26; 
	input [31:0] coeff_4_7_ch26; 
	input [31:0] coeff_4_6_ch26; 
	input [31:0] coeff_4_5_ch26; 
	input [31:0] coeff_4_4_ch26; 
	input [31:0] coeff_4_3_ch26; 
	input [31:0] coeff_4_2_ch26; 
	input [31:0] coeff_4_1_ch26; 
	input [31:0] coeff_4_0_ch26; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch26; 
	input [31:0] coeff_3_9_ch26; 
	input [31:0] coeff_3_8_ch26; 
	input [31:0] coeff_3_7_ch26; 
	input [31:0] coeff_3_6_ch26; 
	input [31:0] coeff_3_5_ch26; 
	input [31:0] coeff_3_4_ch26; 
	input [31:0] coeff_3_3_ch26; 
	input [31:0] coeff_3_2_ch26; 
	input [31:0] coeff_3_1_ch26; 
	input [31:0] coeff_3_0_ch26; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch26; 
	input [31:0] coeff_2_9_ch26; 
	input [31:0] coeff_2_8_ch26; 
	input [31:0] coeff_2_7_ch26; 
	input [31:0] coeff_2_6_ch26; 
	input [31:0] coeff_2_5_ch26; 
	input [31:0] coeff_2_4_ch26; 
	input [31:0] coeff_2_3_ch26; 
	input [31:0] coeff_2_2_ch26; 
	input [31:0] coeff_2_1_ch26; 
	input [31:0] coeff_2_0_ch26; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch26;
	input [31:0] coeff_1_9_ch26; 
	input [31:0] coeff_1_8_ch26; 
	input [31:0] coeff_1_7_ch26; 
	input [31:0] coeff_1_6_ch26; 
	input [31:0] coeff_1_5_ch26; 
	input [31:0] coeff_1_4_ch26; 
	input [31:0] coeff_1_3_ch26; 
	input [31:0] coeff_1_2_ch26; 
	input [31:0] coeff_1_1_ch26; 
	input [31:0] coeff_1_0_ch26;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch26;
	
	//Channel 27
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch27; 
	input [31:0] recip_stdev_3_ch27; 
	input [31:0] recip_stdev_2_ch27; 
	input [31:0] recip_stdev_1_ch27; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch27;
	input [31:0] neg_mean_3_ch27; 
	input [31:0] neg_mean_2_ch27; 
	input [31:0] neg_mean_1_ch27; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch27;
	input [31:0] coeff_4_9_ch27;
	input [31:0] coeff_4_8_ch27; 
	input [31:0] coeff_4_7_ch27; 
	input [31:0] coeff_4_6_ch27; 
	input [31:0] coeff_4_5_ch27; 
	input [31:0] coeff_4_4_ch27; 
	input [31:0] coeff_4_3_ch27; 
	input [31:0] coeff_4_2_ch27; 
	input [31:0] coeff_4_1_ch27; 
	input [31:0] coeff_4_0_ch27; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch27; 
	input [31:0] coeff_3_9_ch27; 
	input [31:0] coeff_3_8_ch27; 
	input [31:0] coeff_3_7_ch27; 
	input [31:0] coeff_3_6_ch27; 
	input [31:0] coeff_3_5_ch27; 
	input [31:0] coeff_3_4_ch27; 
	input [31:0] coeff_3_3_ch27; 
	input [31:0] coeff_3_2_ch27; 
	input [31:0] coeff_3_1_ch27; 
	input [31:0] coeff_3_0_ch27; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch27; 
	input [31:0] coeff_2_9_ch27; 
	input [31:0] coeff_2_8_ch27; 
	input [31:0] coeff_2_7_ch27; 
	input [31:0] coeff_2_6_ch27; 
	input [31:0] coeff_2_5_ch27; 
	input [31:0] coeff_2_4_ch27; 
	input [31:0] coeff_2_3_ch27; 
	input [31:0] coeff_2_2_ch27; 
	input [31:0] coeff_2_1_ch27; 
	input [31:0] coeff_2_0_ch27; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch27;
	input [31:0] coeff_1_9_ch27; 
	input [31:0] coeff_1_8_ch27; 
	input [31:0] coeff_1_7_ch27; 
	input [31:0] coeff_1_6_ch27; 
	input [31:0] coeff_1_5_ch27; 
	input [31:0] coeff_1_4_ch27; 
	input [31:0] coeff_1_3_ch27; 
	input [31:0] coeff_1_2_ch27; 
	input [31:0] coeff_1_1_ch27; 
	input [31:0] coeff_1_0_ch27;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch27;
	
	//Channel 28
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch28; 
	input [31:0] recip_stdev_3_ch28; 
	input [31:0] recip_stdev_2_ch28; 
	input [31:0] recip_stdev_1_ch28; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch28;
	input [31:0] neg_mean_3_ch28; 
	input [31:0] neg_mean_2_ch28; 
	input [31:0] neg_mean_1_ch28; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch28;
	input [31:0] coeff_4_9_ch28;
	input [31:0] coeff_4_8_ch28; 
	input [31:0] coeff_4_7_ch28; 
	input [31:0] coeff_4_6_ch28; 
	input [31:0] coeff_4_5_ch28; 
	input [31:0] coeff_4_4_ch28; 
	input [31:0] coeff_4_3_ch28; 
	input [31:0] coeff_4_2_ch28; 
	input [31:0] coeff_4_1_ch28; 
	input [31:0] coeff_4_0_ch28; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch28; 
	input [31:0] coeff_3_9_ch28; 
	input [31:0] coeff_3_8_ch28; 
	input [31:0] coeff_3_7_ch28; 
	input [31:0] coeff_3_6_ch28; 
	input [31:0] coeff_3_5_ch28; 
	input [31:0] coeff_3_4_ch28; 
	input [31:0] coeff_3_3_ch28; 
	input [31:0] coeff_3_2_ch28; 
	input [31:0] coeff_3_1_ch28; 
	input [31:0] coeff_3_0_ch28; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch28; 
	input [31:0] coeff_2_9_ch28; 
	input [31:0] coeff_2_8_ch28; 
	input [31:0] coeff_2_7_ch28; 
	input [31:0] coeff_2_6_ch28; 
	input [31:0] coeff_2_5_ch28; 
	input [31:0] coeff_2_4_ch28; 
	input [31:0] coeff_2_3_ch28; 
	input [31:0] coeff_2_2_ch28; 
	input [31:0] coeff_2_1_ch28; 
	input [31:0] coeff_2_0_ch28; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch28;
	input [31:0] coeff_1_9_ch28; 
	input [31:0] coeff_1_8_ch28; 
	input [31:0] coeff_1_7_ch28; 
	input [31:0] coeff_1_6_ch28; 
	input [31:0] coeff_1_5_ch28; 
	input [31:0] coeff_1_4_ch28; 
	input [31:0] coeff_1_3_ch28; 
	input [31:0] coeff_1_2_ch28; 
	input [31:0] coeff_1_1_ch28; 
	input [31:0] coeff_1_0_ch28;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch28;
	
	//Channel 29
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch29; 
	input [31:0] recip_stdev_3_ch29; 
	input [31:0] recip_stdev_2_ch29; 
	input [31:0] recip_stdev_1_ch29; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch29;
	input [31:0] neg_mean_3_ch29; 
	input [31:0] neg_mean_2_ch29; 
	input [31:0] neg_mean_1_ch29; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch29;
	input [31:0] coeff_4_9_ch29;
	input [31:0] coeff_4_8_ch29; 
	input [31:0] coeff_4_7_ch29; 
	input [31:0] coeff_4_6_ch29; 
	input [31:0] coeff_4_5_ch29; 
	input [31:0] coeff_4_4_ch29; 
	input [31:0] coeff_4_3_ch29; 
	input [31:0] coeff_4_2_ch29; 
	input [31:0] coeff_4_1_ch29; 
	input [31:0] coeff_4_0_ch29; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch29; 
	input [31:0] coeff_3_9_ch29; 
	input [31:0] coeff_3_8_ch29; 
	input [31:0] coeff_3_7_ch29; 
	input [31:0] coeff_3_6_ch29; 
	input [31:0] coeff_3_5_ch29; 
	input [31:0] coeff_3_4_ch29; 
	input [31:0] coeff_3_3_ch29; 
	input [31:0] coeff_3_2_ch29; 
	input [31:0] coeff_3_1_ch29; 
	input [31:0] coeff_3_0_ch29; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch29; 
	input [31:0] coeff_2_9_ch29; 
	input [31:0] coeff_2_8_ch29; 
	input [31:0] coeff_2_7_ch29; 
	input [31:0] coeff_2_6_ch29; 
	input [31:0] coeff_2_5_ch29; 
	input [31:0] coeff_2_4_ch29; 
	input [31:0] coeff_2_3_ch29; 
	input [31:0] coeff_2_2_ch29; 
	input [31:0] coeff_2_1_ch29; 
	input [31:0] coeff_2_0_ch29; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch29;
	input [31:0] coeff_1_9_ch29; 
	input [31:0] coeff_1_8_ch29; 
	input [31:0] coeff_1_7_ch29; 
	input [31:0] coeff_1_6_ch29; 
	input [31:0] coeff_1_5_ch29; 
	input [31:0] coeff_1_4_ch29; 
	input [31:0] coeff_1_3_ch29; 
	input [31:0] coeff_1_2_ch29; 
	input [31:0] coeff_1_1_ch29; 
	input [31:0] coeff_1_0_ch29;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch29;
	
	//Channel 30
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch30; 
	input [31:0] recip_stdev_3_ch30; 
	input [31:0] recip_stdev_2_ch30; 
	input [31:0] recip_stdev_1_ch30; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch30;
	input [31:0] neg_mean_3_ch30; 
	input [31:0] neg_mean_2_ch30; 
	input [31:0] neg_mean_1_ch30; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch30;
	input [31:0] coeff_4_9_ch30;
	input [31:0] coeff_4_8_ch30; 
	input [31:0] coeff_4_7_ch30; 
	input [31:0] coeff_4_6_ch30; 
	input [31:0] coeff_4_5_ch30; 
	input [31:0] coeff_4_4_ch30; 
	input [31:0] coeff_4_3_ch30; 
	input [31:0] coeff_4_2_ch30; 
	input [31:0] coeff_4_1_ch30; 
	input [31:0] coeff_4_0_ch30; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch30; 
	input [31:0] coeff_3_9_ch30; 
	input [31:0] coeff_3_8_ch30; 
	input [31:0] coeff_3_7_ch30; 
	input [31:0] coeff_3_6_ch30; 
	input [31:0] coeff_3_5_ch30; 
	input [31:0] coeff_3_4_ch30; 
	input [31:0] coeff_3_3_ch30; 
	input [31:0] coeff_3_2_ch30; 
	input [31:0] coeff_3_1_ch30; 
	input [31:0] coeff_3_0_ch30; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch30; 
	input [31:0] coeff_2_9_ch30; 
	input [31:0] coeff_2_8_ch30; 
	input [31:0] coeff_2_7_ch30; 
	input [31:0] coeff_2_6_ch30; 
	input [31:0] coeff_2_5_ch30; 
	input [31:0] coeff_2_4_ch30; 
	input [31:0] coeff_2_3_ch30; 
	input [31:0] coeff_2_2_ch30; 
	input [31:0] coeff_2_1_ch30; 
	input [31:0] coeff_2_0_ch30; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch30;
	input [31:0] coeff_1_9_ch30; 
	input [31:0] coeff_1_8_ch30; 
	input [31:0] coeff_1_7_ch30; 
	input [31:0] coeff_1_6_ch30; 
	input [31:0] coeff_1_5_ch30; 
	input [31:0] coeff_1_4_ch30; 
	input [31:0] coeff_1_3_ch30; 
	input [31:0] coeff_1_2_ch30; 
	input [31:0] coeff_1_1_ch30; 
	input [31:0] coeff_1_0_ch30;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch30;
	
	//Channel 31
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch31; 
	input [31:0] recip_stdev_3_ch31; 
	input [31:0] recip_stdev_2_ch31; 
	input [31:0] recip_stdev_1_ch31; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch31;
	input [31:0] neg_mean_3_ch31; 
	input [31:0] neg_mean_2_ch31; 
	input [31:0] neg_mean_1_ch31; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch31;
	input [31:0] coeff_4_9_ch31;
	input [31:0] coeff_4_8_ch31; 
	input [31:0] coeff_4_7_ch31; 
	input [31:0] coeff_4_6_ch31; 
	input [31:0] coeff_4_5_ch31; 
	input [31:0] coeff_4_4_ch31; 
	input [31:0] coeff_4_3_ch31; 
	input [31:0] coeff_4_2_ch31; 
	input [31:0] coeff_4_1_ch31; 
	input [31:0] coeff_4_0_ch31; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch31; 
	input [31:0] coeff_3_9_ch31; 
	input [31:0] coeff_3_8_ch31; 
	input [31:0] coeff_3_7_ch31; 
	input [31:0] coeff_3_6_ch31; 
	input [31:0] coeff_3_5_ch31; 
	input [31:0] coeff_3_4_ch31; 
	input [31:0] coeff_3_3_ch31; 
	input [31:0] coeff_3_2_ch31; 
	input [31:0] coeff_3_1_ch31; 
	input [31:0] coeff_3_0_ch31; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch31; 
	input [31:0] coeff_2_9_ch31; 
	input [31:0] coeff_2_8_ch31; 
	input [31:0] coeff_2_7_ch31; 
	input [31:0] coeff_2_6_ch31; 
	input [31:0] coeff_2_5_ch31; 
	input [31:0] coeff_2_4_ch31; 
	input [31:0] coeff_2_3_ch31; 
	input [31:0] coeff_2_2_ch31; 
	input [31:0] coeff_2_1_ch31; 
	input [31:0] coeff_2_0_ch31; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch31;
	input [31:0] coeff_1_9_ch31; 
	input [31:0] coeff_1_8_ch31; 
	input [31:0] coeff_1_7_ch31; 
	input [31:0] coeff_1_6_ch31; 
	input [31:0] coeff_1_5_ch31; 
	input [31:0] coeff_1_4_ch31; 
	input [31:0] coeff_1_3_ch31; 
	input [31:0] coeff_1_2_ch31; 
	input [31:0] coeff_1_1_ch31; 
	input [31:0] coeff_1_0_ch31;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch31;
	
	//Channel 32
		//Reciprocal standard deviation for the centered and scaled fit
	input [31:0] recip_stdev_4_ch32; 
	input [31:0] recip_stdev_3_ch32; 
	input [31:0] recip_stdev_2_ch32; 
	input [31:0] recip_stdev_1_ch32; 

	//Negative meand for the centered and scaled fit
	input [31:0] neg_mean_4_ch32;
	input [31:0] neg_mean_3_ch32; 
	input [31:0] neg_mean_2_ch32; 
	input [31:0] neg_mean_1_ch32; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	input [31:0] coeff_4_10_ch32;
	input [31:0] coeff_4_9_ch32;
	input [31:0] coeff_4_8_ch32; 
	input [31:0] coeff_4_7_ch32; 
	input [31:0] coeff_4_6_ch32; 
	input [31:0] coeff_4_5_ch32; 
	input [31:0] coeff_4_4_ch32; 
	input [31:0] coeff_4_3_ch32; 
	input [31:0] coeff_4_2_ch32; 
	input [31:0] coeff_4_1_ch32; 
	input [31:0] coeff_4_0_ch32; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	input [31:0] coeff_3_10_ch32; 
	input [31:0] coeff_3_9_ch32; 
	input [31:0] coeff_3_8_ch32; 
	input [31:0] coeff_3_7_ch32; 
	input [31:0] coeff_3_6_ch32; 
	input [31:0] coeff_3_5_ch32; 
	input [31:0] coeff_3_4_ch32; 
	input [31:0] coeff_3_3_ch32; 
	input [31:0] coeff_3_2_ch32; 
	input [31:0] coeff_3_1_ch32; 
	input [31:0] coeff_3_0_ch32; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	input [31:0] coeff_2_10_ch32; 
	input [31:0] coeff_2_9_ch32; 
	input [31:0] coeff_2_8_ch32; 
	input [31:0] coeff_2_7_ch32; 
	input [31:0] coeff_2_6_ch32; 
	input [31:0] coeff_2_5_ch32; 
	input [31:0] coeff_2_4_ch32; 
	input [31:0] coeff_2_3_ch32; 
	input [31:0] coeff_2_2_ch32; 
	input [31:0] coeff_2_1_ch32; 
	input [31:0] coeff_2_0_ch32; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	input [31:0] coeff_1_10_ch32;
	input [31:0] coeff_1_9_ch32; 
	input [31:0] coeff_1_8_ch32; 
	input [31:0] coeff_1_7_ch32; 
	input [31:0] coeff_1_6_ch32; 
	input [31:0] coeff_1_5_ch32; 
	input [31:0] coeff_1_4_ch32; 
	input [31:0] coeff_1_3_ch32; 
	input [31:0] coeff_1_2_ch32; 
	input [31:0] coeff_1_1_ch32; 
	input [31:0] coeff_1_0_ch32;
	
	//X-value that separates the sections
	input [19:0] section_limit_ch32;

	reg GlobalReset;	
	reg [3:0] state;
	reg [3:0] next_state;
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
	
	//Channel 1
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch1_r_in; 
	reg [31:0] recip_stdev_3_ch1_r_in; 
	reg [31:0] recip_stdev_2_ch1_r_in; 
	reg [31:0] recip_stdev_1_ch1_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch1_r_in;
	reg [31:0] neg_mean_3_ch1_r_in; 
	reg [31:0] neg_mean_2_ch1_r_in; 
	reg [31:0] neg_mean_1_ch1_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch1_r_in;
	reg [31:0] coeff_4_9_ch1_r_in;
	reg [31:0] coeff_4_8_ch1_r_in; 
	reg [31:0] coeff_4_7_ch1_r_in; 
	reg [31:0] coeff_4_6_ch1_r_in; 
	reg [31:0] coeff_4_5_ch1_r_in; 
	reg [31:0] coeff_4_4_ch1_r_in; 
	reg [31:0] coeff_4_3_ch1_r_in; 
	reg [31:0] coeff_4_2_ch1_r_in; 
	reg [31:0] coeff_4_1_ch1_r_in; 
	reg [31:0] coeff_4_0_ch1_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch1_r_in; 
	reg [31:0] coeff_3_9_ch1_r_in; 
	reg [31:0] coeff_3_8_ch1_r_in; 
	reg [31:0] coeff_3_7_ch1_r_in; 
	reg [31:0] coeff_3_6_ch1_r_in; 
	reg [31:0] coeff_3_5_ch1_r_in; 
	reg [31:0] coeff_3_4_ch1_r_in; 
	reg [31:0] coeff_3_3_ch1_r_in; 
	reg [31:0] coeff_3_2_ch1_r_in; 
	reg [31:0] coeff_3_1_ch1_r_in; 
	reg [31:0] coeff_3_0_ch1_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch1_r_in; 
	reg [31:0] coeff_2_9_ch1_r_in; 
	reg [31:0] coeff_2_8_ch1_r_in; 
	reg [31:0] coeff_2_7_ch1_r_in; 
	reg [31:0] coeff_2_6_ch1_r_in; 
	reg [31:0] coeff_2_5_ch1_r_in; 
	reg [31:0] coeff_2_4_ch1_r_in; 
	reg [31:0] coeff_2_3_ch1_r_in; 
	reg [31:0] coeff_2_2_ch1_r_in; 
	reg [31:0] coeff_2_1_ch1_r_in; 
	reg [31:0] coeff_2_0_ch1_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch1_r_in;
	reg [31:0] coeff_1_9_ch1_r_in; 
	reg [31:0] coeff_1_8_ch1_r_in; 
	reg [31:0] coeff_1_7_ch1_r_in; 
	reg [31:0] coeff_1_6_ch1_r_in; 
	reg [31:0] coeff_1_5_ch1_r_in; 
	reg [31:0] coeff_1_4_ch1_r_in; 
	reg [31:0] coeff_1_3_ch1_r_in; 
	reg [31:0] coeff_1_2_ch1_r_in; 
	reg [31:0] coeff_1_1_ch1_r_in; 
	reg [31:0] coeff_1_0_ch1_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch1_r_in;
	
	//Channel 2
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch2_r_in; 
	reg [31:0] recip_stdev_3_ch2_r_in; 
	reg [31:0] recip_stdev_2_ch2_r_in; 
	reg [31:0] recip_stdev_1_ch2_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch2_r_in;
	reg [31:0] neg_mean_3_ch2_r_in; 
	reg [31:0] neg_mean_2_ch2_r_in; 
	reg [31:0] neg_mean_1_ch2_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch2_r_in;
	reg [31:0] coeff_4_9_ch2_r_in;
	reg [31:0] coeff_4_8_ch2_r_in; 
	reg [31:0] coeff_4_7_ch2_r_in; 
	reg [31:0] coeff_4_6_ch2_r_in; 
	reg [31:0] coeff_4_5_ch2_r_in; 
	reg [31:0] coeff_4_4_ch2_r_in; 
	reg [31:0] coeff_4_3_ch2_r_in; 
	reg [31:0] coeff_4_2_ch2_r_in; 
	reg [31:0] coeff_4_1_ch2_r_in; 
	reg [31:0] coeff_4_0_ch2_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch2_r_in; 
	reg [31:0] coeff_3_9_ch2_r_in; 
	reg [31:0] coeff_3_8_ch2_r_in; 
	reg [31:0] coeff_3_7_ch2_r_in; 
	reg [31:0] coeff_3_6_ch2_r_in; 
	reg [31:0] coeff_3_5_ch2_r_in; 
	reg [31:0] coeff_3_4_ch2_r_in; 
	reg [31:0] coeff_3_3_ch2_r_in; 
	reg [31:0] coeff_3_2_ch2_r_in; 
	reg [31:0] coeff_3_1_ch2_r_in; 
	reg [31:0] coeff_3_0_ch2_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch2_r_in; 
	reg [31:0] coeff_2_9_ch2_r_in; 
	reg [31:0] coeff_2_8_ch2_r_in; 
	reg [31:0] coeff_2_7_ch2_r_in; 
	reg [31:0] coeff_2_6_ch2_r_in; 
	reg [31:0] coeff_2_5_ch2_r_in; 
	reg [31:0] coeff_2_4_ch2_r_in; 
	reg [31:0] coeff_2_3_ch2_r_in; 
	reg [31:0] coeff_2_2_ch2_r_in; 
	reg [31:0] coeff_2_1_ch2_r_in; 
	reg [31:0] coeff_2_0_ch2_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch2_r_in;
	reg [31:0] coeff_1_9_ch2_r_in; 
	reg [31:0] coeff_1_8_ch2_r_in; 
	reg [31:0] coeff_1_7_ch2_r_in; 
	reg [31:0] coeff_1_6_ch2_r_in; 
	reg [31:0] coeff_1_5_ch2_r_in; 
	reg [31:0] coeff_1_4_ch2_r_in; 
	reg [31:0] coeff_1_3_ch2_r_in; 
	reg [31:0] coeff_1_2_ch2_r_in; 
	reg [31:0] coeff_1_1_ch2_r_in; 
	reg [31:0] coeff_1_0_ch2_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch2_r_in;
	
	//Channel 3
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch3_r_in; 
	reg [31:0] recip_stdev_3_ch3_r_in; 
	reg [31:0] recip_stdev_2_ch3_r_in; 
	reg [31:0] recip_stdev_1_ch3_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch3_r_in;
	reg [31:0] neg_mean_3_ch3_r_in; 
	reg [31:0] neg_mean_2_ch3_r_in; 
	reg [31:0] neg_mean_1_ch3_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch3_r_in;
	reg [31:0] coeff_4_9_ch3_r_in;
	reg [31:0] coeff_4_8_ch3_r_in; 
	reg [31:0] coeff_4_7_ch3_r_in; 
	reg [31:0] coeff_4_6_ch3_r_in; 
	reg [31:0] coeff_4_5_ch3_r_in; 
	reg [31:0] coeff_4_4_ch3_r_in; 
	reg [31:0] coeff_4_3_ch3_r_in; 
	reg [31:0] coeff_4_2_ch3_r_in; 
	reg [31:0] coeff_4_1_ch3_r_in; 
	reg [31:0] coeff_4_0_ch3_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch3_r_in; 
	reg [31:0] coeff_3_9_ch3_r_in; 
	reg [31:0] coeff_3_8_ch3_r_in; 
	reg [31:0] coeff_3_7_ch3_r_in; 
	reg [31:0] coeff_3_6_ch3_r_in; 
	reg [31:0] coeff_3_5_ch3_r_in; 
	reg [31:0] coeff_3_4_ch3_r_in; 
	reg [31:0] coeff_3_3_ch3_r_in; 
	reg [31:0] coeff_3_2_ch3_r_in; 
	reg [31:0] coeff_3_1_ch3_r_in; 
	reg [31:0] coeff_3_0_ch3_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch3_r_in; 
	reg [31:0] coeff_2_9_ch3_r_in; 
	reg [31:0] coeff_2_8_ch3_r_in; 
	reg [31:0] coeff_2_7_ch3_r_in; 
	reg [31:0] coeff_2_6_ch3_r_in; 
	reg [31:0] coeff_2_5_ch3_r_in; 
	reg [31:0] coeff_2_4_ch3_r_in; 
	reg [31:0] coeff_2_3_ch3_r_in; 
	reg [31:0] coeff_2_2_ch3_r_in; 
	reg [31:0] coeff_2_1_ch3_r_in; 
	reg [31:0] coeff_2_0_ch3_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch3_r_in;
	reg [31:0] coeff_1_9_ch3_r_in; 
	reg [31:0] coeff_1_8_ch3_r_in; 
	reg [31:0] coeff_1_7_ch3_r_in; 
	reg [31:0] coeff_1_6_ch3_r_in; 
	reg [31:0] coeff_1_5_ch3_r_in; 
	reg [31:0] coeff_1_4_ch3_r_in; 
	reg [31:0] coeff_1_3_ch3_r_in; 
	reg [31:0] coeff_1_2_ch3_r_in; 
	reg [31:0] coeff_1_1_ch3_r_in; 
	reg [31:0] coeff_1_0_ch3_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch3_r_in;
	
	//Channel 4
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch4_r_in; 
	reg [31:0] recip_stdev_3_ch4_r_in; 
	reg [31:0] recip_stdev_2_ch4_r_in; 
	reg [31:0] recip_stdev_1_ch4_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch4_r_in;
	reg [31:0] neg_mean_3_ch4_r_in; 
	reg [31:0] neg_mean_2_ch4_r_in; 
	reg [31:0] neg_mean_1_ch4_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch4_r_in;
	reg [31:0] coeff_4_9_ch4_r_in;
	reg [31:0] coeff_4_8_ch4_r_in; 
	reg [31:0] coeff_4_7_ch4_r_in; 
	reg [31:0] coeff_4_6_ch4_r_in; 
	reg [31:0] coeff_4_5_ch4_r_in; 
	reg [31:0] coeff_4_4_ch4_r_in; 
	reg [31:0] coeff_4_3_ch4_r_in; 
	reg [31:0] coeff_4_2_ch4_r_in; 
	reg [31:0] coeff_4_1_ch4_r_in; 
	reg [31:0] coeff_4_0_ch4_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch4_r_in; 
	reg [31:0] coeff_3_9_ch4_r_in; 
	reg [31:0] coeff_3_8_ch4_r_in; 
	reg [31:0] coeff_3_7_ch4_r_in; 
	reg [31:0] coeff_3_6_ch4_r_in; 
	reg [31:0] coeff_3_5_ch4_r_in; 
	reg [31:0] coeff_3_4_ch4_r_in; 
	reg [31:0] coeff_3_3_ch4_r_in; 
	reg [31:0] coeff_3_2_ch4_r_in; 
	reg [31:0] coeff_3_1_ch4_r_in; 
	reg [31:0] coeff_3_0_ch4_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch4_r_in; 
	reg [31:0] coeff_2_9_ch4_r_in; 
	reg [31:0] coeff_2_8_ch4_r_in; 
	reg [31:0] coeff_2_7_ch4_r_in; 
	reg [31:0] coeff_2_6_ch4_r_in; 
	reg [31:0] coeff_2_5_ch4_r_in; 
	reg [31:0] coeff_2_4_ch4_r_in; 
	reg [31:0] coeff_2_3_ch4_r_in; 
	reg [31:0] coeff_2_2_ch4_r_in; 
	reg [31:0] coeff_2_1_ch4_r_in; 
	reg [31:0] coeff_2_0_ch4_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch4_r_in;
	reg [31:0] coeff_1_9_ch4_r_in; 
	reg [31:0] coeff_1_8_ch4_r_in; 
	reg [31:0] coeff_1_7_ch4_r_in; 
	reg [31:0] coeff_1_6_ch4_r_in; 
	reg [31:0] coeff_1_5_ch4_r_in; 
	reg [31:0] coeff_1_4_ch4_r_in; 
	reg [31:0] coeff_1_3_ch4_r_in; 
	reg [31:0] coeff_1_2_ch4_r_in; 
	reg [31:0] coeff_1_1_ch4_r_in; 
	reg [31:0] coeff_1_0_ch4_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch4_r_in;
	
	//Channel 5
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch5_r_in; 
	reg [31:0] recip_stdev_3_ch5_r_in; 
	reg [31:0] recip_stdev_2_ch5_r_in; 
	reg [31:0] recip_stdev_1_ch5_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch5_r_in;
	reg [31:0] neg_mean_3_ch5_r_in; 
	reg [31:0] neg_mean_2_ch5_r_in; 
	reg [31:0] neg_mean_1_ch5_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch5_r_in;
	reg [31:0] coeff_4_9_ch5_r_in;
	reg [31:0] coeff_4_8_ch5_r_in; 
	reg [31:0] coeff_4_7_ch5_r_in; 
	reg [31:0] coeff_4_6_ch5_r_in; 
	reg [31:0] coeff_4_5_ch5_r_in; 
	reg [31:0] coeff_4_4_ch5_r_in; 
	reg [31:0] coeff_4_3_ch5_r_in; 
	reg [31:0] coeff_4_2_ch5_r_in; 
	reg [31:0] coeff_4_1_ch5_r_in; 
	reg [31:0] coeff_4_0_ch5_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch5_r_in; 
	reg [31:0] coeff_3_9_ch5_r_in; 
	reg [31:0] coeff_3_8_ch5_r_in; 
	reg [31:0] coeff_3_7_ch5_r_in; 
	reg [31:0] coeff_3_6_ch5_r_in; 
	reg [31:0] coeff_3_5_ch5_r_in; 
	reg [31:0] coeff_3_4_ch5_r_in; 
	reg [31:0] coeff_3_3_ch5_r_in; 
	reg [31:0] coeff_3_2_ch5_r_in; 
	reg [31:0] coeff_3_1_ch5_r_in; 
	reg [31:0] coeff_3_0_ch5_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch5_r_in; 
	reg [31:0] coeff_2_9_ch5_r_in; 
	reg [31:0] coeff_2_8_ch5_r_in; 
	reg [31:0] coeff_2_7_ch5_r_in; 
	reg [31:0] coeff_2_6_ch5_r_in; 
	reg [31:0] coeff_2_5_ch5_r_in; 
	reg [31:0] coeff_2_4_ch5_r_in; 
	reg [31:0] coeff_2_3_ch5_r_in; 
	reg [31:0] coeff_2_2_ch5_r_in; 
	reg [31:0] coeff_2_1_ch5_r_in; 
	reg [31:0] coeff_2_0_ch5_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch5_r_in;
	reg [31:0] coeff_1_9_ch5_r_in; 
	reg [31:0] coeff_1_8_ch5_r_in; 
	reg [31:0] coeff_1_7_ch5_r_in; 
	reg [31:0] coeff_1_6_ch5_r_in; 
	reg [31:0] coeff_1_5_ch5_r_in; 
	reg [31:0] coeff_1_4_ch5_r_in; 
	reg [31:0] coeff_1_3_ch5_r_in; 
	reg [31:0] coeff_1_2_ch5_r_in; 
	reg [31:0] coeff_1_1_ch5_r_in; 
	reg [31:0] coeff_1_0_ch5_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch5_r_in;
	
	//Channel 6
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch6_r_in; 
	reg [31:0] recip_stdev_3_ch6_r_in; 
	reg [31:0] recip_stdev_2_ch6_r_in; 
	reg [31:0] recip_stdev_1_ch6_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch6_r_in;
	reg [31:0] neg_mean_3_ch6_r_in; 
	reg [31:0] neg_mean_2_ch6_r_in; 
	reg [31:0] neg_mean_1_ch6_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch6_r_in;
	reg [31:0] coeff_4_9_ch6_r_in;
	reg [31:0] coeff_4_8_ch6_r_in; 
	reg [31:0] coeff_4_7_ch6_r_in; 
	reg [31:0] coeff_4_6_ch6_r_in; 
	reg [31:0] coeff_4_5_ch6_r_in; 
	reg [31:0] coeff_4_4_ch6_r_in; 
	reg [31:0] coeff_4_3_ch6_r_in; 
	reg [31:0] coeff_4_2_ch6_r_in; 
	reg [31:0] coeff_4_1_ch6_r_in; 
	reg [31:0] coeff_4_0_ch6_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch6_r_in; 
	reg [31:0] coeff_3_9_ch6_r_in; 
	reg [31:0] coeff_3_8_ch6_r_in; 
	reg [31:0] coeff_3_7_ch6_r_in; 
	reg [31:0] coeff_3_6_ch6_r_in; 
	reg [31:0] coeff_3_5_ch6_r_in; 
	reg [31:0] coeff_3_4_ch6_r_in; 
	reg [31:0] coeff_3_3_ch6_r_in; 
	reg [31:0] coeff_3_2_ch6_r_in; 
	reg [31:0] coeff_3_1_ch6_r_in; 
	reg [31:0] coeff_3_0_ch6_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch6_r_in; 
	reg [31:0] coeff_2_9_ch6_r_in; 
	reg [31:0] coeff_2_8_ch6_r_in; 
	reg [31:0] coeff_2_7_ch6_r_in; 
	reg [31:0] coeff_2_6_ch6_r_in; 
	reg [31:0] coeff_2_5_ch6_r_in; 
	reg [31:0] coeff_2_4_ch6_r_in; 
	reg [31:0] coeff_2_3_ch6_r_in; 
	reg [31:0] coeff_2_2_ch6_r_in; 
	reg [31:0] coeff_2_1_ch6_r_in; 
	reg [31:0] coeff_2_0_ch6_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch6_r_in;
	reg [31:0] coeff_1_9_ch6_r_in; 
	reg [31:0] coeff_1_8_ch6_r_in; 
	reg [31:0] coeff_1_7_ch6_r_in; 
	reg [31:0] coeff_1_6_ch6_r_in; 
	reg [31:0] coeff_1_5_ch6_r_in; 
	reg [31:0] coeff_1_4_ch6_r_in; 
	reg [31:0] coeff_1_3_ch6_r_in; 
	reg [31:0] coeff_1_2_ch6_r_in; 
	reg [31:0] coeff_1_1_ch6_r_in; 
	reg [31:0] coeff_1_0_ch6_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch6_r_in;
	
	//Channel 7
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch7_r_in; 
	reg [31:0] recip_stdev_3_ch7_r_in; 
	reg [31:0] recip_stdev_2_ch7_r_in; 
	reg [31:0] recip_stdev_1_ch7_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch7_r_in;
	reg [31:0] neg_mean_3_ch7_r_in; 
	reg [31:0] neg_mean_2_ch7_r_in; 
	reg [31:0] neg_mean_1_ch7_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch7_r_in;
	reg [31:0] coeff_4_9_ch7_r_in;
	reg [31:0] coeff_4_8_ch7_r_in; 
	reg [31:0] coeff_4_7_ch7_r_in; 
	reg [31:0] coeff_4_6_ch7_r_in; 
	reg [31:0] coeff_4_5_ch7_r_in; 
	reg [31:0] coeff_4_4_ch7_r_in; 
	reg [31:0] coeff_4_3_ch7_r_in; 
	reg [31:0] coeff_4_2_ch7_r_in; 
	reg [31:0] coeff_4_1_ch7_r_in; 
	reg [31:0] coeff_4_0_ch7_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch7_r_in; 
	reg [31:0] coeff_3_9_ch7_r_in; 
	reg [31:0] coeff_3_8_ch7_r_in; 
	reg [31:0] coeff_3_7_ch7_r_in; 
	reg [31:0] coeff_3_6_ch7_r_in; 
	reg [31:0] coeff_3_5_ch7_r_in; 
	reg [31:0] coeff_3_4_ch7_r_in; 
	reg [31:0] coeff_3_3_ch7_r_in; 
	reg [31:0] coeff_3_2_ch7_r_in; 
	reg [31:0] coeff_3_1_ch7_r_in; 
	reg [31:0] coeff_3_0_ch7_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch7_r_in; 
	reg [31:0] coeff_2_9_ch7_r_in; 
	reg [31:0] coeff_2_8_ch7_r_in; 
	reg [31:0] coeff_2_7_ch7_r_in; 
	reg [31:0] coeff_2_6_ch7_r_in; 
	reg [31:0] coeff_2_5_ch7_r_in; 
	reg [31:0] coeff_2_4_ch7_r_in; 
	reg [31:0] coeff_2_3_ch7_r_in; 
	reg [31:0] coeff_2_2_ch7_r_in; 
	reg [31:0] coeff_2_1_ch7_r_in; 
	reg [31:0] coeff_2_0_ch7_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch7_r_in;
	reg [31:0] coeff_1_9_ch7_r_in; 
	reg [31:0] coeff_1_8_ch7_r_in; 
	reg [31:0] coeff_1_7_ch7_r_in; 
	reg [31:0] coeff_1_6_ch7_r_in; 
	reg [31:0] coeff_1_5_ch7_r_in; 
	reg [31:0] coeff_1_4_ch7_r_in; 
	reg [31:0] coeff_1_3_ch7_r_in; 
	reg [31:0] coeff_1_2_ch7_r_in; 
	reg [31:0] coeff_1_1_ch7_r_in; 
	reg [31:0] coeff_1_0_ch7_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch7_r_in;
	
	//Channel 8
	//Reciprocal standard deviation for the centered and scaled fit
	reg [31:0] recip_stdev_4_ch8_r_in; 
	reg [31:0] recip_stdev_3_ch8_r_in; 
	reg [31:0] recip_stdev_2_ch8_r_in; 
	reg [31:0] recip_stdev_1_ch8_r_in; 

	//Negative meand for the centered and scaled fit
	reg [31:0] neg_mean_4_ch8_r_in;
	reg [31:0] neg_mean_3_ch8_r_in; 
	reg [31:0] neg_mean_2_ch8_r_in; 
	reg [31:0] neg_mean_1_ch8_r_in; 

	//Section 4 coefficients (x > 0, |x| > section_limit)
	reg [31:0] coeff_4_10_ch8_r_in;
	reg [31:0] coeff_4_9_ch8_r_in;
	reg [31:0] coeff_4_8_ch8_r_in; 
	reg [31:0] coeff_4_7_ch8_r_in; 
	reg [31:0] coeff_4_6_ch8_r_in; 
	reg [31:0] coeff_4_5_ch8_r_in; 
	reg [31:0] coeff_4_4_ch8_r_in; 
	reg [31:0] coeff_4_3_ch8_r_in; 
	reg [31:0] coeff_4_2_ch8_r_in; 
	reg [31:0] coeff_4_1_ch8_r_in; 
	reg [31:0] coeff_4_0_ch8_r_in; 

	//Section 3 coefficients (x > 0, |x| <= section_limit)
	reg [31:0] coeff_3_10_ch8_r_in; 
	reg [31:0] coeff_3_9_ch8_r_in; 
	reg [31:0] coeff_3_8_ch8_r_in; 
	reg [31:0] coeff_3_7_ch8_r_in; 
	reg [31:0] coeff_3_6_ch8_r_in; 
	reg [31:0] coeff_3_5_ch8_r_in; 
	reg [31:0] coeff_3_4_ch8_r_in; 
	reg [31:0] coeff_3_3_ch8_r_in; 
	reg [31:0] coeff_3_2_ch8_r_in; 
	reg [31:0] coeff_3_1_ch8_r_in; 
	reg [31:0] coeff_3_0_ch8_r_in; 

	//Section 2 coefficients (x <= 0, |x| <= section_limit)
	reg [31:0] coeff_2_10_ch8_r_in; 
	reg [31:0] coeff_2_9_ch8_r_in; 
	reg [31:0] coeff_2_8_ch8_r_in; 
	reg [31:0] coeff_2_7_ch8_r_in; 
	reg [31:0] coeff_2_6_ch8_r_in; 
	reg [31:0] coeff_2_5_ch8_r_in; 
	reg [31:0] coeff_2_4_ch8_r_in; 
	reg [31:0] coeff_2_3_ch8_r_in; 
	reg [31:0] coeff_2_2_ch8_r_in; 
	reg [31:0] coeff_2_1_ch8_r_in; 
	reg [31:0] coeff_2_0_ch8_r_in; 

	//Section 1 coefficients (x <= 0, |x| > section_limit)
	reg [31:0] coeff_1_10_ch8_r_in;
	reg [31:0] coeff_1_9_ch8_r_in; 
	reg [31:0] coeff_1_8_ch8_r_in; 
	reg [31:0] coeff_1_7_ch8_r_in; 
	reg [31:0] coeff_1_6_ch8_r_in; 
	reg [31:0] coeff_1_5_ch8_r_in; 
	reg [31:0] coeff_1_4_ch8_r_in; 
	reg [31:0] coeff_1_3_ch8_r_in; 
	reg [31:0] coeff_1_2_ch8_r_in; 
	reg [31:0] coeff_1_1_ch8_r_in; 
	reg [31:0] coeff_1_0_ch8_r_in;
	
	//X-value that separates the sections
	reg [19:0] section_limit_ch8_r_in;
	
	//Registers for saving input values
	reg [20:0] x_adc_ch1_r; 
	reg [20:0] x_adc_ch2_r; 
	reg [20:0] x_adc_ch3_r; 
	reg [20:0] x_adc_ch4_r; 
	reg [20:0] x_adc_ch5_r; 
	reg [20:0] x_adc_ch6_r; 
	reg [20:0] x_adc_ch7_r; 
	reg [20:0] x_adc_ch8_r; 
	reg [20:0] x_adc_ch9_r; 
	reg [20:0] x_adc_ch10_r; 
	reg [20:0] x_adc_ch11_r; 
	reg [20:0] x_adc_ch12_r; 
	reg [20:0] x_adc_ch13_r; 
	reg [20:0] x_adc_ch14_r; 
	reg [20:0] x_adc_ch15_r; 
	reg [20:0] x_adc_ch16_r; 
	reg [20:0] x_adc_ch17_r; 
	reg [20:0] x_adc_ch18_r; 
	reg [20:0] x_adc_ch19_r; 
	reg [20:0] x_adc_ch20_r; 
	reg [20:0] x_adc_ch21_r; 
	reg [20:0] x_adc_ch22_r; 
	reg [20:0] x_adc_ch23_r; 
	reg [20:0] x_adc_ch24_r; 
	reg [20:0] x_adc_ch25_r; 
	reg [20:0] x_adc_ch26_r; 
	reg [20:0] x_adc_ch27_r; 
	reg [20:0] x_adc_ch28_r; 
	reg [20:0] x_adc_ch29_r; 
	reg [20:0] x_adc_ch30_r; 
	reg [20:0] x_adc_ch31_r; 
	reg [20:0] x_adc_ch32_r;
	
	//Channel input valid
	reg srdyi_1_r;
	reg srdyi_2_r;
	reg srdyi_3_r;
	reg srdyi_4_r;
	reg srdyi_5_r;
	reg srdyi_6_r;
	reg srdyi_7_r;
	reg srdyi_8_r;
	
	//Channel output valid
	wire srdyo_1_r;
	wire srdyo_2_r;
	wire srdyo_3_r;
	wire srdyo_4_r;
	wire srdyo_5_r;
	wire srdyo_6_r;
	wire srdyo_7_r;
	wire srdyo_8_r;
	
	//Channel outputs
	wire [20:0] x_lin_ch1_out_w;
	wire [20:0] x_lin_ch2_out_w;
	wire [20:0] x_lin_ch3_out_w;
	wire [20:0] x_lin_ch4_out_w;
	wire [20:0] x_lin_ch5_out_w;
	wire [20:0] x_lin_ch6_out_w;
	wire [20:0] x_lin_ch7_out_w;
	wire [20:0] x_lin_ch8_out_w;
	
	//Channel inputs
	reg [20:0] x_adc_ch1_in_r;
	reg [20:0] x_adc_ch2_in_r;
	reg [20:0] x_adc_ch3_in_r;
	reg [20:0] x_adc_ch4_in_r;
	reg [20:0] x_adc_ch5_in_r;
	reg [20:0] x_adc_ch6_in_r;
	reg [20:0] x_adc_ch7_in_r;
	reg [20:0] x_adc_ch8_in_r;
	
	//Saving output values
	reg [31:0] x_lin_ch1_r; 
	reg [31:0] x_lin_ch2_r; 
	reg [31:0] x_lin_ch3_r; 
	reg [31:0] x_lin_ch4_r; 
	reg [31:0] x_lin_ch5_r; 
	reg [31:0] x_lin_ch6_r; 
	reg [31:0] x_lin_ch7_r; 
	reg [31:0] x_lin_ch8_r; 
	reg [31:0] x_lin_ch9_r; 
	reg [31:0] x_lin_ch10_r; 
	reg [31:0] x_lin_ch11_r; 
	reg [31:0] x_lin_ch12_r; 
	reg [31:0] x_lin_ch13_r; 
	reg [31:0] x_lin_ch14_r; 
	reg [31:0] x_lin_ch15_r; 
	reg [31:0] x_lin_ch16_r; 
	reg [31:0] x_lin_ch17_r; 
	reg [31:0] x_lin_ch18_r; 
	reg [31:0] x_lin_ch19_r; 
	reg [31:0] x_lin_ch20_r; 
	reg [31:0] x_lin_ch21_r; 
	reg [31:0] x_lin_ch22_r; 
	reg [31:0] x_lin_ch23_r; 
	reg [31:0] x_lin_ch24_r; 
	reg [31:0] x_lin_ch25_r; 
	reg [31:0] x_lin_ch26_r; 
	reg [31:0] x_lin_ch27_r; 
	reg [31:0] x_lin_ch28_r; 
	reg [31:0] x_lin_ch29_r; 
	reg [31:0] x_lin_ch30_r; 
	reg [31:0] x_lin_ch31_r; 
	reg [31:0] x_lin_ch32_r;
	
	wire [31:0] x_lin_ch1_w; 
	wire [31:0] x_lin_ch2_w; 
	wire [31:0] x_lin_ch3_w; 
	wire [31:0] x_lin_ch4_w; 
	wire [31:0] x_lin_ch5_w; 
	wire [31:0] x_lin_ch6_w; 
	wire [31:0] x_lin_ch7_w; 
	wire [31:0] x_lin_ch8_w; 
	wire [31:0] x_lin_ch9_w; 
	wire [31:0] x_lin_ch10_w; 
	wire [31:0] x_lin_ch11_w; 
	wire [31:0] x_lin_ch12_w; 
	wire [31:0] x_lin_ch13_w; 
	wire [31:0] x_lin_ch14_w; 
	wire [31:0] x_lin_ch15_w; 
	wire [31:0] x_lin_ch16_w; 
	wire [31:0] x_lin_ch17_w; 
	wire [31:0] x_lin_ch18_w; 
	wire [31:0] x_lin_ch19_w; 
	wire [31:0] x_lin_ch20_w; 
	wire [31:0] x_lin_ch21_w; 
	wire [31:0] x_lin_ch22_w; 
	wire [31:0] x_lin_ch23_w; 
	wire [31:0] x_lin_ch24_w; 
	wire [31:0] x_lin_ch25_w; 
	wire [31:0] x_lin_ch26_w; 
	wire [31:0] x_lin_ch27_w; 
	wire [31:0] x_lin_ch28_w; 
	wire [31:0] x_lin_ch29_w; 
	wire [31:0] x_lin_ch30_w; 
	wire [31:0] x_lin_ch31_w; 
	wire [31:0] x_lin_ch32_w;
	
	assign x_lin_ch1_w = x_lin_ch1_r; 
	assign x_lin_ch2_w = x_lin_ch2_r; 
	assign x_lin_ch3_w = x_lin_ch3_r; 
	assign x_lin_ch4_w = x_lin_ch4_r; 
	assign x_lin_ch5_w = x_lin_ch5_r; 
	assign x_lin_ch6_w = x_lin_ch6_r; 
	assign x_lin_ch7_w = x_lin_ch7_r; 
	assign x_lin_ch8_w = x_lin_ch8_r; 
	assign x_lin_ch9_w = x_lin_ch9_r; 
	assign x_lin_ch10_w = x_lin_ch10_r; 
	assign x_lin_ch11_w = x_lin_ch11_r; 
	assign x_lin_ch12_w = x_lin_ch12_r; 
	assign x_lin_ch13_w = x_lin_ch13_r; 
	assign x_lin_ch14_w = x_lin_ch14_r; 
	assign x_lin_ch15_w = x_lin_ch15_r; 
	assign x_lin_ch16_w = x_lin_ch16_r; 
	assign x_lin_ch17_w = x_lin_ch17_r; 
	assign x_lin_ch18_w = x_lin_ch18_r; 
	assign x_lin_ch19_w = x_lin_ch19_r; 
	assign x_lin_ch20_w = x_lin_ch20_r; 
	assign x_lin_ch21_w = x_lin_ch21_r; 
	assign x_lin_ch22_w = x_lin_ch22_r; 
	assign x_lin_ch23_w = x_lin_ch23_r; 
	assign x_lin_ch24_w = x_lin_ch24_r; 
	assign x_lin_ch25_w = x_lin_ch25_r; 
	assign x_lin_ch26_w = x_lin_ch26_r; 
	assign x_lin_ch27_w = x_lin_ch27_r; 
	assign x_lin_ch28_w = x_lin_ch28_r; 
	assign x_lin_ch29_w = x_lin_ch29_r; 
	assign x_lin_ch30_w = x_lin_ch30_r; 
	assign x_lin_ch31_w = x_lin_ch31_r; 
	assign x_lin_ch32_w = x_lin_ch32_r;
	
	//Assign output values
	assign x_lin_ch1 = x_lin_ch1_r; 
	assign x_lin_ch2 = x_lin_ch2_r; 
	assign x_lin_ch3 = x_lin_ch3_r; 
	assign x_lin_ch4 = x_lin_ch4_r; 
	assign x_lin_ch5 = x_lin_ch5_r; 
	assign x_lin_ch6 = x_lin_ch6_r; 
	assign x_lin_ch7 = x_lin_ch7_r; 
	assign x_lin_ch8 = x_lin_ch8_r; 
	assign x_lin_ch9 = x_lin_ch9_r; 
	assign x_lin_ch10 = x_lin_ch10_r; 
	assign x_lin_ch11 = x_lin_ch11_r; 
	assign x_lin_ch12 = x_lin_ch12_r; 
	assign x_lin_ch13 = x_lin_ch13_r; 
	assign x_lin_ch14 = x_lin_ch14_r; 
	assign x_lin_ch15 = x_lin_ch15_r; 
	assign x_lin_ch16 = x_lin_ch16_r; 
	assign x_lin_ch17 = x_lin_ch17_r; 
	assign x_lin_ch18 = x_lin_ch18_r; 
	assign x_lin_ch19 = x_lin_ch19_r; 
	assign x_lin_ch20 = x_lin_ch20_r; 
	assign x_lin_ch21 = x_lin_ch21_r; 
	assign x_lin_ch22 = x_lin_ch22_r; 
	assign x_lin_ch23 = x_lin_ch23_r; 
	assign x_lin_ch24 = x_lin_ch24_r; 
	assign x_lin_ch25 = x_lin_ch25_r; 
	assign x_lin_ch26 = x_lin_ch26_r; 
	assign x_lin_ch27 = x_lin_ch27_r; 
	assign x_lin_ch28 = x_lin_ch28_r; 
	assign x_lin_ch29 = x_lin_ch29_r; 
	assign x_lin_ch30 = x_lin_ch30_r; 
	assign x_lin_ch31 = x_lin_ch31_r; 
	assign x_lin_ch32 = x_lin_ch32_r;
	
	reg in_enable_r;
	wire in_enable_w;
	assign in_enable_w = in_enable_r;
	
	reg out_enable_r;
	assign srdyo = out_enable_r;
		
/////////////////////////////////////////////////////////////
//8 block - 4 channel interleaving

//Channel 1
NLC_4sec_10th_1ch CH1(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_1_r), 
  .x_lin(x_lin_ch1_out_w),

  //NLC output
  .srdyo(srdyo_1_r), 
  .x_adc(x_adc_ch1_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch1_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch1_r_in), 
  .recip_stdev_3(recip_stdev_3_ch1_r_in), 
  .recip_stdev_2(recip_stdev_2_ch1_r_in), 
  .recip_stdev_1(recip_stdev_1_ch1_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch1_r_in), 
  .neg_mean_3(neg_mean_3_ch1_r_in), 
  .neg_mean_2(neg_mean_2_ch1_r_in), 
  .neg_mean_1(neg_mean_1_ch1_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch1_r_in), 
  .coeff_4_9(coeff_4_9_ch1_r_in), 
  .coeff_4_8(coeff_4_8_ch1_r_in), 
  .coeff_4_7(coeff_4_7_ch1_r_in), 
  .coeff_4_6(coeff_4_6_ch1_r_in), 
  .coeff_4_5(coeff_4_5_ch1_r_in), 
  .coeff_4_4(coeff_4_4_ch1_r_in), 
  .coeff_4_3(coeff_4_3_ch1_r_in), 
  .coeff_4_2(coeff_4_2_ch1_r_in), 
  .coeff_4_1(coeff_4_1_ch1_r_in), 
  .coeff_4_0(coeff_4_0_ch1_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch1_r_in), 
  .coeff_3_9(coeff_3_9_ch1_r_in), 
  .coeff_3_8(coeff_3_8_ch1_r_in), 
  .coeff_3_7(coeff_3_7_ch1_r_in), 
  .coeff_3_6(coeff_3_6_ch1_r_in), 
  .coeff_3_5(coeff_3_5_ch1_r_in), 
  .coeff_3_4(coeff_3_4_ch1_r_in), 
  .coeff_3_3(coeff_3_3_ch1_r_in), 
  .coeff_3_2(coeff_3_2_ch1_r_in), 
  .coeff_3_1(coeff_3_1_ch1_r_in), 
  .coeff_3_0(coeff_3_0_ch1_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch1_r_in), 
  .coeff_2_9(coeff_2_9_ch1_r_in), 
  .coeff_2_8(coeff_2_8_ch1_r_in), 
  .coeff_2_7(coeff_2_7_ch1_r_in), 
  .coeff_2_6(coeff_2_6_ch1_r_in), 
  .coeff_2_5(coeff_2_5_ch1_r_in), 
  .coeff_2_4(coeff_2_4_ch1_r_in), 
  .coeff_2_3(coeff_2_3_ch1_r_in), 
  .coeff_2_2(coeff_2_2_ch1_r_in), 
  .coeff_2_1(coeff_2_1_ch1_r_in), 
  .coeff_2_0(coeff_2_0_ch1_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch1_r_in), 
  .coeff_1_9(coeff_1_9_ch1_r_in), 
  .coeff_1_8(coeff_1_8_ch1_r_in), 
  .coeff_1_7(coeff_1_7_ch1_r_in), 
  .coeff_1_6(coeff_1_6_ch1_r_in), 
  .coeff_1_5(coeff_1_5_ch1_r_in), 
  .coeff_1_4(coeff_1_4_ch1_r_in), 
  .coeff_1_3(coeff_1_3_ch1_r_in), 
  .coeff_1_2(coeff_1_2_ch1_r_in), 
  .coeff_1_1(coeff_1_1_ch1_r_in), 
  .coeff_1_0(coeff_1_0_ch1_r_in) 
);

//Channel 2
NLC_4sec_10th_1ch CH2(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_2_r), 
  .x_lin(x_lin_ch2_out_w),

  //NLC output
  .srdyo(srdyo_2_r), 
  .x_adc(x_adc_ch2_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch2_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch2_r_in), 
  .recip_stdev_3(recip_stdev_3_ch2_r_in), 
  .recip_stdev_2(recip_stdev_2_ch2_r_in), 
  .recip_stdev_1(recip_stdev_1_ch2_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch2_r_in), 
  .neg_mean_3(neg_mean_3_ch2_r_in), 
  .neg_mean_2(neg_mean_2_ch2_r_in), 
  .neg_mean_1(neg_mean_1_ch2_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch2_r_in), 
  .coeff_4_9(coeff_4_9_ch2_r_in), 
  .coeff_4_8(coeff_4_8_ch2_r_in), 
  .coeff_4_7(coeff_4_7_ch2_r_in), 
  .coeff_4_6(coeff_4_6_ch2_r_in), 
  .coeff_4_5(coeff_4_5_ch2_r_in), 
  .coeff_4_4(coeff_4_4_ch2_r_in), 
  .coeff_4_3(coeff_4_3_ch2_r_in), 
  .coeff_4_2(coeff_4_2_ch2_r_in), 
  .coeff_4_1(coeff_4_1_ch2_r_in), 
  .coeff_4_0(coeff_4_0_ch2_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch2_r_in), 
  .coeff_3_9(coeff_3_9_ch2_r_in), 
  .coeff_3_8(coeff_3_8_ch2_r_in), 
  .coeff_3_7(coeff_3_7_ch2_r_in), 
  .coeff_3_6(coeff_3_6_ch2_r_in), 
  .coeff_3_5(coeff_3_5_ch2_r_in), 
  .coeff_3_4(coeff_3_4_ch2_r_in), 
  .coeff_3_3(coeff_3_3_ch2_r_in), 
  .coeff_3_2(coeff_3_2_ch2_r_in), 
  .coeff_3_1(coeff_3_1_ch2_r_in), 
  .coeff_3_0(coeff_3_0_ch2_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch2_r_in), 
  .coeff_2_9(coeff_2_9_ch2_r_in), 
  .coeff_2_8(coeff_2_8_ch2_r_in), 
  .coeff_2_7(coeff_2_7_ch2_r_in), 
  .coeff_2_6(coeff_2_6_ch2_r_in), 
  .coeff_2_5(coeff_2_5_ch2_r_in), 
  .coeff_2_4(coeff_2_4_ch2_r_in), 
  .coeff_2_3(coeff_2_3_ch2_r_in), 
  .coeff_2_2(coeff_2_2_ch2_r_in), 
  .coeff_2_1(coeff_2_1_ch2_r_in), 
  .coeff_2_0(coeff_2_0_ch2_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch2_r_in), 
  .coeff_1_9(coeff_1_9_ch2_r_in), 
  .coeff_1_8(coeff_1_8_ch2_r_in), 
  .coeff_1_7(coeff_1_7_ch2_r_in), 
  .coeff_1_6(coeff_1_6_ch2_r_in), 
  .coeff_1_5(coeff_1_5_ch2_r_in), 
  .coeff_1_4(coeff_1_4_ch2_r_in), 
  .coeff_1_3(coeff_1_3_ch2_r_in), 
  .coeff_1_2(coeff_1_2_ch2_r_in), 
  .coeff_1_1(coeff_1_1_ch2_r_in), 
  .coeff_1_0(coeff_1_0_ch2_r_in) 
);

//Channel 3
NLC_4sec_10th_1ch CH3(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_3_r), 
  .x_lin(x_lin_ch3_out_w),

  //NLC output
  .srdyo(srdyo_3_r), 
  .x_adc(x_adc_ch3_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch3_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch3_r_in), 
  .recip_stdev_3(recip_stdev_3_ch3_r_in), 
  .recip_stdev_2(recip_stdev_2_ch3_r_in), 
  .recip_stdev_1(recip_stdev_1_ch3_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch3_r_in), 
  .neg_mean_3(neg_mean_3_ch3_r_in), 
  .neg_mean_2(neg_mean_2_ch3_r_in), 
  .neg_mean_1(neg_mean_1_ch3_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch3_r_in), 
  .coeff_4_9(coeff_4_9_ch3_r_in), 
  .coeff_4_8(coeff_4_8_ch3_r_in), 
  .coeff_4_7(coeff_4_7_ch3_r_in), 
  .coeff_4_6(coeff_4_6_ch3_r_in), 
  .coeff_4_5(coeff_4_5_ch3_r_in), 
  .coeff_4_4(coeff_4_4_ch3_r_in), 
  .coeff_4_3(coeff_4_3_ch3_r_in), 
  .coeff_4_2(coeff_4_2_ch3_r_in), 
  .coeff_4_1(coeff_4_1_ch3_r_in), 
  .coeff_4_0(coeff_4_0_ch3_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch3_r_in), 
  .coeff_3_9(coeff_3_9_ch3_r_in), 
  .coeff_3_8(coeff_3_8_ch3_r_in), 
  .coeff_3_7(coeff_3_7_ch3_r_in), 
  .coeff_3_6(coeff_3_6_ch3_r_in), 
  .coeff_3_5(coeff_3_5_ch3_r_in), 
  .coeff_3_4(coeff_3_4_ch3_r_in), 
  .coeff_3_3(coeff_3_3_ch3_r_in), 
  .coeff_3_2(coeff_3_2_ch3_r_in), 
  .coeff_3_1(coeff_3_1_ch3_r_in), 
  .coeff_3_0(coeff_3_0_ch3_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch3_r_in), 
  .coeff_2_9(coeff_2_9_ch3_r_in), 
  .coeff_2_8(coeff_2_8_ch3_r_in), 
  .coeff_2_7(coeff_2_7_ch3_r_in), 
  .coeff_2_6(coeff_2_6_ch3_r_in), 
  .coeff_2_5(coeff_2_5_ch3_r_in), 
  .coeff_2_4(coeff_2_4_ch3_r_in), 
  .coeff_2_3(coeff_2_3_ch3_r_in), 
  .coeff_2_2(coeff_2_2_ch3_r_in), 
  .coeff_2_1(coeff_2_1_ch3_r_in), 
  .coeff_2_0(coeff_2_0_ch3_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch3_r_in), 
  .coeff_1_9(coeff_1_9_ch3_r_in), 
  .coeff_1_8(coeff_1_8_ch3_r_in), 
  .coeff_1_7(coeff_1_7_ch3_r_in), 
  .coeff_1_6(coeff_1_6_ch3_r_in), 
  .coeff_1_5(coeff_1_5_ch3_r_in), 
  .coeff_1_4(coeff_1_4_ch3_r_in), 
  .coeff_1_3(coeff_1_3_ch3_r_in), 
  .coeff_1_2(coeff_1_2_ch3_r_in), 
  .coeff_1_1(coeff_1_1_ch3_r_in), 
  .coeff_1_0(coeff_1_0_ch3_r_in) 
);

//Channel 4
NLC_4sec_10th_1ch CH4(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_4_r), 
  .x_lin(x_lin_ch4_out_w),

  //NLC output
  .srdyo(srdyo_4_r), 
  .x_adc(x_adc_ch4_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch4_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch4_r_in), 
  .recip_stdev_3(recip_stdev_3_ch4_r_in), 
  .recip_stdev_2(recip_stdev_2_ch4_r_in), 
  .recip_stdev_1(recip_stdev_1_ch4_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch4_r_in), 
  .neg_mean_3(neg_mean_3_ch4_r_in), 
  .neg_mean_2(neg_mean_2_ch4_r_in), 
  .neg_mean_1(neg_mean_1_ch4_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch4_r_in), 
  .coeff_4_9(coeff_4_9_ch4_r_in), 
  .coeff_4_8(coeff_4_8_ch4_r_in), 
  .coeff_4_7(coeff_4_7_ch4_r_in), 
  .coeff_4_6(coeff_4_6_ch4_r_in), 
  .coeff_4_5(coeff_4_5_ch4_r_in), 
  .coeff_4_4(coeff_4_4_ch4_r_in), 
  .coeff_4_3(coeff_4_3_ch4_r_in), 
  .coeff_4_2(coeff_4_2_ch4_r_in), 
  .coeff_4_1(coeff_4_1_ch4_r_in), 
  .coeff_4_0(coeff_4_0_ch4_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch4_r_in), 
  .coeff_3_9(coeff_3_9_ch4_r_in), 
  .coeff_3_8(coeff_3_8_ch4_r_in), 
  .coeff_3_7(coeff_3_7_ch4_r_in), 
  .coeff_3_6(coeff_3_6_ch4_r_in), 
  .coeff_3_5(coeff_3_5_ch4_r_in), 
  .coeff_3_4(coeff_3_4_ch4_r_in), 
  .coeff_3_3(coeff_3_3_ch4_r_in), 
  .coeff_3_2(coeff_3_2_ch4_r_in), 
  .coeff_3_1(coeff_3_1_ch4_r_in), 
  .coeff_3_0(coeff_3_0_ch4_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch4_r_in), 
  .coeff_2_9(coeff_2_9_ch4_r_in), 
  .coeff_2_8(coeff_2_8_ch4_r_in), 
  .coeff_2_7(coeff_2_7_ch4_r_in), 
  .coeff_2_6(coeff_2_6_ch4_r_in), 
  .coeff_2_5(coeff_2_5_ch4_r_in), 
  .coeff_2_4(coeff_2_4_ch4_r_in), 
  .coeff_2_3(coeff_2_3_ch4_r_in), 
  .coeff_2_2(coeff_2_2_ch4_r_in), 
  .coeff_2_1(coeff_2_1_ch4_r_in), 
  .coeff_2_0(coeff_2_0_ch4_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch4_r_in), 
  .coeff_1_9(coeff_1_9_ch4_r_in), 
  .coeff_1_8(coeff_1_8_ch4_r_in), 
  .coeff_1_7(coeff_1_7_ch4_r_in), 
  .coeff_1_6(coeff_1_6_ch4_r_in), 
  .coeff_1_5(coeff_1_5_ch4_r_in), 
  .coeff_1_4(coeff_1_4_ch4_r_in), 
  .coeff_1_3(coeff_1_3_ch4_r_in), 
  .coeff_1_2(coeff_1_2_ch4_r_in), 
  .coeff_1_1(coeff_1_1_ch4_r_in), 
  .coeff_1_0(coeff_1_0_ch4_r_in) 
);

//Channel 5
NLC_4sec_10th_1ch CH5(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_5_r), 
  .x_lin(x_lin_ch5_out_w),

  //NLC output
  .srdyo(srdyo_5_r), 
  .x_adc(x_adc_ch5_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch5_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch5_r_in), 
  .recip_stdev_3(recip_stdev_3_ch5_r_in), 
  .recip_stdev_2(recip_stdev_2_ch5_r_in), 
  .recip_stdev_1(recip_stdev_1_ch5_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch5_r_in), 
  .neg_mean_3(neg_mean_3_ch5_r_in), 
  .neg_mean_2(neg_mean_2_ch5_r_in), 
  .neg_mean_1(neg_mean_1_ch5_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch5_r_in), 
  .coeff_4_9(coeff_4_9_ch5_r_in), 
  .coeff_4_8(coeff_4_8_ch5_r_in), 
  .coeff_4_7(coeff_4_7_ch5_r_in), 
  .coeff_4_6(coeff_4_6_ch5_r_in), 
  .coeff_4_5(coeff_4_5_ch5_r_in), 
  .coeff_4_4(coeff_4_4_ch5_r_in), 
  .coeff_4_3(coeff_4_3_ch5_r_in), 
  .coeff_4_2(coeff_4_2_ch5_r_in), 
  .coeff_4_1(coeff_4_1_ch5_r_in), 
  .coeff_4_0(coeff_4_0_ch5_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch5_r_in), 
  .coeff_3_9(coeff_3_9_ch5_r_in), 
  .coeff_3_8(coeff_3_8_ch5_r_in), 
  .coeff_3_7(coeff_3_7_ch5_r_in), 
  .coeff_3_6(coeff_3_6_ch5_r_in), 
  .coeff_3_5(coeff_3_5_ch5_r_in), 
  .coeff_3_4(coeff_3_4_ch5_r_in), 
  .coeff_3_3(coeff_3_3_ch5_r_in), 
  .coeff_3_2(coeff_3_2_ch5_r_in), 
  .coeff_3_1(coeff_3_1_ch5_r_in), 
  .coeff_3_0(coeff_3_0_ch5_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch5_r_in), 
  .coeff_2_9(coeff_2_9_ch5_r_in), 
  .coeff_2_8(coeff_2_8_ch5_r_in), 
  .coeff_2_7(coeff_2_7_ch5_r_in), 
  .coeff_2_6(coeff_2_6_ch5_r_in), 
  .coeff_2_5(coeff_2_5_ch5_r_in), 
  .coeff_2_4(coeff_2_4_ch5_r_in), 
  .coeff_2_3(coeff_2_3_ch5_r_in), 
  .coeff_2_2(coeff_2_2_ch5_r_in), 
  .coeff_2_1(coeff_2_1_ch5_r_in), 
  .coeff_2_0(coeff_2_0_ch5_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch5_r_in), 
  .coeff_1_9(coeff_1_9_ch5_r_in), 
  .coeff_1_8(coeff_1_8_ch5_r_in), 
  .coeff_1_7(coeff_1_7_ch5_r_in), 
  .coeff_1_6(coeff_1_6_ch5_r_in), 
  .coeff_1_5(coeff_1_5_ch5_r_in), 
  .coeff_1_4(coeff_1_4_ch5_r_in), 
  .coeff_1_3(coeff_1_3_ch5_r_in), 
  .coeff_1_2(coeff_1_2_ch5_r_in), 
  .coeff_1_1(coeff_1_1_ch5_r_in), 
  .coeff_1_0(coeff_1_0_ch5_r_in) 
);

//Channel 6
NLC_4sec_10th_1ch CH6(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_6_r), 
  .x_lin(x_lin_ch6_out_w),

  //NLC output
  .srdyo(srdyo_6_r), 
  .x_adc(x_adc_ch6_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch6_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch6_r_in), 
  .recip_stdev_3(recip_stdev_3_ch6_r_in), 
  .recip_stdev_2(recip_stdev_2_ch6_r_in), 
  .recip_stdev_1(recip_stdev_1_ch6_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch6_r_in), 
  .neg_mean_3(neg_mean_3_ch6_r_in), 
  .neg_mean_2(neg_mean_2_ch6_r_in), 
  .neg_mean_1(neg_mean_1_ch6_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch6_r_in), 
  .coeff_4_9(coeff_4_9_ch6_r_in), 
  .coeff_4_8(coeff_4_8_ch6_r_in), 
  .coeff_4_7(coeff_4_7_ch6_r_in), 
  .coeff_4_6(coeff_4_6_ch6_r_in), 
  .coeff_4_5(coeff_4_5_ch6_r_in), 
  .coeff_4_4(coeff_4_4_ch6_r_in), 
  .coeff_4_3(coeff_4_3_ch6_r_in), 
  .coeff_4_2(coeff_4_2_ch6_r_in), 
  .coeff_4_1(coeff_4_1_ch6_r_in), 
  .coeff_4_0(coeff_4_0_ch6_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch6_r_in), 
  .coeff_3_9(coeff_3_9_ch6_r_in), 
  .coeff_3_8(coeff_3_8_ch6_r_in), 
  .coeff_3_7(coeff_3_7_ch6_r_in), 
  .coeff_3_6(coeff_3_6_ch6_r_in), 
  .coeff_3_5(coeff_3_5_ch6_r_in), 
  .coeff_3_4(coeff_3_4_ch6_r_in), 
  .coeff_3_3(coeff_3_3_ch6_r_in), 
  .coeff_3_2(coeff_3_2_ch6_r_in), 
  .coeff_3_1(coeff_3_1_ch6_r_in), 
  .coeff_3_0(coeff_3_0_ch6_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch6_r_in), 
  .coeff_2_9(coeff_2_9_ch6_r_in), 
  .coeff_2_8(coeff_2_8_ch6_r_in), 
  .coeff_2_7(coeff_2_7_ch6_r_in), 
  .coeff_2_6(coeff_2_6_ch6_r_in), 
  .coeff_2_5(coeff_2_5_ch6_r_in), 
  .coeff_2_4(coeff_2_4_ch6_r_in), 
  .coeff_2_3(coeff_2_3_ch6_r_in), 
  .coeff_2_2(coeff_2_2_ch6_r_in), 
  .coeff_2_1(coeff_2_1_ch6_r_in), 
  .coeff_2_0(coeff_2_0_ch6_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch6_r_in), 
  .coeff_1_9(coeff_1_9_ch6_r_in), 
  .coeff_1_8(coeff_1_8_ch6_r_in), 
  .coeff_1_7(coeff_1_7_ch6_r_in), 
  .coeff_1_6(coeff_1_6_ch6_r_in), 
  .coeff_1_5(coeff_1_5_ch6_r_in), 
  .coeff_1_4(coeff_1_4_ch6_r_in), 
  .coeff_1_3(coeff_1_3_ch6_r_in), 
  .coeff_1_2(coeff_1_2_ch6_r_in), 
  .coeff_1_1(coeff_1_1_ch6_r_in), 
  .coeff_1_0(coeff_1_0_ch6_r_in) 
);

//Channel 7
NLC_4sec_10th_1ch CH7(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_7_r), 
  .x_lin(x_lin_ch7_out_w),

  //NLC output
  .srdyo(srdyo_7_r), 
  .x_adc(x_adc_ch7_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch7_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch7_r_in), 
  .recip_stdev_3(recip_stdev_3_ch7_r_in), 
  .recip_stdev_2(recip_stdev_2_ch7_r_in), 
  .recip_stdev_1(recip_stdev_1_ch7_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch7_r_in), 
  .neg_mean_3(neg_mean_3_ch7_r_in), 
  .neg_mean_2(neg_mean_2_ch7_r_in), 
  .neg_mean_1(neg_mean_1_ch7_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch7_r_in), 
  .coeff_4_9(coeff_4_9_ch7_r_in), 
  .coeff_4_8(coeff_4_8_ch7_r_in), 
  .coeff_4_7(coeff_4_7_ch7_r_in), 
  .coeff_4_6(coeff_4_6_ch7_r_in), 
  .coeff_4_5(coeff_4_5_ch7_r_in), 
  .coeff_4_4(coeff_4_4_ch7_r_in), 
  .coeff_4_3(coeff_4_3_ch7_r_in), 
  .coeff_4_2(coeff_4_2_ch7_r_in), 
  .coeff_4_1(coeff_4_1_ch7_r_in), 
  .coeff_4_0(coeff_4_0_ch7_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch7_r_in), 
  .coeff_3_9(coeff_3_9_ch7_r_in), 
  .coeff_3_8(coeff_3_8_ch7_r_in), 
  .coeff_3_7(coeff_3_7_ch7_r_in), 
  .coeff_3_6(coeff_3_6_ch7_r_in), 
  .coeff_3_5(coeff_3_5_ch7_r_in), 
  .coeff_3_4(coeff_3_4_ch7_r_in), 
  .coeff_3_3(coeff_3_3_ch7_r_in), 
  .coeff_3_2(coeff_3_2_ch7_r_in), 
  .coeff_3_1(coeff_3_1_ch7_r_in), 
  .coeff_3_0(coeff_3_0_ch7_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch7_r_in), 
  .coeff_2_9(coeff_2_9_ch7_r_in), 
  .coeff_2_8(coeff_2_8_ch7_r_in), 
  .coeff_2_7(coeff_2_7_ch7_r_in), 
  .coeff_2_6(coeff_2_6_ch7_r_in), 
  .coeff_2_5(coeff_2_5_ch7_r_in), 
  .coeff_2_4(coeff_2_4_ch7_r_in), 
  .coeff_2_3(coeff_2_3_ch7_r_in), 
  .coeff_2_2(coeff_2_2_ch7_r_in), 
  .coeff_2_1(coeff_2_1_ch7_r_in), 
  .coeff_2_0(coeff_2_0_ch7_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch7_r_in), 
  .coeff_1_9(coeff_1_9_ch7_r_in), 
  .coeff_1_8(coeff_1_8_ch7_r_in), 
  .coeff_1_7(coeff_1_7_ch7_r_in), 
  .coeff_1_6(coeff_1_6_ch7_r_in), 
  .coeff_1_5(coeff_1_5_ch7_r_in), 
  .coeff_1_4(coeff_1_4_ch7_r_in), 
  .coeff_1_3(coeff_1_3_ch7_r_in), 
  .coeff_1_2(coeff_1_2_ch7_r_in), 
  .coeff_1_1(coeff_1_1_ch7_r_in), 
  .coeff_1_0(coeff_1_0_ch7_r_in) 
);

//Channel 8
NLC_4sec_10th_1ch CH8(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),
  
  //ADC output
  .srdyi(srdyi_8_r), 
  .x_lin(x_lin_ch8_out_w),

  //NLC output
  .srdyo(srdyo_8_r), 
  .x_adc(x_adc_ch8_in_r), 

  //X-value that separates the sections
  .section_limit(section_limit_ch8_r_in),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(recip_stdev_4_ch8_r_in), 
  .recip_stdev_3(recip_stdev_3_ch8_r_in), 
  .recip_stdev_2(recip_stdev_2_ch8_r_in), 
  .recip_stdev_1(recip_stdev_1_ch8_r_in), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(neg_mean_4_ch8_r_in), 
  .neg_mean_3(neg_mean_3_ch8_r_in), 
  .neg_mean_2(neg_mean_2_ch8_r_in), 
  .neg_mean_1(neg_mean_1_ch8_r_in), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(coeff_4_10_ch8_r_in), 
  .coeff_4_9(coeff_4_9_ch8_r_in), 
  .coeff_4_8(coeff_4_8_ch8_r_in), 
  .coeff_4_7(coeff_4_7_ch8_r_in), 
  .coeff_4_6(coeff_4_6_ch8_r_in), 
  .coeff_4_5(coeff_4_5_ch8_r_in), 
  .coeff_4_4(coeff_4_4_ch8_r_in), 
  .coeff_4_3(coeff_4_3_ch8_r_in), 
  .coeff_4_2(coeff_4_2_ch8_r_in), 
  .coeff_4_1(coeff_4_1_ch8_r_in), 
  .coeff_4_0(coeff_4_0_ch8_r_in), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(coeff_3_10_ch8_r_in), 
  .coeff_3_9(coeff_3_9_ch8_r_in), 
  .coeff_3_8(coeff_3_8_ch8_r_in), 
  .coeff_3_7(coeff_3_7_ch8_r_in), 
  .coeff_3_6(coeff_3_6_ch8_r_in), 
  .coeff_3_5(coeff_3_5_ch8_r_in), 
  .coeff_3_4(coeff_3_4_ch8_r_in), 
  .coeff_3_3(coeff_3_3_ch8_r_in), 
  .coeff_3_2(coeff_3_2_ch8_r_in), 
  .coeff_3_1(coeff_3_1_ch8_r_in), 
  .coeff_3_0(coeff_3_0_ch8_r_in), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(coeff_2_10_ch8_r_in), 
  .coeff_2_9(coeff_2_9_ch8_r_in), 
  .coeff_2_8(coeff_2_8_ch8_r_in), 
  .coeff_2_7(coeff_2_7_ch8_r_in), 
  .coeff_2_6(coeff_2_6_ch8_r_in), 
  .coeff_2_5(coeff_2_5_ch8_r_in), 
  .coeff_2_4(coeff_2_4_ch8_r_in), 
  .coeff_2_3(coeff_2_3_ch8_r_in), 
  .coeff_2_2(coeff_2_2_ch8_r_in), 
  .coeff_2_1(coeff_2_1_ch8_r_in), 
  .coeff_2_0(coeff_2_0_ch8_r_in), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(coeff_1_10_ch8_r_in), 
  .coeff_1_9(coeff_1_9_ch8_r_in), 
  .coeff_1_8(coeff_1_8_ch8_r_in), 
  .coeff_1_7(coeff_1_7_ch8_r_in), 
  .coeff_1_6(coeff_1_6_ch8_r_in), 
  .coeff_1_5(coeff_1_5_ch8_r_in), 
  .coeff_1_4(coeff_1_4_ch8_r_in), 
  .coeff_1_3(coeff_1_3_ch8_r_in), 
  .coeff_1_2(coeff_1_2_ch8_r_in), 
  .coeff_1_1(coeff_1_1_ch8_r_in), 
  .coeff_1_0(coeff_1_0_ch8_r_in) 
);

/////////////////////////////////////////////////////////////////////////////////
//4 Channel Interleaving - 8 blocks

//Assign inputs
//Channel 1 will takes inputs from ch 1,9,17,25
//Channel 2 will takes inputs from ch 2,10,18,26
//Channel 3 will takes inputs from ch 3,11,19,27
//Channel 4 will takes inputs from ch 4,12,20,28
//Channel 5 will takes inputs from ch 5,13,21,29
//Channel 6 will takes inputs from ch 6,14,22,30
//Channel 7 will takes inputs from ch 7,15,23,31
//Channel 8 will takes inputs from ch 8,16,24,32
always @(*) begin
	case(state)
		S0: begin
			out_enable_r = 1'b0;
	
			//Initialize output values
			x_lin_ch1_r = 21'd0; 
			x_lin_ch2_r = 21'd0; 
			x_lin_ch3_r = 21'd0; 
			x_lin_ch4_r = 21'd0; 
			x_lin_ch5_r = 21'd0; 
			x_lin_ch6_r = 21'd0; 
			x_lin_ch7_r = 21'd0; 
			x_lin_ch8_r = 21'd0; 
			x_lin_ch9_r = 21'd0; 
			x_lin_ch10_r = 21'd0; 
			x_lin_ch11_r = 21'd0; 
			x_lin_ch12_r = 21'd0; 
			x_lin_ch13_r = 21'd0; 
			x_lin_ch14_r = 21'd0; 
			x_lin_ch15_r = 21'd0; 
			x_lin_ch16_r = 21'd0; 
			x_lin_ch17_r = 21'd0; 
			x_lin_ch18_r = 21'd0; 
			x_lin_ch19_r = 21'd0; 
			x_lin_ch20_r = 21'd0; 
			x_lin_ch21_r = 21'd0; 
			x_lin_ch22_r = 21'd0; 
			x_lin_ch23_r = 21'd0; 
			x_lin_ch24_r = 21'd0; 
			x_lin_ch25_r = 21'd0; 
			x_lin_ch26_r = 21'd0; 
			x_lin_ch27_r = 21'd0; 
			x_lin_ch28_r = 21'd0; 
			x_lin_ch29_r = 21'd0; 
			x_lin_ch30_r = 21'd0; 
			x_lin_ch31_r = 21'd0; 
			x_lin_ch32_r = 21'd0;
			
			//Channel 1
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = 32'd0;
			recip_stdev_3_ch1_r_in = 32'd0; 
			recip_stdev_2_ch1_r_in = 32'd0; 
			recip_stdev_1_ch1_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = 32'd0;
			neg_mean_3_ch1_r_in = 32'd0; 
			neg_mean_2_ch1_r_in = 32'd0; 
			neg_mean_1_ch1_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = 32'd0;
			coeff_4_9_ch1_r_in = 32'd0;
			coeff_4_8_ch1_r_in = 32'd0; 
			coeff_4_7_ch1_r_in = 32'd0; 
			coeff_4_6_ch1_r_in = 32'd0; 
			coeff_4_5_ch1_r_in = 32'd0; 
			coeff_4_4_ch1_r_in = 32'd0; 
			coeff_4_3_ch1_r_in = 32'd0; 
			coeff_4_2_ch1_r_in = 32'd0; 
			coeff_4_1_ch1_r_in = 32'd0; 
			coeff_4_0_ch1_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = 32'd0; 
			coeff_3_9_ch1_r_in = 32'd0; 
			coeff_3_8_ch1_r_in = 32'd0; 
			coeff_3_7_ch1_r_in = 32'd0; 
			coeff_3_6_ch1_r_in = 32'd0; 
			coeff_3_5_ch1_r_in = 32'd0; 
			coeff_3_4_ch1_r_in = 32'd0; 
			coeff_3_3_ch1_r_in = 32'd0; 
			coeff_3_2_ch1_r_in = 32'd0; 
			coeff_3_1_ch1_r_in = 32'd0; 
			coeff_3_0_ch1_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = 32'd0; 
			coeff_2_9_ch1_r_in = 32'd0; 
			coeff_2_8_ch1_r_in = 32'd0; 
			coeff_2_7_ch1_r_in = 32'd0; 
			coeff_2_6_ch1_r_in = 32'd0; 
			coeff_2_5_ch1_r_in = 32'd0; 
			coeff_2_4_ch1_r_in = 32'd0; 
			coeff_2_3_ch1_r_in = 32'd0; 
			coeff_2_2_ch1_r_in = 32'd0; 
			coeff_2_1_ch1_r_in = 32'd0; 
			coeff_2_0_ch1_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = 32'd0;
			coeff_1_9_ch1_r_in = 32'd0; 
			coeff_1_8_ch1_r_in = 32'd0; 
			coeff_1_7_ch1_r_in = 32'd0; 
			coeff_1_6_ch1_r_in = 32'd0; 
			coeff_1_5_ch1_r_in = 32'd0; 
			coeff_1_4_ch1_r_in = 32'd0; 
			coeff_1_3_ch1_r_in = 32'd0; 
			coeff_1_2_ch1_r_in = 32'd0; 
			coeff_1_1_ch1_r_in = 32'd0; 
			coeff_1_0_ch1_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = 20'd0;
			
			//Channel 2
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = 32'd0; 
			recip_stdev_3_ch2_r_in = 32'd0; 
			recip_stdev_2_ch2_r_in = 32'd0; 
			recip_stdev_1_ch2_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = 32'd0;
			neg_mean_3_ch2_r_in = 32'd0; 
			neg_mean_2_ch2_r_in = 32'd0; 
			neg_mean_1_ch2_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = 32'd0;
			coeff_4_9_ch2_r_in = 32'd0;
			coeff_4_8_ch2_r_in = 32'd0; 
			coeff_4_7_ch2_r_in = 32'd0; 
			coeff_4_6_ch2_r_in = 32'd0; 
			coeff_4_5_ch2_r_in = 32'd0; 
			coeff_4_4_ch2_r_in = 32'd0; 
			coeff_4_3_ch2_r_in = 32'd0; 
			coeff_4_2_ch2_r_in = 32'd0; 
			coeff_4_1_ch2_r_in = 32'd0; 
			coeff_4_0_ch2_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = 32'd0; 
			coeff_3_9_ch2_r_in = 32'd0; 
			coeff_3_8_ch2_r_in = 32'd0; 
			coeff_3_7_ch2_r_in = 32'd0; 
			coeff_3_6_ch2_r_in = 32'd0; 
			coeff_3_5_ch2_r_in = 32'd0; 
			coeff_3_4_ch2_r_in = 32'd0; 
			coeff_3_3_ch2_r_in = 32'd0; 
			coeff_3_2_ch2_r_in = 32'd0; 
			coeff_3_1_ch2_r_in = 32'd0; 
			coeff_3_0_ch2_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = 32'd0; 
			coeff_2_9_ch2_r_in = 32'd0; 
			coeff_2_8_ch2_r_in = 32'd0; 
			coeff_2_7_ch2_r_in = 32'd0; 
			coeff_2_6_ch2_r_in = 32'd0; 
			coeff_2_5_ch2_r_in = 32'd0; 
			coeff_2_4_ch2_r_in = 32'd0; 
			coeff_2_3_ch2_r_in = 32'd0; 
			coeff_2_2_ch2_r_in = 32'd0; 
			coeff_2_1_ch2_r_in = 32'd0; 
			coeff_2_0_ch2_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = 32'd0;
			coeff_1_9_ch2_r_in = 32'd0; 
			coeff_1_8_ch2_r_in = 32'd0; 
			coeff_1_7_ch2_r_in = 32'd0; 
			coeff_1_6_ch2_r_in = 32'd0; 
			coeff_1_5_ch2_r_in = 32'd0; 
			coeff_1_4_ch2_r_in = 32'd0; 
			coeff_1_3_ch2_r_in = 32'd0; 
			coeff_1_2_ch2_r_in = 32'd0; 
			coeff_1_1_ch2_r_in = 32'd0; 
			coeff_1_0_ch2_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = 20'd0;
			
			//Channel 3
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = 32'd0; 
			recip_stdev_3_ch3_r_in = 32'd0; 
			recip_stdev_2_ch3_r_in = 32'd0; 
			recip_stdev_1_ch3_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = 32'd0;
			neg_mean_3_ch3_r_in = 32'd0; 
			neg_mean_2_ch3_r_in = 32'd0; 
			neg_mean_1_ch3_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = 32'd0;
			coeff_4_9_ch3_r_in = 32'd0;
			coeff_4_8_ch3_r_in = 32'd0; 
			coeff_4_7_ch3_r_in = 32'd0; 
			coeff_4_6_ch3_r_in = 32'd0; 
			coeff_4_5_ch3_r_in = 32'd0; 
			coeff_4_4_ch3_r_in = 32'd0; 
			coeff_4_3_ch3_r_in = 32'd0; 
			coeff_4_2_ch3_r_in = 32'd0; 
			coeff_4_1_ch3_r_in = 32'd0; 
			coeff_4_0_ch3_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = 32'd0; 
			coeff_3_9_ch3_r_in = 32'd0; 
			coeff_3_8_ch3_r_in = 32'd0; 
			coeff_3_7_ch3_r_in = 32'd0; 
			coeff_3_6_ch3_r_in = 32'd0; 
			coeff_3_5_ch3_r_in = 32'd0; 
			coeff_3_4_ch3_r_in = 32'd0; 
			coeff_3_3_ch3_r_in = 32'd0; 
			coeff_3_2_ch3_r_in = 32'd0; 
			coeff_3_1_ch3_r_in = 32'd0; 
			coeff_3_0_ch3_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = 32'd0; 
			coeff_2_9_ch3_r_in = 32'd0; 
			coeff_2_8_ch3_r_in = 32'd0; 
			coeff_2_7_ch3_r_in = 32'd0; 
			coeff_2_6_ch3_r_in = 32'd0; 
			coeff_2_5_ch3_r_in = 32'd0; 
			coeff_2_4_ch3_r_in = 32'd0; 
			coeff_2_3_ch3_r_in = 32'd0; 
			coeff_2_2_ch3_r_in = 32'd0; 
			coeff_2_1_ch3_r_in = 32'd0; 
			coeff_2_0_ch3_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = 32'd0;
			coeff_1_9_ch3_r_in = 32'd0; 
			coeff_1_8_ch3_r_in = 32'd0; 
			coeff_1_7_ch3_r_in = 32'd0; 
			coeff_1_6_ch3_r_in = 32'd0; 
			coeff_1_5_ch3_r_in = 32'd0; 
			coeff_1_4_ch3_r_in = 32'd0; 
			coeff_1_3_ch3_r_in = 32'd0; 
			coeff_1_2_ch3_r_in = 32'd0; 
			coeff_1_1_ch3_r_in = 32'd0; 
			coeff_1_0_ch3_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = 20'd0;
			
			//Channel 4
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = 32'd0; 
			recip_stdev_3_ch4_r_in = 32'd0; 
			recip_stdev_2_ch4_r_in = 32'd0; 
			recip_stdev_1_ch4_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = 32'd0;
			neg_mean_3_ch4_r_in = 32'd0; 
			neg_mean_2_ch4_r_in = 32'd0; 
			neg_mean_1_ch4_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = 32'd0;
			coeff_4_9_ch4_r_in = 32'd0;
			coeff_4_8_ch4_r_in = 32'd0; 
			coeff_4_7_ch4_r_in = 32'd0; 
			coeff_4_6_ch4_r_in = 32'd0; 
			coeff_4_5_ch4_r_in = 32'd0; 
			coeff_4_4_ch4_r_in = 32'd0; 
			coeff_4_3_ch4_r_in = 32'd0; 
			coeff_4_2_ch4_r_in = 32'd0; 
			coeff_4_1_ch4_r_in = 32'd0; 
			coeff_4_0_ch4_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = 32'd0; 
			coeff_3_9_ch4_r_in = 32'd0; 
			coeff_3_8_ch4_r_in = 32'd0; 
			coeff_3_7_ch4_r_in = 32'd0; 
			coeff_3_6_ch4_r_in = 32'd0; 
			coeff_3_5_ch4_r_in = 32'd0; 
			coeff_3_4_ch4_r_in = 32'd0; 
			coeff_3_3_ch4_r_in = 32'd0; 
			coeff_3_2_ch4_r_in = 32'd0; 
			coeff_3_1_ch4_r_in = 32'd0; 
			coeff_3_0_ch4_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = 32'd0; 
			coeff_2_9_ch4_r_in = 32'd0; 
			coeff_2_8_ch4_r_in = 32'd0; 
			coeff_2_7_ch4_r_in = 32'd0; 
			coeff_2_6_ch4_r_in = 32'd0; 
			coeff_2_5_ch4_r_in = 32'd0; 
			coeff_2_4_ch4_r_in = 32'd0; 
			coeff_2_3_ch4_r_in = 32'd0; 
			coeff_2_2_ch4_r_in = 32'd0; 
			coeff_2_1_ch4_r_in = 32'd0; 
			coeff_2_0_ch4_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = 32'd0;
			coeff_1_9_ch4_r_in = 32'd0; 
			coeff_1_8_ch4_r_in = 32'd0; 
			coeff_1_7_ch4_r_in = 32'd0; 
			coeff_1_6_ch4_r_in = 32'd0; 
			coeff_1_5_ch4_r_in = 32'd0; 
			coeff_1_4_ch4_r_in = 32'd0; 
			coeff_1_3_ch4_r_in = 32'd0; 
			coeff_1_2_ch4_r_in = 32'd0; 
			coeff_1_1_ch4_r_in = 32'd0; 
			coeff_1_0_ch4_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = 20'd0;
			
			//Channel 5
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = 32'd0; 
			recip_stdev_3_ch5_r_in = 32'd0; 
			recip_stdev_2_ch5_r_in = 32'd0; 
			recip_stdev_1_ch5_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = 32'd0;
			neg_mean_3_ch5_r_in = 32'd0; 
			neg_mean_2_ch5_r_in = 32'd0; 
			neg_mean_1_ch5_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = 32'd0;
			coeff_4_9_ch5_r_in = 32'd0;
			coeff_4_8_ch5_r_in = 32'd0; 
			coeff_4_7_ch5_r_in = 32'd0; 
			coeff_4_6_ch5_r_in = 32'd0; 
			coeff_4_5_ch5_r_in = 32'd0; 
			coeff_4_4_ch5_r_in = 32'd0; 
			coeff_4_3_ch5_r_in = 32'd0; 
			coeff_4_2_ch5_r_in = 32'd0; 
			coeff_4_1_ch5_r_in = 32'd0; 
			coeff_4_0_ch5_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = 32'd0; 
			coeff_3_9_ch5_r_in = 32'd0; 
			coeff_3_8_ch5_r_in = 32'd0; 
			coeff_3_7_ch5_r_in = 32'd0; 
			coeff_3_6_ch5_r_in = 32'd0; 
			coeff_3_5_ch5_r_in = 32'd0; 
			coeff_3_4_ch5_r_in = 32'd0; 
			coeff_3_3_ch5_r_in = 32'd0; 
			coeff_3_2_ch5_r_in = 32'd0; 
			coeff_3_1_ch5_r_in = 32'd0; 
			coeff_3_0_ch5_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = 32'd0; 
			coeff_2_9_ch5_r_in = 32'd0; 
			coeff_2_8_ch5_r_in = 32'd0; 
			coeff_2_7_ch5_r_in = 32'd0; 
			coeff_2_6_ch5_r_in = 32'd0; 
			coeff_2_5_ch5_r_in = 32'd0; 
			coeff_2_4_ch5_r_in = 32'd0; 
			coeff_2_3_ch5_r_in = 32'd0; 
			coeff_2_2_ch5_r_in = 32'd0; 
			coeff_2_1_ch5_r_in = 32'd0; 
			coeff_2_0_ch5_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = 32'd0;
			coeff_1_9_ch5_r_in = 32'd0; 
			coeff_1_8_ch5_r_in = 32'd0; 
			coeff_1_7_ch5_r_in = 32'd0; 
			coeff_1_6_ch5_r_in = 32'd0; 
			coeff_1_5_ch5_r_in = 32'd0; 
			coeff_1_4_ch5_r_in = 32'd0; 
			coeff_1_3_ch5_r_in = 32'd0; 
			coeff_1_2_ch5_r_in = 32'd0; 
			coeff_1_1_ch5_r_in = 32'd0; 
			coeff_1_0_ch5_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = 20'd0;
			
			//Channel 6
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = 32'd0; 
			recip_stdev_3_ch6_r_in = 32'd0; 
			recip_stdev_2_ch6_r_in = 32'd0; 
			recip_stdev_1_ch6_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = 32'd0;
			neg_mean_3_ch6_r_in = 32'd0; 
			neg_mean_2_ch6_r_in = 32'd0; 
			neg_mean_1_ch6_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = 32'd0;
			coeff_4_9_ch6_r_in = 32'd0;
			coeff_4_8_ch6_r_in = 32'd0; 
			coeff_4_7_ch6_r_in = 32'd0; 
			coeff_4_6_ch6_r_in = 32'd0; 
			coeff_4_5_ch6_r_in = 32'd0; 
			coeff_4_4_ch6_r_in = 32'd0; 
			coeff_4_3_ch6_r_in = 32'd0; 
			coeff_4_2_ch6_r_in = 32'd0; 
			coeff_4_1_ch6_r_in = 32'd0; 
			coeff_4_0_ch6_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = 32'd0; 
			coeff_3_9_ch6_r_in = 32'd0; 
			coeff_3_8_ch6_r_in = 32'd0; 
			coeff_3_7_ch6_r_in = 32'd0; 
			coeff_3_6_ch6_r_in = 32'd0; 
			coeff_3_5_ch6_r_in = 32'd0; 
			coeff_3_4_ch6_r_in = 32'd0; 
			coeff_3_3_ch6_r_in = 32'd0; 
			coeff_3_2_ch6_r_in = 32'd0; 
			coeff_3_1_ch6_r_in = 32'd0; 
			coeff_3_0_ch6_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = 32'd0; 
			coeff_2_9_ch6_r_in = 32'd0; 
			coeff_2_8_ch6_r_in = 32'd0; 
			coeff_2_7_ch6_r_in = 32'd0; 
			coeff_2_6_ch6_r_in = 32'd0; 
			coeff_2_5_ch6_r_in = 32'd0; 
			coeff_2_4_ch6_r_in = 32'd0; 
			coeff_2_3_ch6_r_in = 32'd0; 
			coeff_2_2_ch6_r_in = 32'd0; 
			coeff_2_1_ch6_r_in = 32'd0; 
			coeff_2_0_ch6_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = 32'd0;
			coeff_1_9_ch6_r_in = 32'd0; 
			coeff_1_8_ch6_r_in = 32'd0; 
			coeff_1_7_ch6_r_in = 32'd0; 
			coeff_1_6_ch6_r_in = 32'd0; 
			coeff_1_5_ch6_r_in = 32'd0; 
			coeff_1_4_ch6_r_in = 32'd0; 
			coeff_1_3_ch6_r_in = 32'd0; 
			coeff_1_2_ch6_r_in = 32'd0; 
			coeff_1_1_ch6_r_in = 32'd0; 
			coeff_1_0_ch6_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = 20'd0;
			
			//Channel 7
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = 32'd0; 
			recip_stdev_3_ch7_r_in = 32'd0; 
			recip_stdev_2_ch7_r_in = 32'd0; 
			recip_stdev_1_ch7_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = 32'd0;
			neg_mean_3_ch7_r_in = 32'd0; 
			neg_mean_2_ch7_r_in = 32'd0; 
			neg_mean_1_ch7_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = 32'd0;
			coeff_4_9_ch7_r_in = 32'd0;
			coeff_4_8_ch7_r_in = 32'd0; 
			coeff_4_7_ch7_r_in = 32'd0; 
			coeff_4_6_ch7_r_in = 32'd0; 
			coeff_4_5_ch7_r_in = 32'd0; 
			coeff_4_4_ch7_r_in = 32'd0; 
			coeff_4_3_ch7_r_in = 32'd0; 
			coeff_4_2_ch7_r_in = 32'd0; 
			coeff_4_1_ch7_r_in = 32'd0; 
			coeff_4_0_ch7_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = 32'd0; 
			coeff_3_9_ch7_r_in = 32'd0; 
			coeff_3_8_ch7_r_in = 32'd0; 
			coeff_3_7_ch7_r_in = 32'd0; 
			coeff_3_6_ch7_r_in = 32'd0; 
			coeff_3_5_ch7_r_in = 32'd0; 
			coeff_3_4_ch7_r_in = 32'd0; 
			coeff_3_3_ch7_r_in = 32'd0; 
			coeff_3_2_ch7_r_in = 32'd0; 
			coeff_3_1_ch7_r_in = 32'd0; 
			coeff_3_0_ch7_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = 32'd0; 
			coeff_2_9_ch7_r_in = 32'd0; 
			coeff_2_8_ch7_r_in = 32'd0; 
			coeff_2_7_ch7_r_in = 32'd0; 
			coeff_2_6_ch7_r_in = 32'd0; 
			coeff_2_5_ch7_r_in = 32'd0; 
			coeff_2_4_ch7_r_in = 32'd0; 
			coeff_2_3_ch7_r_in = 32'd0; 
			coeff_2_2_ch7_r_in = 32'd0; 
			coeff_2_1_ch7_r_in = 32'd0; 
			coeff_2_0_ch7_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = 32'd0;
			coeff_1_9_ch7_r_in = 32'd0; 
			coeff_1_8_ch7_r_in = 32'd0; 
			coeff_1_7_ch7_r_in = 32'd0; 
			coeff_1_6_ch7_r_in = 32'd0; 
			coeff_1_5_ch7_r_in = 32'd0; 
			coeff_1_4_ch7_r_in = 32'd0; 
			coeff_1_3_ch7_r_in = 32'd0; 
			coeff_1_2_ch7_r_in = 32'd0; 
			coeff_1_1_ch7_r_in = 32'd0; 
			coeff_1_0_ch7_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = 20'd0;
			
			//Channel 8
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = 32'd0; 
			recip_stdev_3_ch8_r_in = 32'd0; 
			recip_stdev_2_ch8_r_in = 32'd0; 
			recip_stdev_1_ch8_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = 32'd0;
			neg_mean_3_ch8_r_in = 32'd0; 
			neg_mean_2_ch8_r_in = 32'd0; 
			neg_mean_1_ch8_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = 32'd0;
			coeff_4_9_ch8_r_in = 32'd0;
			coeff_4_8_ch8_r_in = 32'd0; 
			coeff_4_7_ch8_r_in = 32'd0; 
			coeff_4_6_ch8_r_in = 32'd0; 
			coeff_4_5_ch8_r_in = 32'd0; 
			coeff_4_4_ch8_r_in = 32'd0; 
			coeff_4_3_ch8_r_in = 32'd0; 
			coeff_4_2_ch8_r_in = 32'd0; 
			coeff_4_1_ch8_r_in = 32'd0; 
			coeff_4_0_ch8_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = 32'd0; 
			coeff_3_9_ch8_r_in = 32'd0; 
			coeff_3_8_ch8_r_in = 32'd0; 
			coeff_3_7_ch8_r_in = 32'd0; 
			coeff_3_6_ch8_r_in = 32'd0; 
			coeff_3_5_ch8_r_in = 32'd0; 
			coeff_3_4_ch8_r_in = 32'd0; 
			coeff_3_3_ch8_r_in = 32'd0; 
			coeff_3_2_ch8_r_in = 32'd0; 
			coeff_3_1_ch8_r_in = 32'd0; 
			coeff_3_0_ch8_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = 32'd0; 
			coeff_2_9_ch8_r_in = 32'd0; 
			coeff_2_8_ch8_r_in = 32'd0; 
			coeff_2_7_ch8_r_in = 32'd0; 
			coeff_2_6_ch8_r_in = 32'd0; 
			coeff_2_5_ch8_r_in = 32'd0; 
			coeff_2_4_ch8_r_in = 32'd0; 
			coeff_2_3_ch8_r_in = 32'd0; 
			coeff_2_2_ch8_r_in = 32'd0; 
			coeff_2_1_ch8_r_in = 32'd0; 
			coeff_2_0_ch8_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = 32'd0;
			coeff_1_9_ch8_r_in = 32'd0; 
			coeff_1_8_ch8_r_in = 32'd0; 
			coeff_1_7_ch8_r_in = 32'd0; 
			coeff_1_6_ch8_r_in = 32'd0; 
			coeff_1_5_ch8_r_in = 32'd0; 
			coeff_1_4_ch8_r_in = 32'd0; 
			coeff_1_3_ch8_r_in = 32'd0; 
			coeff_1_2_ch8_r_in = 32'd0; 
			coeff_1_1_ch8_r_in = 32'd0; 
			coeff_1_0_ch8_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = 20'd0;

			//Channel input valid
			srdyi_1_r = 1'b0;
			srdyi_2_r = 1'b0;
			srdyi_3_r = 1'b0;
			srdyi_4_r = 1'b0;
			srdyi_5_r = 1'b0;
			srdyi_6_r = 1'b0;
			srdyi_7_r = 1'b0;
			srdyi_8_r = 1'b0;
			
			//Channel inputs
			x_adc_ch1_in_r = 21'd0;
			x_adc_ch2_in_r = 21'd0;
			x_adc_ch3_in_r = 21'd0;
			x_adc_ch4_in_r = 21'd0;
			x_adc_ch5_in_r = 21'd0;
			x_adc_ch6_in_r = 21'd0;
			x_adc_ch7_in_r = 21'd0;
			x_adc_ch8_in_r = 21'd0;
			
			if(srdyi == 1'b1)
				in_enable_r = 1'b1;
			else
				in_enable_r = in_enable_w;
			if(in_enable_r == 1'b1) begin
				next_state = S1;
			end
			else begin
				next_state = S0;
			end
		end
		S1: begin
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
		
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			next_state = S2;
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch1_r;
			
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch1; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch1; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch1; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch1; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch1;
			neg_mean_3_ch1_r_in = neg_mean_3_ch1; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch1; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch1; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch1;
			coeff_4_9_ch1_r_in = coeff_4_9_ch1;
			coeff_4_8_ch1_r_in = coeff_4_8_ch1; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch1; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch1; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch1; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch1; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch1; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch1; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch1; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch1; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch1; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch1; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch1; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch1; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch1; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch1; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch1; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch1; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch1; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch1; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch1; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch1; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch1; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch1; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch1; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch1; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch1; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch1; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch1; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch1; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch1; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch1; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch1;
			coeff_1_9_ch1_r_in = coeff_1_9_ch1; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch1; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch1; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch1; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch1; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch1; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch1; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch1; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch1; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch1;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch1;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch2_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch2; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch2; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch2; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch2; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch2;
			neg_mean_3_ch2_r_in = neg_mean_3_ch2; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch2; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch2; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch2;
			coeff_4_9_ch2_r_in = coeff_4_9_ch2;
			coeff_4_8_ch2_r_in = coeff_4_8_ch2; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch2; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch2; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch2; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch2; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch2; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch2; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch2; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch2; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch2; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch2; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch2; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch2; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch2; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch2; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch2; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch2; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch2; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch2; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch2; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch2; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch2; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch2; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch2; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch2; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch2; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch2; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch2; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch2; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch2; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch2; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch2;
			coeff_1_9_ch2_r_in = coeff_1_9_ch2; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch2; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch2; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch2; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch2; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch2; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch2; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch2; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch2; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch2;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch2;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch3_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch3; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch3; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch3; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch3; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch3;
			neg_mean_3_ch3_r_in = neg_mean_3_ch3; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch3; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch3; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch3;
			coeff_4_9_ch3_r_in = coeff_4_9_ch3;
			coeff_4_8_ch3_r_in = coeff_4_8_ch3; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch3; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch3; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch3; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch3; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch3; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch3; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch3; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch3; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch3; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch3; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch3; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch3; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch3; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch3; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch3; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch3; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch3; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch3; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch3; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch3; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch3; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch3; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch3; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch3; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch3; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch3; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch3; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch3; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch3; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch3; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch3;
			coeff_1_9_ch3_r_in = coeff_1_9_ch3; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch3; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch3; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch3; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch3; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch3; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch3; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch3; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch3; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch3;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch3;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch4_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch4; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch4; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch4; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch4; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch4;
			neg_mean_3_ch4_r_in = neg_mean_3_ch4; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch4; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch4; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch4;
			coeff_4_9_ch4_r_in = coeff_4_9_ch4;
			coeff_4_8_ch4_r_in = coeff_4_8_ch4; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch4; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch4; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch4; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch4; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch4; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch4; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch4; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch4; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch4; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch4; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch4; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch4; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch4; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch4; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch4; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch4; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch4; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch4; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch4; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch4; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch4; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch4; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch4; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch4; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch4; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch4; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch4; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch4; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch4; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch4; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch4;
			coeff_1_9_ch4_r_in = coeff_1_9_ch4; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch4; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch4; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch4; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch4; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch4; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch4; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch4; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch4; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch4;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch4;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch5_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch5; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch5; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch5; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch5; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch5;
			neg_mean_3_ch5_r_in = neg_mean_3_ch5; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch5; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch5; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch5;
			coeff_4_9_ch5_r_in = coeff_4_9_ch5;
			coeff_4_8_ch5_r_in = coeff_4_8_ch5; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch5; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch5; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch5; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch5; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch5; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch5; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch5; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch5; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch5; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch5; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch5; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch5; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch5; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch5; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch5; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch5; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch5; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch5; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch5; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch5; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch5; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch5; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch5; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch5; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch5; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch5; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch5; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch5; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch5; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch5; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch5;
			coeff_1_9_ch5_r_in = coeff_1_9_ch5; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch5; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch5; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch5; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch5; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch5; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch5; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch5; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch5; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch5;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch5;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch6_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch6; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch6; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch6; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch6; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch6;
			neg_mean_3_ch6_r_in = neg_mean_3_ch6; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch6; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch6; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch6;
			coeff_4_9_ch6_r_in = coeff_4_9_ch6;
			coeff_4_8_ch6_r_in = coeff_4_8_ch6; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch6; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch6; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch6; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch6; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch6; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch6; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch6; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch6; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch6; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch6; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch6; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch6; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch6; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch6; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch6; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch6; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch6; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch6; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch6; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch6; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch6; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch6; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch6; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch6; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch6; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch6; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch6; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch6; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch6; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch6; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch6;
			coeff_1_9_ch6_r_in = coeff_1_9_ch6; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch6; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch6; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch6; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch6; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch6; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch6; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch6; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch6; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch6;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch6;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch7_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch7; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch7; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch7; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch7; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch7;
			neg_mean_3_ch7_r_in = neg_mean_3_ch7; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch7; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch7; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch7;
			coeff_4_9_ch7_r_in = coeff_4_9_ch7;
			coeff_4_8_ch7_r_in = coeff_4_8_ch7; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch7; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch7; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch7; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch7; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch7; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch7; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch7; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch7; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch7; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch7; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch7; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch7; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch7; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch7; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch7; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch7; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch7; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch7; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch7; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch7; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch7; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch7; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch7; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch7; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch7; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch7; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch7; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch7; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch7; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch7; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch7;
			coeff_1_9_ch7_r_in = coeff_1_9_ch7; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch7; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch7; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch7; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch7; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch7; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch7; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch7; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch7; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch7;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch7;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch8_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch8; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch8; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch8; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch8; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch8;
			neg_mean_3_ch8_r_in = neg_mean_3_ch8; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch8; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch8; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch8;
			coeff_4_9_ch8_r_in = coeff_4_9_ch8;
			coeff_4_8_ch8_r_in = coeff_4_8_ch8; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch8; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch8; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch8; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch8; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch8; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch8; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch8; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch8; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch8; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch8; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch8; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch8; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch8; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch8; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch8; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch8; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch8; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch8; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch8; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch8; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch8; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch8; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch8; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch8; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch8; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch8; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch8; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch8; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch8; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch8; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch8;
			coeff_1_9_ch8_r_in = coeff_1_9_ch8; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch8; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch8; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch8; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch8; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch8; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch8; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch8; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch8; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch8;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch8;
			
			srdyi_1_r = 1'b1;
			srdyi_2_r = 1'b1;
			srdyi_3_r = 1'b1;
			srdyi_4_r = 1'b1;
			srdyi_5_r = 1'b1;
			srdyi_6_r = 1'b1;
			srdyi_7_r = 1'b1;
			srdyi_8_r = 1'b1;
		end
		S2: begin
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			if(srdyo_1_r == 1'b1) begin
				next_state = S3;
				x_lin_ch1_r = x_lin_ch1_out_w;
				x_lin_ch2_r = x_lin_ch2_out_w;
				x_lin_ch3_r = x_lin_ch3_out_w;
				x_lin_ch4_r = x_lin_ch4_out_w;
				x_lin_ch5_r = x_lin_ch5_out_w;
				x_lin_ch6_r = x_lin_ch6_out_w;
				x_lin_ch7_r = x_lin_ch7_out_w;
				x_lin_ch8_r = x_lin_ch8_out_w;
			end
			else begin
				next_state = S2;
				x_lin_ch1_r = 21'd0;
				x_lin_ch2_r = 21'd0;
				x_lin_ch3_r = 21'd0;
				x_lin_ch4_r = 21'd0;
				x_lin_ch5_r = 21'd0;
				x_lin_ch6_r = 21'd0;
				x_lin_ch7_r = 21'd0;
				x_lin_ch8_r = 21'd0;
			end
			
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
			
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch1_r;
			
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch1; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch1; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch1; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch1; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch1;
			neg_mean_3_ch1_r_in = neg_mean_3_ch1; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch1; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch1; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch1;
			coeff_4_9_ch1_r_in = coeff_4_9_ch1;
			coeff_4_8_ch1_r_in = coeff_4_8_ch1; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch1; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch1; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch1; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch1; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch1; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch1; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch1; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch1; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch1; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch1; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch1; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch1; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch1; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch1; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch1; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch1; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch1; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch1; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch1; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch1; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch1; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch1; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch1; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch1; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch1; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch1; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch1; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch1; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch1; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch1; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch1;
			coeff_1_9_ch1_r_in = coeff_1_9_ch1; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch1; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch1; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch1; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch1; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch1; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch1; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch1; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch1; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch1;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch1;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch2_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch2; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch2; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch2; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch2; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch2;
			neg_mean_3_ch2_r_in = neg_mean_3_ch2; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch2; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch2; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch2;
			coeff_4_9_ch2_r_in = coeff_4_9_ch2;
			coeff_4_8_ch2_r_in = coeff_4_8_ch2; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch2; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch2; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch2; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch2; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch2; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch2; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch2; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch2; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch2; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch2; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch2; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch2; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch2; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch2; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch2; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch2; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch2; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch2; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch2; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch2; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch2; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch2; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch2; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch2; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch2; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch2; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch2; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch2; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch2; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch2; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch2;
			coeff_1_9_ch2_r_in = coeff_1_9_ch2; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch2; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch2; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch2; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch2; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch2; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch2; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch2; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch2; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch2;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch2;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch3_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch3; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch3; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch3; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch3; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch3;
			neg_mean_3_ch3_r_in = neg_mean_3_ch3; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch3; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch3; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch3;
			coeff_4_9_ch3_r_in = coeff_4_9_ch3;
			coeff_4_8_ch3_r_in = coeff_4_8_ch3; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch3; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch3; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch3; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch3; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch3; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch3; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch3; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch3; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch3; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch3; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch3; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch3; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch3; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch3; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch3; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch3; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch3; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch3; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch3; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch3; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch3; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch3; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch3; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch3; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch3; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch3; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch3; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch3; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch3; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch3; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch3;
			coeff_1_9_ch3_r_in = coeff_1_9_ch3; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch3; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch3; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch3; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch3; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch3; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch3; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch3; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch3; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch3;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch3;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch4_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch4; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch4; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch4; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch4; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch4;
			neg_mean_3_ch4_r_in = neg_mean_3_ch4; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch4; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch4; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch4;
			coeff_4_9_ch4_r_in = coeff_4_9_ch4;
			coeff_4_8_ch4_r_in = coeff_4_8_ch4; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch4; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch4; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch4; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch4; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch4; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch4; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch4; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch4; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch4; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch4; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch4; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch4; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch4; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch4; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch4; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch4; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch4; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch4; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch4; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch4; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch4; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch4; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch4; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch4; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch4; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch4; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch4; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch4; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch4; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch4; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch4;
			coeff_1_9_ch4_r_in = coeff_1_9_ch4; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch4; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch4; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch4; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch4; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch4; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch4; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch4; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch4; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch4;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch4;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch5_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch5; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch5; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch5; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch5; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch5;
			neg_mean_3_ch5_r_in = neg_mean_3_ch5; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch5; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch5; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch5;
			coeff_4_9_ch5_r_in = coeff_4_9_ch5;
			coeff_4_8_ch5_r_in = coeff_4_8_ch5; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch5; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch5; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch5; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch5; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch5; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch5; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch5; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch5; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch5; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch5; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch5; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch5; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch5; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch5; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch5; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch5; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch5; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch5; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch5; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch5; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch5; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch5; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch5; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch5; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch5; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch5; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch5; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch5; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch5; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch5; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch5;
			coeff_1_9_ch5_r_in = coeff_1_9_ch5; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch5; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch5; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch5; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch5; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch5; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch5; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch5; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch5; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch5;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch5;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch6_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch6; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch6; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch6; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch6; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch6;
			neg_mean_3_ch6_r_in = neg_mean_3_ch6; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch6; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch6; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch6;
			coeff_4_9_ch6_r_in = coeff_4_9_ch6;
			coeff_4_8_ch6_r_in = coeff_4_8_ch6; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch6; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch6; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch6; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch6; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch6; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch6; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch6; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch6; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch6; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch6; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch6; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch6; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch6; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch6; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch6; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch6; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch6; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch6; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch6; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch6; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch6; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch6; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch6; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch6; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch6; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch6; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch6; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch6; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch6; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch6; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch6;
			coeff_1_9_ch6_r_in = coeff_1_9_ch6; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch6; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch6; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch6; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch6; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch6; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch6; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch6; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch6; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch6;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch6;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch7_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch7; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch7; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch7; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch7; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch7;
			neg_mean_3_ch7_r_in = neg_mean_3_ch7; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch7; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch7; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch7;
			coeff_4_9_ch7_r_in = coeff_4_9_ch7;
			coeff_4_8_ch7_r_in = coeff_4_8_ch7; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch7; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch7; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch7; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch7; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch7; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch7; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch7; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch7; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch7; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch7; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch7; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch7; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch7; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch7; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch7; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch7; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch7; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch7; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch7; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch7; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch7; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch7; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch7; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch7; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch7; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch7; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch7; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch7; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch7; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch7; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch7;
			coeff_1_9_ch7_r_in = coeff_1_9_ch7; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch7; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch7; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch7; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch7; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch7; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch7; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch7; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch7; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch7;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch7;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch8_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch8; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch8; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch8; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch8; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch8;
			neg_mean_3_ch8_r_in = neg_mean_3_ch8; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch8; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch8; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch8;
			coeff_4_9_ch8_r_in = coeff_4_9_ch8;
			coeff_4_8_ch8_r_in = coeff_4_8_ch8; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch8; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch8; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch8; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch8; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch8; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch8; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch8; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch8; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch8; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch8; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch8; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch8; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch8; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch8; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch8; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch8; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch8; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch8; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch8; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch8; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch8; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch8; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch8; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch8; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch8; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch8; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch8; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch8; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch8; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch8; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch8;
			coeff_1_9_ch8_r_in = coeff_1_9_ch8; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch8; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch8; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch8; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch8; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch8; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch8; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch8; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch8; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch8;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch8;
			
			srdyi_1_r = 1'b0;
			srdyi_2_r = 1'b0;
			srdyi_3_r = 1'b0;
			srdyi_4_r = 1'b0;
			srdyi_5_r = 1'b0;
			srdyi_6_r = 1'b0;
			srdyi_7_r = 1'b0;
			srdyi_8_r = 1'b0;
		end
		S3: begin
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
			
			next_state = S4;
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch9_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch9; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch9; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch9; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch9; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch9;
			neg_mean_3_ch1_r_in = neg_mean_3_ch9; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch9; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch9; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch9;
			coeff_4_9_ch1_r_in = coeff_4_9_ch9;
			coeff_4_8_ch1_r_in = coeff_4_8_ch9; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch9; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch9; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch9; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch9; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch9; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch9; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch9; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch9; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch9; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch9; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch9; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch9; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch9; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch9; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch9; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch9; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch9; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch9; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch9; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch9; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch9; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch9; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch9; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch9; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch9; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch9; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch9; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch9; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch9; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch9; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch9;
			coeff_1_9_ch1_r_in = coeff_1_9_ch9; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch9; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch9; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch9; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch9; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch9; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch9; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch9; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch9; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch9;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch9;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch10_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch10; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch10; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch10; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch10; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch10;
			neg_mean_3_ch2_r_in = neg_mean_3_ch10; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch10; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch10; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch10;
			coeff_4_9_ch2_r_in = coeff_4_9_ch10;
			coeff_4_8_ch2_r_in = coeff_4_8_ch10; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch10; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch10; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch10; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch10; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch10; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch10; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch10; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch10; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch10; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch10; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch10; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch10; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch10; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch10; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch10; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch10; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch10; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch10; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch10; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch10; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch10; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch10; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch10; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch10; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch10; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch10; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch10; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch10; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch10; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch10; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch10;
			coeff_1_9_ch2_r_in = coeff_1_9_ch10; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch10; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch10; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch10; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch10; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch10; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch10; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch10; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch10; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch10;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch10;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch11_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch11; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch11; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch11; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch11; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch11;
			neg_mean_3_ch3_r_in = neg_mean_3_ch11; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch11; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch11; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch11;
			coeff_4_9_ch3_r_in = coeff_4_9_ch11;
			coeff_4_8_ch3_r_in = coeff_4_8_ch11; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch11; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch11; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch11; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch11; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch11; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch11; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch11; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch11; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch11; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch11; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch11; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch11; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch11; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch11; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch11; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch11; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch11; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch11; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch11; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch11; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch11; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch11; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch11; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch11; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch11; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch11; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch11; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch11; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch11; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch11; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch11;
			coeff_1_9_ch3_r_in = coeff_1_9_ch11; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch11; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch11; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch11; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch11; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch11; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch11; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch11; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch11; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch11;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch11;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch12_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch12; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch12; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch12; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch12; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch12;
			neg_mean_3_ch4_r_in = neg_mean_3_ch12; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch12; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch12; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch12;
			coeff_4_9_ch4_r_in = coeff_4_9_ch12;
			coeff_4_8_ch4_r_in = coeff_4_8_ch12; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch12; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch12; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch12; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch12; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch12; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch12; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch12; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch12; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch12; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch12; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch12; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch12; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch12; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch12; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch12; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch12; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch12; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch12; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch12; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch12; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch12; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch12; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch12; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch12; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch12; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch12; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch12; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch12; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch12; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch12; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch12;
			coeff_1_9_ch4_r_in = coeff_1_9_ch12; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch12; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch12; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch12; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch12; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch12; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch12; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch12; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch12; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch12;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch12;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch13_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch13; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch13; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch13; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch13; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch13;
			neg_mean_3_ch5_r_in = neg_mean_3_ch13; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch13; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch13; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch13;
			coeff_4_9_ch5_r_in = coeff_4_9_ch13;
			coeff_4_8_ch5_r_in = coeff_4_8_ch13; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch13; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch13; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch13; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch13; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch13; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch13; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch13; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch13; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch13; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch13; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch13; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch13; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch13; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch13; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch13; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch13; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch13; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch13; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch13; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch13; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch13; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch13; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch13; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch13; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch13; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch13; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch13; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch13; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch13; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch13; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch13;
			coeff_1_9_ch5_r_in = coeff_1_9_ch13; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch13; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch13; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch13; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch13; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch13; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch13; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch13; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch13; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch13;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch13;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch14_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch14; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch14; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch14; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch14; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch14;
			neg_mean_3_ch6_r_in = neg_mean_3_ch14; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch14; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch14; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch14;
			coeff_4_9_ch6_r_in = coeff_4_9_ch14;
			coeff_4_8_ch6_r_in = coeff_4_8_ch14; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch14; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch14; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch14; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch14; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch14; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch14; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch14; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch14; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch14; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch14; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch14; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch14; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch14; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch14; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch14; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch14; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch14; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch14; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch14; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch14; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch14; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch14; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch14; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch14; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch14; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch14; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch14; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch14; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch14; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch14; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch14;
			coeff_1_9_ch6_r_in = coeff_1_9_ch14; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch14; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch14; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch14; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch14; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch14; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch14; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch14; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch14; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch14;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch14;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch15_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch15; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch15; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch15; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch15; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch15;
			neg_mean_3_ch7_r_in = neg_mean_3_ch15; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch15; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch15; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch15;
			coeff_4_9_ch7_r_in = coeff_4_9_ch15;
			coeff_4_8_ch7_r_in = coeff_4_8_ch15; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch15; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch15; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch15; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch15; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch15; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch15; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch15; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch15; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch15; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch15; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch15; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch15; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch15; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch15; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch15; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch15; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch15; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch15; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch15; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch15; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch15; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch15; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch15; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch15; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch15; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch15; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch15; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch15; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch15; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch15; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch15;
			coeff_1_9_ch7_r_in = coeff_1_9_ch15; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch15; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch15; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch15; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch15; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch15; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch15; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch15; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch15; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch15;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch15;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch16_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch16; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch16; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch16; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch16; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch16;
			neg_mean_3_ch8_r_in = neg_mean_3_ch16; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch16; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch16; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch16;
			coeff_4_9_ch8_r_in = coeff_4_9_ch16;
			coeff_4_8_ch8_r_in = coeff_4_8_ch16; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch16; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch16; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch16; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch16; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch16; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch16; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch16; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch16; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch16; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch16; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch16; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch16; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch16; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch16; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch16; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch16; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch16; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch16; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch16; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch16; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch16; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch16; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch16; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch16; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch16; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch16; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch16; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch16; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch16; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch16; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch16;
			coeff_1_9_ch8_r_in = coeff_1_9_ch16; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch16; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch16; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch16; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch16; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch16; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch16; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch16; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch16; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch16;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch16;
			
			srdyi_1_r = 1'b1;
			srdyi_2_r = 1'b1;
			srdyi_3_r = 1'b1;
			srdyi_4_r = 1'b1;
			srdyi_5_r = 1'b1;
			srdyi_6_r = 1'b1;
			srdyi_7_r = 1'b1;
			srdyi_8_r = 1'b1;
		end
		S4: begin
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			if(srdyo_1_r == 1'b1) begin
				next_state = S5;
				x_lin_ch9_r = x_lin_ch1_out_w;
				x_lin_ch10_r = x_lin_ch2_out_w;
				x_lin_ch11_r = x_lin_ch3_out_w;
				x_lin_ch12_r = x_lin_ch4_out_w;
				x_lin_ch13_r = x_lin_ch5_out_w;
				x_lin_ch14_r = x_lin_ch6_out_w;
				x_lin_ch15_r = x_lin_ch7_out_w;
				x_lin_ch16_r = x_lin_ch8_out_w;
			end
			else begin
				next_state = S4;
				x_lin_ch9_r = 21'd0;
				x_lin_ch10_r = 21'd0;
				x_lin_ch11_r = 21'd0;
				x_lin_ch12_r = 21'd0;
				x_lin_ch13_r = 21'd0;
				x_lin_ch14_r = 21'd0;
				x_lin_ch15_r = 21'd0;
				x_lin_ch16_r = 21'd0;
			end
			
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
			
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch9_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch9; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch9; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch9; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch9; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch9;
			neg_mean_3_ch1_r_in = neg_mean_3_ch9; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch9; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch9; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch9;
			coeff_4_9_ch1_r_in = coeff_4_9_ch9;
			coeff_4_8_ch1_r_in = coeff_4_8_ch9; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch9; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch9; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch9; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch9; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch9; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch9; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch9; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch9; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch9; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch9; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch9; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch9; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch9; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch9; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch9; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch9; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch9; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch9; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch9; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch9; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch9; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch9; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch9; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch9; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch9; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch9; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch9; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch9; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch9; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch9; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch9;
			coeff_1_9_ch1_r_in = coeff_1_9_ch9; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch9; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch9; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch9; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch9; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch9; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch9; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch9; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch9; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch9;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch9;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch10;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch10; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch10; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch10; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch10; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch10;
			neg_mean_3_ch2_r_in = neg_mean_3_ch10; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch10; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch10; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch10;
			coeff_4_9_ch2_r_in = coeff_4_9_ch10;
			coeff_4_8_ch2_r_in = coeff_4_8_ch10; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch10; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch10; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch10; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch10; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch10; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch10; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch10; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch10; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch10; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch10; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch10; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch10; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch10; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch10; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch10; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch10; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch10; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch10; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch10; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch10; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch10; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch10; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch10; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch10; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch10; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch10; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch10; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch10; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch10; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch10; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch10;
			coeff_1_9_ch2_r_in = coeff_1_9_ch10; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch10; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch10; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch10; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch10; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch10; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch10; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch10; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch10; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch10;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch10;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch11_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch11; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch11; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch11; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch11; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch11;
			neg_mean_3_ch3_r_in = neg_mean_3_ch11; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch11; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch11; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch11;
			coeff_4_9_ch3_r_in = coeff_4_9_ch11;
			coeff_4_8_ch3_r_in = coeff_4_8_ch11; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch11; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch11; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch11; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch11; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch11; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch11; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch11; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch11; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch11; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch11; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch11; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch11; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch11; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch11; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch11; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch11; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch11; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch11; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch11; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch11; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch11; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch11; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch11; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch11; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch11; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch11; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch11; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch11; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch11; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch11; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch11;
			coeff_1_9_ch3_r_in = coeff_1_9_ch11; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch11; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch11; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch11; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch11; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch11; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch11; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch11; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch11; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch11;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch11;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch12_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch12; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch12; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch12; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch12; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch12;
			neg_mean_3_ch4_r_in = neg_mean_3_ch12; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch12; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch12; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch12;
			coeff_4_9_ch4_r_in = coeff_4_9_ch12;
			coeff_4_8_ch4_r_in = coeff_4_8_ch12; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch12; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch12; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch12; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch12; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch12; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch12; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch12; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch12; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch12; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch12; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch12; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch12; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch12; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch12; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch12; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch12; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch12; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch12; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch12; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch12; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch12; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch12; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch12; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch12; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch12; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch12; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch12; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch12; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch12; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch12; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch12;
			coeff_1_9_ch4_r_in = coeff_1_9_ch12; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch12; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch12; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch12; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch12; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch12; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch12; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch12; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch12; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch12;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch12;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch13_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch13; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch13; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch13; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch13; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch13;
			neg_mean_3_ch5_r_in = neg_mean_3_ch13; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch13; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch13; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch13;
			coeff_4_9_ch5_r_in = coeff_4_9_ch13;
			coeff_4_8_ch5_r_in = coeff_4_8_ch13; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch13; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch13; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch13; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch13; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch13; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch13; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch13; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch13; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch13; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch13; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch13; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch13; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch13; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch13; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch13; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch13; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch13; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch13; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch13; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch13; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch13; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch13; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch13; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch13; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch13; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch13; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch13; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch13; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch13; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch13; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch13;
			coeff_1_9_ch5_r_in = coeff_1_9_ch13; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch13; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch13; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch13; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch13; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch13; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch13; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch13; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch13; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch13;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch13;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch14_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch14; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch14; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch14; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch14; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch14;
			neg_mean_3_ch6_r_in = neg_mean_3_ch14; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch14; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch14; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch14;
			coeff_4_9_ch6_r_in = coeff_4_9_ch14;
			coeff_4_8_ch6_r_in = coeff_4_8_ch14; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch14; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch14; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch14; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch14; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch14; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch14; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch14; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch14; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch14; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch14; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch14; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch14; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch14; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch14; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch14; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch14; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch14; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch14; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch14; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch14; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch14; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch14; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch14; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch14; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch14; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch14; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch14; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch14; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch14; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch14; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch14;
			coeff_1_9_ch6_r_in = coeff_1_9_ch14; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch14; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch14; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch14; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch14; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch14; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch14; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch14; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch14; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch14;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch14;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch15_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch15; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch15; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch15; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch15; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch15;
			neg_mean_3_ch7_r_in = neg_mean_3_ch15; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch15; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch15; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch15;
			coeff_4_9_ch7_r_in = coeff_4_9_ch15;
			coeff_4_8_ch7_r_in = coeff_4_8_ch15; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch15; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch15; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch15; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch15; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch15; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch15; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch15; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch15; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch15; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch15; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch15; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch15; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch15; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch15; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch15; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch15; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch15; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch15; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch15; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch15; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch15; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch15; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch15; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch15; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch15; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch15; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch15; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch15; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch15; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch15; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch15;
			coeff_1_9_ch7_r_in = coeff_1_9_ch15; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch15; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch15; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch15; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch15; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch15; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch15; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch15; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch15; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch15;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch15;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch16_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch16; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch16; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch16; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch16; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch16;
			neg_mean_3_ch8_r_in = neg_mean_3_ch16; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch16; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch16; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch16;
			coeff_4_9_ch8_r_in = coeff_4_9_ch16;
			coeff_4_8_ch8_r_in = coeff_4_8_ch16; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch16; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch16; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch16; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch16; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch16; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch16; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch16; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch16; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch16; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch16; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch16; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch16; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch16; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch16; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch16; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch16; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch16; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch16; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch16; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch16; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch16; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch16; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch16; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch16; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch16; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch16; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch16; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch16; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch16; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch16; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch16;
			coeff_1_9_ch8_r_in = coeff_1_9_ch16; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch16; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch16; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch16; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch16; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch16; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch16; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch16; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch16; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch16;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch16;
			
			srdyi_1_r = 1'b0;
			srdyi_2_r = 1'b0;
			srdyi_3_r = 1'b0;
			srdyi_4_r = 1'b0;
			srdyi_5_r = 1'b0;
			srdyi_6_r = 1'b0;
			srdyi_7_r = 1'b0;
			srdyi_8_r = 1'b0;
		end
		S5: begin
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
		
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
		
			next_state = S6;
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch17_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch17; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch17; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch17; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch17; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch17;
			neg_mean_3_ch1_r_in = neg_mean_3_ch17; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch17; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch17; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch17;
			coeff_4_9_ch1_r_in = coeff_4_9_ch17;
			coeff_4_8_ch1_r_in = coeff_4_8_ch17; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch17; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch17; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch17; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch17; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch17; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch17; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch17; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch17; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch17; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch17; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch17; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch17; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch17; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch17; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch17; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch17; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch17; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch17; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch17; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch17; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch17; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch17; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch17; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch17; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch17; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch17; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch17; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch17; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch17; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch17; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch17;
			coeff_1_9_ch1_r_in = coeff_1_9_ch17; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch17; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch17; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch17; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch17; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch17; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch17; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch17; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch17; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch17;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch17;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch18_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch18; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch18; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch18; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch18; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch18;
			neg_mean_3_ch2_r_in = neg_mean_3_ch18; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch18; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch18; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch18;
			coeff_4_9_ch2_r_in = coeff_4_9_ch18;
			coeff_4_8_ch2_r_in = coeff_4_8_ch18; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch18; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch18; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch18; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch18; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch18; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch18; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch18; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch18; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch18; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch18; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch18; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch18; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch18; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch18; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch18; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch18; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch18; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch18; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch18; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch18; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch18; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch18; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch18; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch18; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch18; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch18; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch18; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch18; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch18; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch18; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch18;
			coeff_1_9_ch2_r_in = coeff_1_9_ch18; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch18; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch18; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch18; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch18; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch18; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch18; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch18; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch18; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch18;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch18;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch19_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch19; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch19; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch19; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch19; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch19;
			neg_mean_3_ch3_r_in = neg_mean_3_ch19; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch19; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch19; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch19;
			coeff_4_9_ch3_r_in = coeff_4_9_ch19;
			coeff_4_8_ch3_r_in = coeff_4_8_ch19; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch19; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch19; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch19; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch19; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch19; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch19; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch19; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch19; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch19; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch19; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch19; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch19; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch19; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch19; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch19; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch19; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch19; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch19; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch19; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch19; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch19; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch19; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch19; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch19; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch19; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch19; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch19; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch19; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch19; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch19; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch19;
			coeff_1_9_ch3_r_in = coeff_1_9_ch19; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch19; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch19; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch19; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch19; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch19; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch19; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch19; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch19; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch19;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch19;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch20_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch20; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch20; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch20; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch20; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch20;
			neg_mean_3_ch4_r_in = neg_mean_3_ch20; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch20; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch20; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch20;
			coeff_4_9_ch4_r_in = coeff_4_9_ch20;
			coeff_4_8_ch4_r_in = coeff_4_8_ch20; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch20; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch20; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch20; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch20; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch20; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch20; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch20; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch20; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch20; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch20; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch20; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch20; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch20; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch20; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch20; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch20; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch20; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch20; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch20; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch20; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch20; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch20; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch20; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch20; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch20; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch20; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch20; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch20; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch20; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch20; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch20;
			coeff_1_9_ch4_r_in = coeff_1_9_ch20; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch20; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch20; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch20; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch20; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch20; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch20; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch20; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch20; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch20;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch20;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch21_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch21; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch21; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch21; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch21; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch21;
			neg_mean_3_ch5_r_in = neg_mean_3_ch21; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch21; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch21; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch21;
			coeff_4_9_ch5_r_in = coeff_4_9_ch21;
			coeff_4_8_ch5_r_in = coeff_4_8_ch21; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch21; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch21; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch21; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch21; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch21; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch21; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch21; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch21; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch21; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch21; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch21; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch21; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch21; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch21; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch21; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch21; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch21; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch21; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch21; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch21; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch21; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch21; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch21; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch21; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch21; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch21; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch21; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch21; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch21; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch21; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch21;
			coeff_1_9_ch5_r_in = coeff_1_9_ch21; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch21; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch21; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch21; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch21; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch21; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch21; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch21; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch21; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch21;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch21;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch22_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch22; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch22; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch22; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch22; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch22;
			neg_mean_3_ch6_r_in = neg_mean_3_ch22; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch22; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch22; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch22;
			coeff_4_9_ch6_r_in = coeff_4_9_ch22;
			coeff_4_8_ch6_r_in = coeff_4_8_ch22; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch22; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch22; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch22; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch22; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch22; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch22; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch22; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch22; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch22; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch22; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch22; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch22; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch22; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch22; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch22; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch22; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch22; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch22; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch22; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch22; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch22; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch22; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch22; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch22; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch22; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch22; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch22; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch22; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch22; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch22; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch22;
			coeff_1_9_ch6_r_in = coeff_1_9_ch22; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch22; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch22; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch22; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch22; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch22; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch22; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch22; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch22; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch22;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch22;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch23_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch23; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch23; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch23; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch23; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch23;
			neg_mean_3_ch7_r_in = neg_mean_3_ch23; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch23; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch23; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch23;
			coeff_4_9_ch7_r_in = coeff_4_9_ch23;
			coeff_4_8_ch7_r_in = coeff_4_8_ch23; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch23; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch23; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch23; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch23; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch23; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch23; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch23; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch23; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch23; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch23; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch23; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch23; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch23; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch23; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch23; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch23; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch23; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch23; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch23; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch23; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch23; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch23; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch23; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch23; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch23; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch23; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch23; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch23; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch23; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch23; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch23;
			coeff_1_9_ch7_r_in = coeff_1_9_ch23; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch23; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch23; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch23; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch23; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch23; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch23; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch23; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch23; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch23;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch23;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch24_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch24; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch24; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch24; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch24; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch24;
			neg_mean_3_ch8_r_in = neg_mean_3_ch24; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch24; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch24; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch24;
			coeff_4_9_ch8_r_in = coeff_4_9_ch24;
			coeff_4_8_ch8_r_in = coeff_4_8_ch24; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch24; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch24; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch24; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch24; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch24; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch24; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch24; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch24; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch24; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch24; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch24; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch24; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch24; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch24; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch24; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch24; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch24; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch24; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch24; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch24; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch24; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch24; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch24; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch24; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch24; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch24; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch24; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch24; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch24; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch24; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch24;
			coeff_1_9_ch8_r_in = coeff_1_9_ch24; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch24; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch24; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch24; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch24; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch24; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch24; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch24; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch24; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch24;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch24;
			
			srdyi_1_r = 1'b1;
			srdyi_2_r = 1'b1;
			srdyi_3_r = 1'b1;
			srdyi_4_r = 1'b1;
			srdyi_5_r = 1'b1;
			srdyi_6_r = 1'b1;
			srdyi_7_r = 1'b1;
			srdyi_8_r = 1'b1;
		end
		S6: begin
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			if(srdyo_1_r == 1'b1) begin
				next_state = S7;
				x_lin_ch17_r = x_lin_ch1_out_w;
				x_lin_ch18_r = x_lin_ch2_out_w;
				x_lin_ch19_r = x_lin_ch3_out_w;
				x_lin_ch20_r = x_lin_ch4_out_w;
				x_lin_ch21_r = x_lin_ch5_out_w;
				x_lin_ch22_r = x_lin_ch6_out_w;
				x_lin_ch23_r = x_lin_ch7_out_w;
				x_lin_ch24_r = x_lin_ch8_out_w;
			end
			else begin
				next_state = S6;
				x_lin_ch17_r = 21'd0;
				x_lin_ch18_r = 21'd0;
				x_lin_ch19_r = 21'd0;
				x_lin_ch20_r = 21'd0;
				x_lin_ch21_r = 21'd0;
				x_lin_ch22_r = 21'd0;
				x_lin_ch23_r = 21'd0;
				x_lin_ch24_r = 21'd0;
			end
			
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
			
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch17_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch17; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch17; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch17; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch17; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch17;
			neg_mean_3_ch1_r_in = neg_mean_3_ch17; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch17; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch17; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch17;
			coeff_4_9_ch1_r_in = coeff_4_9_ch17;
			coeff_4_8_ch1_r_in = coeff_4_8_ch17; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch17; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch17; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch17; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch17; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch17; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch17; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch17; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch17; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch17; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch17; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch17; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch17; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch17; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch17; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch17; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch17; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch17; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch17; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch17; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch17; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch17; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch17; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch17; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch17; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch17; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch17; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch17; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch17; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch17; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch17; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch17;
			coeff_1_9_ch1_r_in = coeff_1_9_ch17; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch17; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch17; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch17; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch17; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch17; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch17; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch17; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch17; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch17;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch17;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch18_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch18; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch18; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch18; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch18; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch18;
			neg_mean_3_ch2_r_in = neg_mean_3_ch18; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch18; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch18; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch18;
			coeff_4_9_ch2_r_in = coeff_4_9_ch18;
			coeff_4_8_ch2_r_in = coeff_4_8_ch18; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch18; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch18; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch18; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch18; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch18; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch18; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch18; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch18; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch18; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch18; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch18; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch18; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch18; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch18; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch18; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch18; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch18; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch18; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch18; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch18; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch18; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch18; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch18; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch18; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch18; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch18; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch18; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch18; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch18; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch18; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch18;
			coeff_1_9_ch2_r_in = coeff_1_9_ch18; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch18; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch18; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch18; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch18; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch18; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch18; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch18; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch18; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch18;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch18;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch19_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch19; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch19; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch19; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch19; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch19;
			neg_mean_3_ch3_r_in = neg_mean_3_ch19; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch19; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch19; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch19;
			coeff_4_9_ch3_r_in = coeff_4_9_ch19;
			coeff_4_8_ch3_r_in = coeff_4_8_ch19; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch19; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch19; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch19; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch19; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch19; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch19; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch19; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch19; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch19; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch19; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch19; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch19; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch19; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch19; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch19; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch19; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch19; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch19; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch19; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch19; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch19; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch19; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch19; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch19; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch19; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch19; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch19; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch19; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch19; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch19; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch19;
			coeff_1_9_ch3_r_in = coeff_1_9_ch19; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch19; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch19; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch19; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch19; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch19; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch19; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch19; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch19; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch19;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch19;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch20_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch20; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch20; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch20; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch20; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch20;
			neg_mean_3_ch4_r_in = neg_mean_3_ch20; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch20; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch20; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch20;
			coeff_4_9_ch4_r_in = coeff_4_9_ch20;
			coeff_4_8_ch4_r_in = coeff_4_8_ch20; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch20; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch20; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch20; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch20; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch20; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch20; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch20; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch20; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch20; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch20; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch20; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch20; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch20; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch20; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch20; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch20; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch20; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch20; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch20; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch20; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch20; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch20; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch20; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch20; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch20; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch20; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch20; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch20; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch20; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch20; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch20;
			coeff_1_9_ch4_r_in = coeff_1_9_ch20; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch20; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch20; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch20; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch20; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch20; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch20; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch20; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch20; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch20;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch20;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch21_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch21; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch21; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch21; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch21; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch21;
			neg_mean_3_ch5_r_in = neg_mean_3_ch21; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch21; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch21; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch21;
			coeff_4_9_ch5_r_in = coeff_4_9_ch21;
			coeff_4_8_ch5_r_in = coeff_4_8_ch21; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch21; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch21; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch21; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch21; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch21; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch21; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch21; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch21; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch21; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch21; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch21; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch21; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch21; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch21; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch21; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch21; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch21; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch21; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch21; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch21; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch21; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch21; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch21; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch21; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch21; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch21; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch21; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch21; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch21; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch21; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch21;
			coeff_1_9_ch5_r_in = coeff_1_9_ch21; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch21; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch21; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch21; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch21; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch21; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch21; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch21; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch21; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch21;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch21;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch22_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch22; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch22; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch22; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch22; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch22;
			neg_mean_3_ch6_r_in = neg_mean_3_ch22; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch22; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch22; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch22;
			coeff_4_9_ch6_r_in = coeff_4_9_ch22;
			coeff_4_8_ch6_r_in = coeff_4_8_ch22; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch22; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch22; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch22; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch22; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch22; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch22; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch22; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch22; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch22; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch22; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch22; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch22; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch22; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch22; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch22; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch22; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch22; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch22; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch22; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch22; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch22; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch22; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch22; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch22; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch22; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch22; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch22; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch22; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch22; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch22; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch22;
			coeff_1_9_ch6_r_in = coeff_1_9_ch22; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch22; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch22; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch22; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch22; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch22; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch22; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch22; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch22; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch22;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch22;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch23_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch23; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch23; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch23; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch23; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch23;
			neg_mean_3_ch7_r_in = neg_mean_3_ch23; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch23; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch23; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch23;
			coeff_4_9_ch7_r_in = coeff_4_9_ch23;
			coeff_4_8_ch7_r_in = coeff_4_8_ch23; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch23; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch23; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch23; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch23; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch23; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch23; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch23; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch23; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch23; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch23; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch23; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch23; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch23; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch23; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch23; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch23; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch23; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch23; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch23; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch23; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch23; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch23; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch23; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch23; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch23; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch23; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch23; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch23; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch23; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch23; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch23;
			coeff_1_9_ch7_r_in = coeff_1_9_ch23; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch23; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch23; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch23; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch23; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch23; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch23; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch23; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch23; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch23;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch23;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch24_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch24; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch24; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch24; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch24; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch24;
			neg_mean_3_ch8_r_in = neg_mean_3_ch24; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch24; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch24; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch24;
			coeff_4_9_ch8_r_in = coeff_4_9_ch24;
			coeff_4_8_ch8_r_in = coeff_4_8_ch24; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch24; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch24; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch24; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch24; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch24; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch24; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch24; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch24; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch24; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch24; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch24; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch24; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch24; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch24; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch24; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch24; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch24; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch24; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch24; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch24; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch24; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch24; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch24; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch24; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch24; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch24; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch24; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch24; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch24; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch24; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch24;
			coeff_1_9_ch8_r_in = coeff_1_9_ch24; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch24; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch24; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch24; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch24; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch24; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch24; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch24; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch24; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch24;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch24;
			
			srdyi_1_r = 1'b0;
			srdyi_2_r = 1'b0;
			srdyi_3_r = 1'b0;
			srdyi_4_r = 1'b0;
			srdyi_5_r = 1'b0;
			srdyi_6_r = 1'b0;
			srdyi_7_r = 1'b0;
			srdyi_8_r = 1'b0;
		end
		S7: begin
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
			
			next_state = S8;
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch25_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch25; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch25; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch25; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch25; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch25;
			neg_mean_3_ch1_r_in = neg_mean_3_ch25; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch25; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch25; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch25;
			coeff_4_9_ch1_r_in = coeff_4_9_ch25;
			coeff_4_8_ch1_r_in = coeff_4_8_ch25; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch25; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch25; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch25; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch25; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch25; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch25; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch25; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch25; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch25; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch25; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch25; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch25; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch25; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch25; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch25; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch25; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch25; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch25; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch25; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch25; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch25; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch25; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch25; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch25; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch25; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch25; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch25; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch25; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch25; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch25; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch25;
			coeff_1_9_ch1_r_in = coeff_1_9_ch25; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch25; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch25; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch25; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch25; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch25; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch25; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch25; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch25; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch25;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch25;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch26_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch26; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch26; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch26; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch26; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch26;
			neg_mean_3_ch2_r_in = neg_mean_3_ch26; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch26; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch26; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch26;
			coeff_4_9_ch2_r_in = coeff_4_9_ch26;
			coeff_4_8_ch2_r_in = coeff_4_8_ch26; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch26; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch26; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch26; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch26; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch26; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch26; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch26; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch26; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch26; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch26; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch26; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch26; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch26; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch26; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch26; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch26; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch26; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch26; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch26; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch26; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch26; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch26; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch26; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch26; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch26; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch26; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch26; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch26; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch26; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch26; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch26;
			coeff_1_9_ch2_r_in = coeff_1_9_ch26; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch26; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch26; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch26; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch26; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch26; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch26; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch26; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch26; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch26;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch26;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch27_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch27; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch27; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch27; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch27; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch27;
			neg_mean_3_ch3_r_in = neg_mean_3_ch27; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch27; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch27; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch27;
			coeff_4_9_ch3_r_in = coeff_4_9_ch27;
			coeff_4_8_ch3_r_in = coeff_4_8_ch27; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch27; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch27; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch27; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch27; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch27; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch27; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch27; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch27; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch27; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch27; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch27; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch27; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch27; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch27; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch27; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch27; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch27; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch27; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch27; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch27; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch27; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch27; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch27; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch27; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch27; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch27; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch27; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch27; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch27; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch27; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch27;
			coeff_1_9_ch3_r_in = coeff_1_9_ch27; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch27; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch27; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch27; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch27; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch27; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch27; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch27; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch27; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch27;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch27;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch28_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch28; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch28; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch28; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch28; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch28;
			neg_mean_3_ch4_r_in = neg_mean_3_ch28; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch28; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch28; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch28;
			coeff_4_9_ch4_r_in = coeff_4_9_ch28;
			coeff_4_8_ch4_r_in = coeff_4_8_ch28; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch28; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch28; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch28; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch28; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch28; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch28; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch28; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch28; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch28; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch28; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch28; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch28; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch28; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch28; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch28; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch28; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch28; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch28; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch28; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch28; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch28; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch28; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch28; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch28; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch28; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch28; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch28; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch28; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch28; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch28; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch28;
			coeff_1_9_ch4_r_in = coeff_1_9_ch28; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch28; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch28; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch28; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch28; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch28; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch28; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch28; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch28; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch28;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch28;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch29_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch29; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch29; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch29; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch29; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch29;
			neg_mean_3_ch5_r_in = neg_mean_3_ch29; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch29; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch29; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch29;
			coeff_4_9_ch5_r_in = coeff_4_9_ch29;
			coeff_4_8_ch5_r_in = coeff_4_8_ch29; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch29; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch29; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch29; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch29; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch29; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch29; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch29; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch29; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch29; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch29; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch29; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch29; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch29; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch29; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch29; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch29; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch29; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch29; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch29; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch29; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch29; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch29; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch29; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch29; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch29; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch29; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch29; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch29; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch29; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch29; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch29;
			coeff_1_9_ch5_r_in = coeff_1_9_ch29; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch29; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch29; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch29; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch29; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch29; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch29; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch29; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch29; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch29;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch29;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch30_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch30; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch30; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch30; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch30; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch30;
			neg_mean_3_ch6_r_in = neg_mean_3_ch30; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch30; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch30; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch30;
			coeff_4_9_ch6_r_in = coeff_4_9_ch30;
			coeff_4_8_ch6_r_in = coeff_4_8_ch30; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch30; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch30; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch30; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch30; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch30; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch30; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch30; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch30; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch30; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch30; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch30; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch30; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch30; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch30; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch30; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch30; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch30; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch30; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch30; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch30; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch30; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch30; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch30; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch30; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch30; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch30; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch30; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch30; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch30; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch30; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch30;
			coeff_1_9_ch6_r_in = coeff_1_9_ch30; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch30; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch30; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch30; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch30; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch30; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch30; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch30; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch30; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch30;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch30;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch31_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch31; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch31; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch31; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch31; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch31;
			neg_mean_3_ch7_r_in = neg_mean_3_ch31; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch31; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch31; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch31;
			coeff_4_9_ch7_r_in = coeff_4_9_ch31;
			coeff_4_8_ch7_r_in = coeff_4_8_ch31; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch31; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch31; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch31; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch31; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch31; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch31; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch31; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch31; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch31; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch31; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch31; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch31; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch31; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch31; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch31; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch31; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch31; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch31; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch31; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch31; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch31; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch31; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch31; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch31; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch31; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch31; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch31; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch31; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch31; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch31; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch31;
			coeff_1_9_ch7_r_in = coeff_1_9_ch31; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch31; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch31; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch31; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch31; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch31; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch31; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch31; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch31; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch31;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch31;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch32_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch32; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch32; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch32; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch32; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch32;
			neg_mean_3_ch8_r_in = neg_mean_3_ch32; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch32; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch32; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch32;
			coeff_4_9_ch8_r_in = coeff_4_9_ch32;
			coeff_4_8_ch8_r_in = coeff_4_8_ch32; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch32; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch32; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch32; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch32; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch32; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch32; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch32; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch32; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch32; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch32; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch32; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch32; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch32; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch32; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch32; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch32; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch32; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch32; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch32; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch32; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch32; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch32; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch32; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch32; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch32; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch32; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch32; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch32; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch32; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch32; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch32;
			coeff_1_9_ch8_r_in = coeff_1_9_ch32; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch32; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch32; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch32; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch32; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch32; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch32; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch32; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch32; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch32;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch32;
			
			srdyi_1_r = 1'b1;
			srdyi_2_r = 1'b1;
			srdyi_3_r = 1'b1;
			srdyi_4_r = 1'b1;
			srdyi_5_r = 1'b1;
			srdyi_6_r = 1'b1;
			srdyi_7_r = 1'b1;
			srdyi_8_r = 1'b1;
		end
		S8: begin
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			if(srdyo_1_r == 1'b1) begin
				next_state = S9;
				x_lin_ch25_r = x_lin_ch1_out_w;
				x_lin_ch26_r = x_lin_ch2_out_w;
				x_lin_ch27_r = x_lin_ch3_out_w;
				x_lin_ch28_r = x_lin_ch4_out_w;
				x_lin_ch29_r = x_lin_ch5_out_w;
				x_lin_ch30_r = x_lin_ch6_out_w;
				x_lin_ch31_r = x_lin_ch7_out_w;
				x_lin_ch32_r = x_lin_ch8_out_w;
			end
			else begin
				next_state = S8;
				x_lin_ch25_r = 21'd0;
				x_lin_ch26_r = 21'd0;
				x_lin_ch27_r = 21'd0;
				x_lin_ch28_r = 21'd0;
				x_lin_ch29_r = 21'd0;
				x_lin_ch30_r = 21'd0;
				x_lin_ch31_r = 21'd0;
				x_lin_ch32_r = 21'd0;
			end
			
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			
			srdyi_1_r = 1'b0;
			srdyi_2_r = 1'b0;
			srdyi_3_r = 1'b0;
			srdyi_4_r = 1'b0;
			srdyi_5_r = 1'b0;
			srdyi_6_r = 1'b0;
			srdyi_7_r = 1'b0;
			srdyi_8_r = 1'b0;	
			
			//Channel 1
			x_adc_ch1_in_r = x_adc_ch25_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = recip_stdev_4_ch25; 
			recip_stdev_3_ch1_r_in = recip_stdev_3_ch25; 
			recip_stdev_2_ch1_r_in = recip_stdev_2_ch25; 
			recip_stdev_1_ch1_r_in = recip_stdev_1_ch25; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = neg_mean_4_ch25;
			neg_mean_3_ch1_r_in = neg_mean_3_ch25; 
			neg_mean_2_ch1_r_in = neg_mean_2_ch25; 
			neg_mean_1_ch1_r_in = neg_mean_1_ch25; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = coeff_4_10_ch25;
			coeff_4_9_ch1_r_in = coeff_4_9_ch25;
			coeff_4_8_ch1_r_in = coeff_4_8_ch25; 
			coeff_4_7_ch1_r_in = coeff_4_7_ch25; 
			coeff_4_6_ch1_r_in = coeff_4_6_ch25; 
			coeff_4_5_ch1_r_in = coeff_4_5_ch25; 
			coeff_4_4_ch1_r_in = coeff_4_4_ch25; 
			coeff_4_3_ch1_r_in = coeff_4_3_ch25; 
			coeff_4_2_ch1_r_in = coeff_4_2_ch25; 
			coeff_4_1_ch1_r_in = coeff_4_1_ch25; 
			coeff_4_0_ch1_r_in = coeff_4_0_ch25; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = coeff_3_10_ch25; 
			coeff_3_9_ch1_r_in = coeff_3_9_ch25; 
			coeff_3_8_ch1_r_in = coeff_3_8_ch25; 
			coeff_3_7_ch1_r_in = coeff_3_7_ch25; 
			coeff_3_6_ch1_r_in = coeff_3_6_ch25; 
			coeff_3_5_ch1_r_in = coeff_3_5_ch25; 
			coeff_3_4_ch1_r_in = coeff_3_4_ch25; 
			coeff_3_3_ch1_r_in = coeff_3_3_ch25; 
			coeff_3_2_ch1_r_in = coeff_3_2_ch25; 
			coeff_3_1_ch1_r_in = coeff_3_1_ch25; 
			coeff_3_0_ch1_r_in = coeff_3_0_ch25; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = coeff_2_10_ch25; 
			coeff_2_9_ch1_r_in = coeff_2_9_ch25; 
			coeff_2_8_ch1_r_in = coeff_2_8_ch25; 
			coeff_2_7_ch1_r_in = coeff_2_7_ch25; 
			coeff_2_6_ch1_r_in = coeff_2_6_ch25; 
			coeff_2_5_ch1_r_in = coeff_2_5_ch25; 
			coeff_2_4_ch1_r_in = coeff_2_4_ch25; 
			coeff_2_3_ch1_r_in = coeff_2_3_ch25; 
			coeff_2_2_ch1_r_in = coeff_2_2_ch25; 
			coeff_2_1_ch1_r_in = coeff_2_1_ch25; 
			coeff_2_0_ch1_r_in = coeff_2_0_ch25; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = coeff_1_10_ch25;
			coeff_1_9_ch1_r_in = coeff_1_9_ch25; 
			coeff_1_8_ch1_r_in = coeff_1_8_ch25; 
			coeff_1_7_ch1_r_in = coeff_1_7_ch25; 
			coeff_1_6_ch1_r_in = coeff_1_6_ch25; 
			coeff_1_5_ch1_r_in = coeff_1_5_ch25; 
			coeff_1_4_ch1_r_in = coeff_1_4_ch25; 
			coeff_1_3_ch1_r_in = coeff_1_3_ch25; 
			coeff_1_2_ch1_r_in = coeff_1_2_ch25; 
			coeff_1_1_ch1_r_in = coeff_1_1_ch25; 
			coeff_1_0_ch1_r_in = coeff_1_0_ch25;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = section_limit_ch25;
			
			//Channel 2
			x_adc_ch2_in_r = x_adc_ch26_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = recip_stdev_4_ch26; 
			recip_stdev_3_ch2_r_in = recip_stdev_3_ch26; 
			recip_stdev_2_ch2_r_in = recip_stdev_2_ch26; 
			recip_stdev_1_ch2_r_in = recip_stdev_1_ch26; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = neg_mean_4_ch26;
			neg_mean_3_ch2_r_in = neg_mean_3_ch26; 
			neg_mean_2_ch2_r_in = neg_mean_2_ch26; 
			neg_mean_1_ch2_r_in = neg_mean_1_ch26; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = coeff_4_10_ch26;
			coeff_4_9_ch2_r_in = coeff_4_9_ch26;
			coeff_4_8_ch2_r_in = coeff_4_8_ch26; 
			coeff_4_7_ch2_r_in = coeff_4_7_ch26; 
			coeff_4_6_ch2_r_in = coeff_4_6_ch26; 
			coeff_4_5_ch2_r_in = coeff_4_5_ch26; 
			coeff_4_4_ch2_r_in = coeff_4_4_ch26; 
			coeff_4_3_ch2_r_in = coeff_4_3_ch26; 
			coeff_4_2_ch2_r_in = coeff_4_2_ch26; 
			coeff_4_1_ch2_r_in = coeff_4_1_ch26; 
			coeff_4_0_ch2_r_in = coeff_4_0_ch26; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = coeff_3_10_ch26; 
			coeff_3_9_ch2_r_in = coeff_3_9_ch26; 
			coeff_3_8_ch2_r_in = coeff_3_8_ch26; 
			coeff_3_7_ch2_r_in = coeff_3_7_ch26; 
			coeff_3_6_ch2_r_in = coeff_3_6_ch26; 
			coeff_3_5_ch2_r_in = coeff_3_5_ch26; 
			coeff_3_4_ch2_r_in = coeff_3_4_ch26; 
			coeff_3_3_ch2_r_in = coeff_3_3_ch26; 
			coeff_3_2_ch2_r_in = coeff_3_2_ch26; 
			coeff_3_1_ch2_r_in = coeff_3_1_ch26; 
			coeff_3_0_ch2_r_in = coeff_3_0_ch26; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = coeff_2_10_ch26; 
			coeff_2_9_ch2_r_in = coeff_2_9_ch26; 
			coeff_2_8_ch2_r_in = coeff_2_8_ch26; 
			coeff_2_7_ch2_r_in = coeff_2_7_ch26; 
			coeff_2_6_ch2_r_in = coeff_2_6_ch26; 
			coeff_2_5_ch2_r_in = coeff_2_5_ch26; 
			coeff_2_4_ch2_r_in = coeff_2_4_ch26; 
			coeff_2_3_ch2_r_in = coeff_2_3_ch26; 
			coeff_2_2_ch2_r_in = coeff_2_2_ch26; 
			coeff_2_1_ch2_r_in = coeff_2_1_ch26; 
			coeff_2_0_ch2_r_in = coeff_2_0_ch26; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = coeff_1_10_ch26;
			coeff_1_9_ch2_r_in = coeff_1_9_ch26; 
			coeff_1_8_ch2_r_in = coeff_1_8_ch26; 
			coeff_1_7_ch2_r_in = coeff_1_7_ch26; 
			coeff_1_6_ch2_r_in = coeff_1_6_ch26; 
			coeff_1_5_ch2_r_in = coeff_1_5_ch26; 
			coeff_1_4_ch2_r_in = coeff_1_4_ch26; 
			coeff_1_3_ch2_r_in = coeff_1_3_ch26; 
			coeff_1_2_ch2_r_in = coeff_1_2_ch26; 
			coeff_1_1_ch2_r_in = coeff_1_1_ch26; 
			coeff_1_0_ch2_r_in = coeff_1_0_ch26;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = section_limit_ch26;
			
			//Channel 3
			x_adc_ch3_in_r = x_adc_ch27_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = recip_stdev_4_ch27; 
			recip_stdev_3_ch3_r_in = recip_stdev_3_ch27; 
			recip_stdev_2_ch3_r_in = recip_stdev_2_ch27; 
			recip_stdev_1_ch3_r_in = recip_stdev_1_ch27; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = neg_mean_4_ch27;
			neg_mean_3_ch3_r_in = neg_mean_3_ch27; 
			neg_mean_2_ch3_r_in = neg_mean_2_ch27; 
			neg_mean_1_ch3_r_in = neg_mean_1_ch27; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = coeff_4_10_ch27;
			coeff_4_9_ch3_r_in = coeff_4_9_ch27;
			coeff_4_8_ch3_r_in = coeff_4_8_ch27; 
			coeff_4_7_ch3_r_in = coeff_4_7_ch27; 
			coeff_4_6_ch3_r_in = coeff_4_6_ch27; 
			coeff_4_5_ch3_r_in = coeff_4_5_ch27; 
			coeff_4_4_ch3_r_in = coeff_4_4_ch27; 
			coeff_4_3_ch3_r_in = coeff_4_3_ch27; 
			coeff_4_2_ch3_r_in = coeff_4_2_ch27; 
			coeff_4_1_ch3_r_in = coeff_4_1_ch27; 
			coeff_4_0_ch3_r_in = coeff_4_0_ch27; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = coeff_3_10_ch27; 
			coeff_3_9_ch3_r_in = coeff_3_9_ch27; 
			coeff_3_8_ch3_r_in = coeff_3_8_ch27; 
			coeff_3_7_ch3_r_in = coeff_3_7_ch27; 
			coeff_3_6_ch3_r_in = coeff_3_6_ch27; 
			coeff_3_5_ch3_r_in = coeff_3_5_ch27; 
			coeff_3_4_ch3_r_in = coeff_3_4_ch27; 
			coeff_3_3_ch3_r_in = coeff_3_3_ch27; 
			coeff_3_2_ch3_r_in = coeff_3_2_ch27; 
			coeff_3_1_ch3_r_in = coeff_3_1_ch27; 
			coeff_3_0_ch3_r_in = coeff_3_0_ch27; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = coeff_2_10_ch27; 
			coeff_2_9_ch3_r_in = coeff_2_9_ch27; 
			coeff_2_8_ch3_r_in = coeff_2_8_ch27; 
			coeff_2_7_ch3_r_in = coeff_2_7_ch27; 
			coeff_2_6_ch3_r_in = coeff_2_6_ch27; 
			coeff_2_5_ch3_r_in = coeff_2_5_ch27; 
			coeff_2_4_ch3_r_in = coeff_2_4_ch27; 
			coeff_2_3_ch3_r_in = coeff_2_3_ch27; 
			coeff_2_2_ch3_r_in = coeff_2_2_ch27; 
			coeff_2_1_ch3_r_in = coeff_2_1_ch27; 
			coeff_2_0_ch3_r_in = coeff_2_0_ch27; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = coeff_1_10_ch27;
			coeff_1_9_ch3_r_in = coeff_1_9_ch27; 
			coeff_1_8_ch3_r_in = coeff_1_8_ch27; 
			coeff_1_7_ch3_r_in = coeff_1_7_ch27; 
			coeff_1_6_ch3_r_in = coeff_1_6_ch27; 
			coeff_1_5_ch3_r_in = coeff_1_5_ch27; 
			coeff_1_4_ch3_r_in = coeff_1_4_ch27; 
			coeff_1_3_ch3_r_in = coeff_1_3_ch27; 
			coeff_1_2_ch3_r_in = coeff_1_2_ch27; 
			coeff_1_1_ch3_r_in = coeff_1_1_ch27; 
			coeff_1_0_ch3_r_in = coeff_1_0_ch27;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = section_limit_ch27;
			
			//Channel 4
			x_adc_ch4_in_r = x_adc_ch28_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = recip_stdev_4_ch28; 
			recip_stdev_3_ch4_r_in = recip_stdev_3_ch28; 
			recip_stdev_2_ch4_r_in = recip_stdev_2_ch28; 
			recip_stdev_1_ch4_r_in = recip_stdev_1_ch28; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = neg_mean_4_ch28;
			neg_mean_3_ch4_r_in = neg_mean_3_ch28; 
			neg_mean_2_ch4_r_in = neg_mean_2_ch28; 
			neg_mean_1_ch4_r_in = neg_mean_1_ch28; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = coeff_4_10_ch28;
			coeff_4_9_ch4_r_in = coeff_4_9_ch28;
			coeff_4_8_ch4_r_in = coeff_4_8_ch28; 
			coeff_4_7_ch4_r_in = coeff_4_7_ch28; 
			coeff_4_6_ch4_r_in = coeff_4_6_ch28; 
			coeff_4_5_ch4_r_in = coeff_4_5_ch28; 
			coeff_4_4_ch4_r_in = coeff_4_4_ch28; 
			coeff_4_3_ch4_r_in = coeff_4_3_ch28; 
			coeff_4_2_ch4_r_in = coeff_4_2_ch28; 
			coeff_4_1_ch4_r_in = coeff_4_1_ch28; 
			coeff_4_0_ch4_r_in = coeff_4_0_ch28; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = coeff_3_10_ch28; 
			coeff_3_9_ch4_r_in = coeff_3_9_ch28; 
			coeff_3_8_ch4_r_in = coeff_3_8_ch28; 
			coeff_3_7_ch4_r_in = coeff_3_7_ch28; 
			coeff_3_6_ch4_r_in = coeff_3_6_ch28; 
			coeff_3_5_ch4_r_in = coeff_3_5_ch28; 
			coeff_3_4_ch4_r_in = coeff_3_4_ch28; 
			coeff_3_3_ch4_r_in = coeff_3_3_ch28; 
			coeff_3_2_ch4_r_in = coeff_3_2_ch28; 
			coeff_3_1_ch4_r_in = coeff_3_1_ch28; 
			coeff_3_0_ch4_r_in = coeff_3_0_ch28; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = coeff_2_10_ch28; 
			coeff_2_9_ch4_r_in = coeff_2_9_ch28; 
			coeff_2_8_ch4_r_in = coeff_2_8_ch28; 
			coeff_2_7_ch4_r_in = coeff_2_7_ch28; 
			coeff_2_6_ch4_r_in = coeff_2_6_ch28; 
			coeff_2_5_ch4_r_in = coeff_2_5_ch28; 
			coeff_2_4_ch4_r_in = coeff_2_4_ch28; 
			coeff_2_3_ch4_r_in = coeff_2_3_ch28; 
			coeff_2_2_ch4_r_in = coeff_2_2_ch28; 
			coeff_2_1_ch4_r_in = coeff_2_1_ch28; 
			coeff_2_0_ch4_r_in = coeff_2_0_ch28; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = coeff_1_10_ch28;
			coeff_1_9_ch4_r_in = coeff_1_9_ch28; 
			coeff_1_8_ch4_r_in = coeff_1_8_ch28; 
			coeff_1_7_ch4_r_in = coeff_1_7_ch28; 
			coeff_1_6_ch4_r_in = coeff_1_6_ch28; 
			coeff_1_5_ch4_r_in = coeff_1_5_ch28; 
			coeff_1_4_ch4_r_in = coeff_1_4_ch28; 
			coeff_1_3_ch4_r_in = coeff_1_3_ch28; 
			coeff_1_2_ch4_r_in = coeff_1_2_ch28; 
			coeff_1_1_ch4_r_in = coeff_1_1_ch28; 
			coeff_1_0_ch4_r_in = coeff_1_0_ch28;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = section_limit_ch28;
			
			//Channel 5
			x_adc_ch5_in_r = x_adc_ch29_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = recip_stdev_4_ch29; 
			recip_stdev_3_ch5_r_in = recip_stdev_3_ch29; 
			recip_stdev_2_ch5_r_in = recip_stdev_2_ch29; 
			recip_stdev_1_ch5_r_in = recip_stdev_1_ch29; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = neg_mean_4_ch29;
			neg_mean_3_ch5_r_in = neg_mean_3_ch29; 
			neg_mean_2_ch5_r_in = neg_mean_2_ch29; 
			neg_mean_1_ch5_r_in = neg_mean_1_ch29; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = coeff_4_10_ch29;
			coeff_4_9_ch5_r_in = coeff_4_9_ch29;
			coeff_4_8_ch5_r_in = coeff_4_8_ch29; 
			coeff_4_7_ch5_r_in = coeff_4_7_ch29; 
			coeff_4_6_ch5_r_in = coeff_4_6_ch29; 
			coeff_4_5_ch5_r_in = coeff_4_5_ch29; 
			coeff_4_4_ch5_r_in = coeff_4_4_ch29; 
			coeff_4_3_ch5_r_in = coeff_4_3_ch29; 
			coeff_4_2_ch5_r_in = coeff_4_2_ch29; 
			coeff_4_1_ch5_r_in = coeff_4_1_ch29; 
			coeff_4_0_ch5_r_in = coeff_4_0_ch29; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = coeff_3_10_ch29; 
			coeff_3_9_ch5_r_in = coeff_3_9_ch29; 
			coeff_3_8_ch5_r_in = coeff_3_8_ch29; 
			coeff_3_7_ch5_r_in = coeff_3_7_ch29; 
			coeff_3_6_ch5_r_in = coeff_3_6_ch29; 
			coeff_3_5_ch5_r_in = coeff_3_5_ch29; 
			coeff_3_4_ch5_r_in = coeff_3_4_ch29; 
			coeff_3_3_ch5_r_in = coeff_3_3_ch29; 
			coeff_3_2_ch5_r_in = coeff_3_2_ch29; 
			coeff_3_1_ch5_r_in = coeff_3_1_ch29; 
			coeff_3_0_ch5_r_in = coeff_3_0_ch29; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = coeff_2_10_ch29; 
			coeff_2_9_ch5_r_in = coeff_2_9_ch29; 
			coeff_2_8_ch5_r_in = coeff_2_8_ch29; 
			coeff_2_7_ch5_r_in = coeff_2_7_ch29; 
			coeff_2_6_ch5_r_in = coeff_2_6_ch29; 
			coeff_2_5_ch5_r_in = coeff_2_5_ch29; 
			coeff_2_4_ch5_r_in = coeff_2_4_ch29; 
			coeff_2_3_ch5_r_in = coeff_2_3_ch29; 
			coeff_2_2_ch5_r_in = coeff_2_2_ch29; 
			coeff_2_1_ch5_r_in = coeff_2_1_ch29; 
			coeff_2_0_ch5_r_in = coeff_2_0_ch29; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = coeff_1_10_ch29;
			coeff_1_9_ch5_r_in = coeff_1_9_ch29; 
			coeff_1_8_ch5_r_in = coeff_1_8_ch29; 
			coeff_1_7_ch5_r_in = coeff_1_7_ch29; 
			coeff_1_6_ch5_r_in = coeff_1_6_ch29; 
			coeff_1_5_ch5_r_in = coeff_1_5_ch29; 
			coeff_1_4_ch5_r_in = coeff_1_4_ch29; 
			coeff_1_3_ch5_r_in = coeff_1_3_ch29; 
			coeff_1_2_ch5_r_in = coeff_1_2_ch29; 
			coeff_1_1_ch5_r_in = coeff_1_1_ch29; 
			coeff_1_0_ch5_r_in = coeff_1_0_ch29;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = section_limit_ch29;
			
			//Channel 6
			x_adc_ch6_in_r = x_adc_ch30_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = recip_stdev_4_ch30; 
			recip_stdev_3_ch6_r_in = recip_stdev_3_ch30; 
			recip_stdev_2_ch6_r_in = recip_stdev_2_ch30; 
			recip_stdev_1_ch6_r_in = recip_stdev_1_ch30; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = neg_mean_4_ch30;
			neg_mean_3_ch6_r_in = neg_mean_3_ch30; 
			neg_mean_2_ch6_r_in = neg_mean_2_ch30; 
			neg_mean_1_ch6_r_in = neg_mean_1_ch30; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = coeff_4_10_ch30;
			coeff_4_9_ch6_r_in = coeff_4_9_ch30;
			coeff_4_8_ch6_r_in = coeff_4_8_ch30; 
			coeff_4_7_ch6_r_in = coeff_4_7_ch30; 
			coeff_4_6_ch6_r_in = coeff_4_6_ch30; 
			coeff_4_5_ch6_r_in = coeff_4_5_ch30; 
			coeff_4_4_ch6_r_in = coeff_4_4_ch30; 
			coeff_4_3_ch6_r_in = coeff_4_3_ch30; 
			coeff_4_2_ch6_r_in = coeff_4_2_ch30; 
			coeff_4_1_ch6_r_in = coeff_4_1_ch30; 
			coeff_4_0_ch6_r_in = coeff_4_0_ch30; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = coeff_3_10_ch30; 
			coeff_3_9_ch6_r_in = coeff_3_9_ch30; 
			coeff_3_8_ch6_r_in = coeff_3_8_ch30; 
			coeff_3_7_ch6_r_in = coeff_3_7_ch30; 
			coeff_3_6_ch6_r_in = coeff_3_6_ch30; 
			coeff_3_5_ch6_r_in = coeff_3_5_ch30; 
			coeff_3_4_ch6_r_in = coeff_3_4_ch30; 
			coeff_3_3_ch6_r_in = coeff_3_3_ch30; 
			coeff_3_2_ch6_r_in = coeff_3_2_ch30; 
			coeff_3_1_ch6_r_in = coeff_3_1_ch30; 
			coeff_3_0_ch6_r_in = coeff_3_0_ch30; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = coeff_2_10_ch30; 
			coeff_2_9_ch6_r_in = coeff_2_9_ch30; 
			coeff_2_8_ch6_r_in = coeff_2_8_ch30; 
			coeff_2_7_ch6_r_in = coeff_2_7_ch30; 
			coeff_2_6_ch6_r_in = coeff_2_6_ch30; 
			coeff_2_5_ch6_r_in = coeff_2_5_ch30; 
			coeff_2_4_ch6_r_in = coeff_2_4_ch30; 
			coeff_2_3_ch6_r_in = coeff_2_3_ch30; 
			coeff_2_2_ch6_r_in = coeff_2_2_ch30; 
			coeff_2_1_ch6_r_in = coeff_2_1_ch30; 
			coeff_2_0_ch6_r_in = coeff_2_0_ch30; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = coeff_1_10_ch30;
			coeff_1_9_ch6_r_in = coeff_1_9_ch30; 
			coeff_1_8_ch6_r_in = coeff_1_8_ch30; 
			coeff_1_7_ch6_r_in = coeff_1_7_ch30; 
			coeff_1_6_ch6_r_in = coeff_1_6_ch30; 
			coeff_1_5_ch6_r_in = coeff_1_5_ch30; 
			coeff_1_4_ch6_r_in = coeff_1_4_ch30; 
			coeff_1_3_ch6_r_in = coeff_1_3_ch30; 
			coeff_1_2_ch6_r_in = coeff_1_2_ch30; 
			coeff_1_1_ch6_r_in = coeff_1_1_ch30; 
			coeff_1_0_ch6_r_in = coeff_1_0_ch30;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = section_limit_ch30;
			
			//Channel 7
			x_adc_ch7_in_r = x_adc_ch31_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = recip_stdev_4_ch31; 
			recip_stdev_3_ch7_r_in = recip_stdev_3_ch31; 
			recip_stdev_2_ch7_r_in = recip_stdev_2_ch31; 
			recip_stdev_1_ch7_r_in = recip_stdev_1_ch31; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = neg_mean_4_ch31;
			neg_mean_3_ch7_r_in = neg_mean_3_ch31; 
			neg_mean_2_ch7_r_in = neg_mean_2_ch31; 
			neg_mean_1_ch7_r_in = neg_mean_1_ch31; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = coeff_4_10_ch31;
			coeff_4_9_ch7_r_in = coeff_4_9_ch31;
			coeff_4_8_ch7_r_in = coeff_4_8_ch31; 
			coeff_4_7_ch7_r_in = coeff_4_7_ch31; 
			coeff_4_6_ch7_r_in = coeff_4_6_ch31; 
			coeff_4_5_ch7_r_in = coeff_4_5_ch31; 
			coeff_4_4_ch7_r_in = coeff_4_4_ch31; 
			coeff_4_3_ch7_r_in = coeff_4_3_ch31; 
			coeff_4_2_ch7_r_in = coeff_4_2_ch31; 
			coeff_4_1_ch7_r_in = coeff_4_1_ch31; 
			coeff_4_0_ch7_r_in = coeff_4_0_ch31; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = coeff_3_10_ch31; 
			coeff_3_9_ch7_r_in = coeff_3_9_ch31; 
			coeff_3_8_ch7_r_in = coeff_3_8_ch31; 
			coeff_3_7_ch7_r_in = coeff_3_7_ch31; 
			coeff_3_6_ch7_r_in = coeff_3_6_ch31; 
			coeff_3_5_ch7_r_in = coeff_3_5_ch31; 
			coeff_3_4_ch7_r_in = coeff_3_4_ch31; 
			coeff_3_3_ch7_r_in = coeff_3_3_ch31; 
			coeff_3_2_ch7_r_in = coeff_3_2_ch31; 
			coeff_3_1_ch7_r_in = coeff_3_1_ch31; 
			coeff_3_0_ch7_r_in = coeff_3_0_ch31; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = coeff_2_10_ch31; 
			coeff_2_9_ch7_r_in = coeff_2_9_ch31; 
			coeff_2_8_ch7_r_in = coeff_2_8_ch31; 
			coeff_2_7_ch7_r_in = coeff_2_7_ch31; 
			coeff_2_6_ch7_r_in = coeff_2_6_ch31; 
			coeff_2_5_ch7_r_in = coeff_2_5_ch31; 
			coeff_2_4_ch7_r_in = coeff_2_4_ch31; 
			coeff_2_3_ch7_r_in = coeff_2_3_ch31; 
			coeff_2_2_ch7_r_in = coeff_2_2_ch31; 
			coeff_2_1_ch7_r_in = coeff_2_1_ch31; 
			coeff_2_0_ch7_r_in = coeff_2_0_ch31; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = coeff_1_10_ch31;
			coeff_1_9_ch7_r_in = coeff_1_9_ch31; 
			coeff_1_8_ch7_r_in = coeff_1_8_ch31; 
			coeff_1_7_ch7_r_in = coeff_1_7_ch31; 
			coeff_1_6_ch7_r_in = coeff_1_6_ch31; 
			coeff_1_5_ch7_r_in = coeff_1_5_ch31; 
			coeff_1_4_ch7_r_in = coeff_1_4_ch31; 
			coeff_1_3_ch7_r_in = coeff_1_3_ch31; 
			coeff_1_2_ch7_r_in = coeff_1_2_ch31; 
			coeff_1_1_ch7_r_in = coeff_1_1_ch31; 
			coeff_1_0_ch7_r_in = coeff_1_0_ch31;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = section_limit_ch31;
			
			//Channel 8
			x_adc_ch8_in_r = x_adc_ch32_r;
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = recip_stdev_4_ch32; 
			recip_stdev_3_ch8_r_in = recip_stdev_3_ch32; 
			recip_stdev_2_ch8_r_in = recip_stdev_2_ch32; 
			recip_stdev_1_ch8_r_in = recip_stdev_1_ch32; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = neg_mean_4_ch32;
			neg_mean_3_ch8_r_in = neg_mean_3_ch32; 
			neg_mean_2_ch8_r_in = neg_mean_2_ch32; 
			neg_mean_1_ch8_r_in = neg_mean_1_ch32; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = coeff_4_10_ch32;
			coeff_4_9_ch8_r_in = coeff_4_9_ch32;
			coeff_4_8_ch8_r_in = coeff_4_8_ch32; 
			coeff_4_7_ch8_r_in = coeff_4_7_ch32; 
			coeff_4_6_ch8_r_in = coeff_4_6_ch32; 
			coeff_4_5_ch8_r_in = coeff_4_5_ch32; 
			coeff_4_4_ch8_r_in = coeff_4_4_ch32; 
			coeff_4_3_ch8_r_in = coeff_4_3_ch32; 
			coeff_4_2_ch8_r_in = coeff_4_2_ch32; 
			coeff_4_1_ch8_r_in = coeff_4_1_ch32; 
			coeff_4_0_ch8_r_in = coeff_4_0_ch32; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = coeff_3_10_ch32; 
			coeff_3_9_ch8_r_in = coeff_3_9_ch32; 
			coeff_3_8_ch8_r_in = coeff_3_8_ch32; 
			coeff_3_7_ch8_r_in = coeff_3_7_ch32; 
			coeff_3_6_ch8_r_in = coeff_3_6_ch32; 
			coeff_3_5_ch8_r_in = coeff_3_5_ch32; 
			coeff_3_4_ch8_r_in = coeff_3_4_ch32; 
			coeff_3_3_ch8_r_in = coeff_3_3_ch32; 
			coeff_3_2_ch8_r_in = coeff_3_2_ch32; 
			coeff_3_1_ch8_r_in = coeff_3_1_ch32; 
			coeff_3_0_ch8_r_in = coeff_3_0_ch32; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = coeff_2_10_ch32; 
			coeff_2_9_ch8_r_in = coeff_2_9_ch32; 
			coeff_2_8_ch8_r_in = coeff_2_8_ch32; 
			coeff_2_7_ch8_r_in = coeff_2_7_ch32; 
			coeff_2_6_ch8_r_in = coeff_2_6_ch32; 
			coeff_2_5_ch8_r_in = coeff_2_5_ch32; 
			coeff_2_4_ch8_r_in = coeff_2_4_ch32; 
			coeff_2_3_ch8_r_in = coeff_2_3_ch32; 
			coeff_2_2_ch8_r_in = coeff_2_2_ch32; 
			coeff_2_1_ch8_r_in = coeff_2_1_ch32; 
			coeff_2_0_ch8_r_in = coeff_2_0_ch32; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = coeff_1_10_ch32;
			coeff_1_9_ch8_r_in = coeff_1_9_ch32; 
			coeff_1_8_ch8_r_in = coeff_1_8_ch32; 
			coeff_1_7_ch8_r_in = coeff_1_7_ch32; 
			coeff_1_6_ch8_r_in = coeff_1_6_ch32; 
			coeff_1_5_ch8_r_in = coeff_1_5_ch32; 
			coeff_1_4_ch8_r_in = coeff_1_4_ch32; 
			coeff_1_3_ch8_r_in = coeff_1_3_ch32; 
			coeff_1_2_ch8_r_in = coeff_1_2_ch32; 
			coeff_1_1_ch8_r_in = coeff_1_1_ch32; 
			coeff_1_0_ch8_r_in = coeff_1_0_ch32;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = section_limit_ch32;
			
		end
		S9: begin
			out_enable_r = 1'b1;
			in_enable_r = 1'b0;
			
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
			
			next_state = S0;
			
			//Channel 1
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = 32'd0;
			recip_stdev_3_ch1_r_in = 32'd0; 
			recip_stdev_2_ch1_r_in = 32'd0; 
			recip_stdev_1_ch1_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = 32'd0;
			neg_mean_3_ch1_r_in = 32'd0; 
			neg_mean_2_ch1_r_in = 32'd0; 
			neg_mean_1_ch1_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = 32'd0;
			coeff_4_9_ch1_r_in = 32'd0;
			coeff_4_8_ch1_r_in = 32'd0; 
			coeff_4_7_ch1_r_in = 32'd0; 
			coeff_4_6_ch1_r_in = 32'd0; 
			coeff_4_5_ch1_r_in = 32'd0; 
			coeff_4_4_ch1_r_in = 32'd0; 
			coeff_4_3_ch1_r_in = 32'd0; 
			coeff_4_2_ch1_r_in = 32'd0; 
			coeff_4_1_ch1_r_in = 32'd0; 
			coeff_4_0_ch1_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = 32'd0; 
			coeff_3_9_ch1_r_in = 32'd0; 
			coeff_3_8_ch1_r_in = 32'd0; 
			coeff_3_7_ch1_r_in = 32'd0; 
			coeff_3_6_ch1_r_in = 32'd0; 
			coeff_3_5_ch1_r_in = 32'd0; 
			coeff_3_4_ch1_r_in = 32'd0; 
			coeff_3_3_ch1_r_in = 32'd0; 
			coeff_3_2_ch1_r_in = 32'd0; 
			coeff_3_1_ch1_r_in = 32'd0; 
			coeff_3_0_ch1_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = 32'd0; 
			coeff_2_9_ch1_r_in = 32'd0; 
			coeff_2_8_ch1_r_in = 32'd0; 
			coeff_2_7_ch1_r_in = 32'd0; 
			coeff_2_6_ch1_r_in = 32'd0; 
			coeff_2_5_ch1_r_in = 32'd0; 
			coeff_2_4_ch1_r_in = 32'd0; 
			coeff_2_3_ch1_r_in = 32'd0; 
			coeff_2_2_ch1_r_in = 32'd0; 
			coeff_2_1_ch1_r_in = 32'd0; 
			coeff_2_0_ch1_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = 32'd0;
			coeff_1_9_ch1_r_in = 32'd0; 
			coeff_1_8_ch1_r_in = 32'd0; 
			coeff_1_7_ch1_r_in = 32'd0; 
			coeff_1_6_ch1_r_in = 32'd0; 
			coeff_1_5_ch1_r_in = 32'd0; 
			coeff_1_4_ch1_r_in = 32'd0; 
			coeff_1_3_ch1_r_in = 32'd0; 
			coeff_1_2_ch1_r_in = 32'd0; 
			coeff_1_1_ch1_r_in = 32'd0; 
			coeff_1_0_ch1_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = 20'd0;
			
			//Channel 2
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = 32'd0; 
			recip_stdev_3_ch2_r_in = 32'd0; 
			recip_stdev_2_ch2_r_in = 32'd0; 
			recip_stdev_1_ch2_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = 32'd0;
			neg_mean_3_ch2_r_in = 32'd0; 
			neg_mean_2_ch2_r_in = 32'd0; 
			neg_mean_1_ch2_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = 32'd0;
			coeff_4_9_ch2_r_in = 32'd0;
			coeff_4_8_ch2_r_in = 32'd0; 
			coeff_4_7_ch2_r_in = 32'd0; 
			coeff_4_6_ch2_r_in = 32'd0; 
			coeff_4_5_ch2_r_in = 32'd0; 
			coeff_4_4_ch2_r_in = 32'd0; 
			coeff_4_3_ch2_r_in = 32'd0; 
			coeff_4_2_ch2_r_in = 32'd0; 
			coeff_4_1_ch2_r_in = 32'd0; 
			coeff_4_0_ch2_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = 32'd0; 
			coeff_3_9_ch2_r_in = 32'd0; 
			coeff_3_8_ch2_r_in = 32'd0; 
			coeff_3_7_ch2_r_in = 32'd0; 
			coeff_3_6_ch2_r_in = 32'd0; 
			coeff_3_5_ch2_r_in = 32'd0; 
			coeff_3_4_ch2_r_in = 32'd0; 
			coeff_3_3_ch2_r_in = 32'd0; 
			coeff_3_2_ch2_r_in = 32'd0; 
			coeff_3_1_ch2_r_in = 32'd0; 
			coeff_3_0_ch2_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = 32'd0; 
			coeff_2_9_ch2_r_in = 32'd0; 
			coeff_2_8_ch2_r_in = 32'd0; 
			coeff_2_7_ch2_r_in = 32'd0; 
			coeff_2_6_ch2_r_in = 32'd0; 
			coeff_2_5_ch2_r_in = 32'd0; 
			coeff_2_4_ch2_r_in = 32'd0; 
			coeff_2_3_ch2_r_in = 32'd0; 
			coeff_2_2_ch2_r_in = 32'd0; 
			coeff_2_1_ch2_r_in = 32'd0; 
			coeff_2_0_ch2_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = 32'd0;
			coeff_1_9_ch2_r_in = 32'd0; 
			coeff_1_8_ch2_r_in = 32'd0; 
			coeff_1_7_ch2_r_in = 32'd0; 
			coeff_1_6_ch2_r_in = 32'd0; 
			coeff_1_5_ch2_r_in = 32'd0; 
			coeff_1_4_ch2_r_in = 32'd0; 
			coeff_1_3_ch2_r_in = 32'd0; 
			coeff_1_2_ch2_r_in = 32'd0; 
			coeff_1_1_ch2_r_in = 32'd0; 
			coeff_1_0_ch2_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = 20'd0;
			
			//Channel 3
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = 32'd0; 
			recip_stdev_3_ch3_r_in = 32'd0; 
			recip_stdev_2_ch3_r_in = 32'd0; 
			recip_stdev_1_ch3_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = 32'd0;
			neg_mean_3_ch3_r_in = 32'd0; 
			neg_mean_2_ch3_r_in = 32'd0; 
			neg_mean_1_ch3_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = 32'd0;
			coeff_4_9_ch3_r_in = 32'd0;
			coeff_4_8_ch3_r_in = 32'd0; 
			coeff_4_7_ch3_r_in = 32'd0; 
			coeff_4_6_ch3_r_in = 32'd0; 
			coeff_4_5_ch3_r_in = 32'd0; 
			coeff_4_4_ch3_r_in = 32'd0; 
			coeff_4_3_ch3_r_in = 32'd0; 
			coeff_4_2_ch3_r_in = 32'd0; 
			coeff_4_1_ch3_r_in = 32'd0; 
			coeff_4_0_ch3_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = 32'd0; 
			coeff_3_9_ch3_r_in = 32'd0; 
			coeff_3_8_ch3_r_in = 32'd0; 
			coeff_3_7_ch3_r_in = 32'd0; 
			coeff_3_6_ch3_r_in = 32'd0; 
			coeff_3_5_ch3_r_in = 32'd0; 
			coeff_3_4_ch3_r_in = 32'd0; 
			coeff_3_3_ch3_r_in = 32'd0; 
			coeff_3_2_ch3_r_in = 32'd0; 
			coeff_3_1_ch3_r_in = 32'd0; 
			coeff_3_0_ch3_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = 32'd0; 
			coeff_2_9_ch3_r_in = 32'd0; 
			coeff_2_8_ch3_r_in = 32'd0; 
			coeff_2_7_ch3_r_in = 32'd0; 
			coeff_2_6_ch3_r_in = 32'd0; 
			coeff_2_5_ch3_r_in = 32'd0; 
			coeff_2_4_ch3_r_in = 32'd0; 
			coeff_2_3_ch3_r_in = 32'd0; 
			coeff_2_2_ch3_r_in = 32'd0; 
			coeff_2_1_ch3_r_in = 32'd0; 
			coeff_2_0_ch3_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = 32'd0;
			coeff_1_9_ch3_r_in = 32'd0; 
			coeff_1_8_ch3_r_in = 32'd0; 
			coeff_1_7_ch3_r_in = 32'd0; 
			coeff_1_6_ch3_r_in = 32'd0; 
			coeff_1_5_ch3_r_in = 32'd0; 
			coeff_1_4_ch3_r_in = 32'd0; 
			coeff_1_3_ch3_r_in = 32'd0; 
			coeff_1_2_ch3_r_in = 32'd0; 
			coeff_1_1_ch3_r_in = 32'd0; 
			coeff_1_0_ch3_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = 20'd0;
			
			//Channel 4
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = 32'd0; 
			recip_stdev_3_ch4_r_in = 32'd0; 
			recip_stdev_2_ch4_r_in = 32'd0; 
			recip_stdev_1_ch4_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = 32'd0;
			neg_mean_3_ch4_r_in = 32'd0; 
			neg_mean_2_ch4_r_in = 32'd0; 
			neg_mean_1_ch4_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = 32'd0;
			coeff_4_9_ch4_r_in = 32'd0;
			coeff_4_8_ch4_r_in = 32'd0; 
			coeff_4_7_ch4_r_in = 32'd0; 
			coeff_4_6_ch4_r_in = 32'd0; 
			coeff_4_5_ch4_r_in = 32'd0; 
			coeff_4_4_ch4_r_in = 32'd0; 
			coeff_4_3_ch4_r_in = 32'd0; 
			coeff_4_2_ch4_r_in = 32'd0; 
			coeff_4_1_ch4_r_in = 32'd0; 
			coeff_4_0_ch4_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = 32'd0; 
			coeff_3_9_ch4_r_in = 32'd0; 
			coeff_3_8_ch4_r_in = 32'd0; 
			coeff_3_7_ch4_r_in = 32'd0; 
			coeff_3_6_ch4_r_in = 32'd0; 
			coeff_3_5_ch4_r_in = 32'd0; 
			coeff_3_4_ch4_r_in = 32'd0; 
			coeff_3_3_ch4_r_in = 32'd0; 
			coeff_3_2_ch4_r_in = 32'd0; 
			coeff_3_1_ch4_r_in = 32'd0; 
			coeff_3_0_ch4_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = 32'd0; 
			coeff_2_9_ch4_r_in = 32'd0; 
			coeff_2_8_ch4_r_in = 32'd0; 
			coeff_2_7_ch4_r_in = 32'd0; 
			coeff_2_6_ch4_r_in = 32'd0; 
			coeff_2_5_ch4_r_in = 32'd0; 
			coeff_2_4_ch4_r_in = 32'd0; 
			coeff_2_3_ch4_r_in = 32'd0; 
			coeff_2_2_ch4_r_in = 32'd0; 
			coeff_2_1_ch4_r_in = 32'd0; 
			coeff_2_0_ch4_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = 32'd0;
			coeff_1_9_ch4_r_in = 32'd0; 
			coeff_1_8_ch4_r_in = 32'd0; 
			coeff_1_7_ch4_r_in = 32'd0; 
			coeff_1_6_ch4_r_in = 32'd0; 
			coeff_1_5_ch4_r_in = 32'd0; 
			coeff_1_4_ch4_r_in = 32'd0; 
			coeff_1_3_ch4_r_in = 32'd0; 
			coeff_1_2_ch4_r_in = 32'd0; 
			coeff_1_1_ch4_r_in = 32'd0; 
			coeff_1_0_ch4_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = 20'd0;
			
			//Channel 5
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = 32'd0; 
			recip_stdev_3_ch5_r_in = 32'd0; 
			recip_stdev_2_ch5_r_in = 32'd0; 
			recip_stdev_1_ch5_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = 32'd0;
			neg_mean_3_ch5_r_in = 32'd0; 
			neg_mean_2_ch5_r_in = 32'd0; 
			neg_mean_1_ch5_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = 32'd0;
			coeff_4_9_ch5_r_in = 32'd0;
			coeff_4_8_ch5_r_in = 32'd0; 
			coeff_4_7_ch5_r_in = 32'd0; 
			coeff_4_6_ch5_r_in = 32'd0; 
			coeff_4_5_ch5_r_in = 32'd0; 
			coeff_4_4_ch5_r_in = 32'd0; 
			coeff_4_3_ch5_r_in = 32'd0; 
			coeff_4_2_ch5_r_in = 32'd0; 
			coeff_4_1_ch5_r_in = 32'd0; 
			coeff_4_0_ch5_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = 32'd0; 
			coeff_3_9_ch5_r_in = 32'd0; 
			coeff_3_8_ch5_r_in = 32'd0; 
			coeff_3_7_ch5_r_in = 32'd0; 
			coeff_3_6_ch5_r_in = 32'd0; 
			coeff_3_5_ch5_r_in = 32'd0; 
			coeff_3_4_ch5_r_in = 32'd0; 
			coeff_3_3_ch5_r_in = 32'd0; 
			coeff_3_2_ch5_r_in = 32'd0; 
			coeff_3_1_ch5_r_in = 32'd0; 
			coeff_3_0_ch5_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = 32'd0; 
			coeff_2_9_ch5_r_in = 32'd0; 
			coeff_2_8_ch5_r_in = 32'd0; 
			coeff_2_7_ch5_r_in = 32'd0; 
			coeff_2_6_ch5_r_in = 32'd0; 
			coeff_2_5_ch5_r_in = 32'd0; 
			coeff_2_4_ch5_r_in = 32'd0; 
			coeff_2_3_ch5_r_in = 32'd0; 
			coeff_2_2_ch5_r_in = 32'd0; 
			coeff_2_1_ch5_r_in = 32'd0; 
			coeff_2_0_ch5_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = 32'd0;
			coeff_1_9_ch5_r_in = 32'd0; 
			coeff_1_8_ch5_r_in = 32'd0; 
			coeff_1_7_ch5_r_in = 32'd0; 
			coeff_1_6_ch5_r_in = 32'd0; 
			coeff_1_5_ch5_r_in = 32'd0; 
			coeff_1_4_ch5_r_in = 32'd0; 
			coeff_1_3_ch5_r_in = 32'd0; 
			coeff_1_2_ch5_r_in = 32'd0; 
			coeff_1_1_ch5_r_in = 32'd0; 
			coeff_1_0_ch5_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = 20'd0;
			
			//Channel 6
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = 32'd0; 
			recip_stdev_3_ch6_r_in = 32'd0; 
			recip_stdev_2_ch6_r_in = 32'd0; 
			recip_stdev_1_ch6_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = 32'd0;
			neg_mean_3_ch6_r_in = 32'd0; 
			neg_mean_2_ch6_r_in = 32'd0; 
			neg_mean_1_ch6_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = 32'd0;
			coeff_4_9_ch6_r_in = 32'd0;
			coeff_4_8_ch6_r_in = 32'd0; 
			coeff_4_7_ch6_r_in = 32'd0; 
			coeff_4_6_ch6_r_in = 32'd0; 
			coeff_4_5_ch6_r_in = 32'd0; 
			coeff_4_4_ch6_r_in = 32'd0; 
			coeff_4_3_ch6_r_in = 32'd0; 
			coeff_4_2_ch6_r_in = 32'd0; 
			coeff_4_1_ch6_r_in = 32'd0; 
			coeff_4_0_ch6_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = 32'd0; 
			coeff_3_9_ch6_r_in = 32'd0; 
			coeff_3_8_ch6_r_in = 32'd0; 
			coeff_3_7_ch6_r_in = 32'd0; 
			coeff_3_6_ch6_r_in = 32'd0; 
			coeff_3_5_ch6_r_in = 32'd0; 
			coeff_3_4_ch6_r_in = 32'd0; 
			coeff_3_3_ch6_r_in = 32'd0; 
			coeff_3_2_ch6_r_in = 32'd0; 
			coeff_3_1_ch6_r_in = 32'd0; 
			coeff_3_0_ch6_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = 32'd0; 
			coeff_2_9_ch6_r_in = 32'd0; 
			coeff_2_8_ch6_r_in = 32'd0; 
			coeff_2_7_ch6_r_in = 32'd0; 
			coeff_2_6_ch6_r_in = 32'd0; 
			coeff_2_5_ch6_r_in = 32'd0; 
			coeff_2_4_ch6_r_in = 32'd0; 
			coeff_2_3_ch6_r_in = 32'd0; 
			coeff_2_2_ch6_r_in = 32'd0; 
			coeff_2_1_ch6_r_in = 32'd0; 
			coeff_2_0_ch6_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = 32'd0;
			coeff_1_9_ch6_r_in = 32'd0; 
			coeff_1_8_ch6_r_in = 32'd0; 
			coeff_1_7_ch6_r_in = 32'd0; 
			coeff_1_6_ch6_r_in = 32'd0; 
			coeff_1_5_ch6_r_in = 32'd0; 
			coeff_1_4_ch6_r_in = 32'd0; 
			coeff_1_3_ch6_r_in = 32'd0; 
			coeff_1_2_ch6_r_in = 32'd0; 
			coeff_1_1_ch6_r_in = 32'd0; 
			coeff_1_0_ch6_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = 20'd0;
			
			//Channel 7
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = 32'd0; 
			recip_stdev_3_ch7_r_in = 32'd0; 
			recip_stdev_2_ch7_r_in = 32'd0; 
			recip_stdev_1_ch7_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = 32'd0;
			neg_mean_3_ch7_r_in = 32'd0; 
			neg_mean_2_ch7_r_in = 32'd0; 
			neg_mean_1_ch7_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = 32'd0;
			coeff_4_9_ch7_r_in = 32'd0;
			coeff_4_8_ch7_r_in = 32'd0; 
			coeff_4_7_ch7_r_in = 32'd0; 
			coeff_4_6_ch7_r_in = 32'd0; 
			coeff_4_5_ch7_r_in = 32'd0; 
			coeff_4_4_ch7_r_in = 32'd0; 
			coeff_4_3_ch7_r_in = 32'd0; 
			coeff_4_2_ch7_r_in = 32'd0; 
			coeff_4_1_ch7_r_in = 32'd0; 
			coeff_4_0_ch7_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = 32'd0; 
			coeff_3_9_ch7_r_in = 32'd0; 
			coeff_3_8_ch7_r_in = 32'd0; 
			coeff_3_7_ch7_r_in = 32'd0; 
			coeff_3_6_ch7_r_in = 32'd0; 
			coeff_3_5_ch7_r_in = 32'd0; 
			coeff_3_4_ch7_r_in = 32'd0; 
			coeff_3_3_ch7_r_in = 32'd0; 
			coeff_3_2_ch7_r_in = 32'd0; 
			coeff_3_1_ch7_r_in = 32'd0; 
			coeff_3_0_ch7_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = 32'd0; 
			coeff_2_9_ch7_r_in = 32'd0; 
			coeff_2_8_ch7_r_in = 32'd0; 
			coeff_2_7_ch7_r_in = 32'd0; 
			coeff_2_6_ch7_r_in = 32'd0; 
			coeff_2_5_ch7_r_in = 32'd0; 
			coeff_2_4_ch7_r_in = 32'd0; 
			coeff_2_3_ch7_r_in = 32'd0; 
			coeff_2_2_ch7_r_in = 32'd0; 
			coeff_2_1_ch7_r_in = 32'd0; 
			coeff_2_0_ch7_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = 32'd0;
			coeff_1_9_ch7_r_in = 32'd0; 
			coeff_1_8_ch7_r_in = 32'd0; 
			coeff_1_7_ch7_r_in = 32'd0; 
			coeff_1_6_ch7_r_in = 32'd0; 
			coeff_1_5_ch7_r_in = 32'd0; 
			coeff_1_4_ch7_r_in = 32'd0; 
			coeff_1_3_ch7_r_in = 32'd0; 
			coeff_1_2_ch7_r_in = 32'd0; 
			coeff_1_1_ch7_r_in = 32'd0; 
			coeff_1_0_ch7_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = 20'd0;
			
			//Channel 8
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = 32'd0; 
			recip_stdev_3_ch8_r_in = 32'd0; 
			recip_stdev_2_ch8_r_in = 32'd0; 
			recip_stdev_1_ch8_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = 32'd0;
			neg_mean_3_ch8_r_in = 32'd0; 
			neg_mean_2_ch8_r_in = 32'd0; 
			neg_mean_1_ch8_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = 32'd0;
			coeff_4_9_ch8_r_in = 32'd0;
			coeff_4_8_ch8_r_in = 32'd0; 
			coeff_4_7_ch8_r_in = 32'd0; 
			coeff_4_6_ch8_r_in = 32'd0; 
			coeff_4_5_ch8_r_in = 32'd0; 
			coeff_4_4_ch8_r_in = 32'd0; 
			coeff_4_3_ch8_r_in = 32'd0; 
			coeff_4_2_ch8_r_in = 32'd0; 
			coeff_4_1_ch8_r_in = 32'd0; 
			coeff_4_0_ch8_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = 32'd0; 
			coeff_3_9_ch8_r_in = 32'd0; 
			coeff_3_8_ch8_r_in = 32'd0; 
			coeff_3_7_ch8_r_in = 32'd0; 
			coeff_3_6_ch8_r_in = 32'd0; 
			coeff_3_5_ch8_r_in = 32'd0; 
			coeff_3_4_ch8_r_in = 32'd0; 
			coeff_3_3_ch8_r_in = 32'd0; 
			coeff_3_2_ch8_r_in = 32'd0; 
			coeff_3_1_ch8_r_in = 32'd0; 
			coeff_3_0_ch8_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = 32'd0; 
			coeff_2_9_ch8_r_in = 32'd0; 
			coeff_2_8_ch8_r_in = 32'd0; 
			coeff_2_7_ch8_r_in = 32'd0; 
			coeff_2_6_ch8_r_in = 32'd0; 
			coeff_2_5_ch8_r_in = 32'd0; 
			coeff_2_4_ch8_r_in = 32'd0; 
			coeff_2_3_ch8_r_in = 32'd0; 
			coeff_2_2_ch8_r_in = 32'd0; 
			coeff_2_1_ch8_r_in = 32'd0; 
			coeff_2_0_ch8_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = 32'd0;
			coeff_1_9_ch8_r_in = 32'd0; 
			coeff_1_8_ch8_r_in = 32'd0; 
			coeff_1_7_ch8_r_in = 32'd0; 
			coeff_1_6_ch8_r_in = 32'd0; 
			coeff_1_5_ch8_r_in = 32'd0; 
			coeff_1_4_ch8_r_in = 32'd0; 
			coeff_1_3_ch8_r_in = 32'd0; 
			coeff_1_2_ch8_r_in = 32'd0; 
			coeff_1_1_ch8_r_in = 32'd0; 
			coeff_1_0_ch8_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = 20'd0;

			//Channel input valid
			srdyi_1_r = 1'b0;
			srdyi_2_r = 1'b0;
			srdyi_3_r = 1'b0;
			srdyi_4_r = 1'b0;
			srdyi_5_r = 1'b0;
			srdyi_6_r = 1'b0;
			srdyi_7_r = 1'b0;
			srdyi_8_r = 1'b0;
			
			//Channel inputs
			x_adc_ch1_in_r = 21'd0;
			x_adc_ch2_in_r = 21'd0;
			x_adc_ch3_in_r = 21'd0;
			x_adc_ch4_in_r = 21'd0;
			x_adc_ch5_in_r = 21'd0;
			x_adc_ch6_in_r = 21'd0;
			x_adc_ch7_in_r = 21'd0;
			x_adc_ch8_in_r = 21'd0;
		end
		default: begin //Should never get to this case
			x_lin_ch1_r = x_lin_ch1_w; 
			x_lin_ch2_r = x_lin_ch2_w; 
			x_lin_ch3_r = x_lin_ch3_w; 
			x_lin_ch4_r = x_lin_ch4_w; 
			x_lin_ch5_r = x_lin_ch5_w; 
			x_lin_ch6_r = x_lin_ch6_w; 
			x_lin_ch7_r = x_lin_ch7_w; 
			x_lin_ch8_r = x_lin_ch8_w; 
			x_lin_ch9_r = x_lin_ch9_w; 
			x_lin_ch10_r = x_lin_ch10_w; 
			x_lin_ch11_r = x_lin_ch11_w; 
			x_lin_ch12_r = x_lin_ch12_w; 
			x_lin_ch13_r = x_lin_ch13_w; 
			x_lin_ch14_r = x_lin_ch14_w; 
			x_lin_ch15_r = x_lin_ch15_w; 
			x_lin_ch16_r = x_lin_ch16_w; 
			x_lin_ch17_r = x_lin_ch17_w; 
			x_lin_ch18_r = x_lin_ch18_w; 
			x_lin_ch19_r = x_lin_ch19_w; 
			x_lin_ch20_r = x_lin_ch20_w; 
			x_lin_ch21_r = x_lin_ch21_w; 
			x_lin_ch22_r = x_lin_ch22_w; 
			x_lin_ch23_r = x_lin_ch23_w; 
			x_lin_ch24_r = x_lin_ch24_w; 
			x_lin_ch25_r = x_lin_ch25_w; 
			x_lin_ch26_r = x_lin_ch26_w; 
			x_lin_ch27_r = x_lin_ch27_w; 
			x_lin_ch28_r = x_lin_ch28_w; 
			x_lin_ch29_r = x_lin_ch29_w; 
			x_lin_ch30_r = x_lin_ch30_w; 
			x_lin_ch31_r = x_lin_ch31_w; 
			x_lin_ch32_r = x_lin_ch32_w;
		
			//Channel 1
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch1_r_in = 32'd0;
			recip_stdev_3_ch1_r_in = 32'd0; 
			recip_stdev_2_ch1_r_in = 32'd0; 
			recip_stdev_1_ch1_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch1_r_in = 32'd0;
			neg_mean_3_ch1_r_in = 32'd0; 
			neg_mean_2_ch1_r_in = 32'd0; 
			neg_mean_1_ch1_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch1_r_in = 32'd0;
			coeff_4_9_ch1_r_in = 32'd0;
			coeff_4_8_ch1_r_in = 32'd0; 
			coeff_4_7_ch1_r_in = 32'd0; 
			coeff_4_6_ch1_r_in = 32'd0; 
			coeff_4_5_ch1_r_in = 32'd0; 
			coeff_4_4_ch1_r_in = 32'd0; 
			coeff_4_3_ch1_r_in = 32'd0; 
			coeff_4_2_ch1_r_in = 32'd0; 
			coeff_4_1_ch1_r_in = 32'd0; 
			coeff_4_0_ch1_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch1_r_in = 32'd0; 
			coeff_3_9_ch1_r_in = 32'd0; 
			coeff_3_8_ch1_r_in = 32'd0; 
			coeff_3_7_ch1_r_in = 32'd0; 
			coeff_3_6_ch1_r_in = 32'd0; 
			coeff_3_5_ch1_r_in = 32'd0; 
			coeff_3_4_ch1_r_in = 32'd0; 
			coeff_3_3_ch1_r_in = 32'd0; 
			coeff_3_2_ch1_r_in = 32'd0; 
			coeff_3_1_ch1_r_in = 32'd0; 
			coeff_3_0_ch1_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch1_r_in = 32'd0; 
			coeff_2_9_ch1_r_in = 32'd0; 
			coeff_2_8_ch1_r_in = 32'd0; 
			coeff_2_7_ch1_r_in = 32'd0; 
			coeff_2_6_ch1_r_in = 32'd0; 
			coeff_2_5_ch1_r_in = 32'd0; 
			coeff_2_4_ch1_r_in = 32'd0; 
			coeff_2_3_ch1_r_in = 32'd0; 
			coeff_2_2_ch1_r_in = 32'd0; 
			coeff_2_1_ch1_r_in = 32'd0; 
			coeff_2_0_ch1_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch1_r_in = 32'd0;
			coeff_1_9_ch1_r_in = 32'd0; 
			coeff_1_8_ch1_r_in = 32'd0; 
			coeff_1_7_ch1_r_in = 32'd0; 
			coeff_1_6_ch1_r_in = 32'd0; 
			coeff_1_5_ch1_r_in = 32'd0; 
			coeff_1_4_ch1_r_in = 32'd0; 
			coeff_1_3_ch1_r_in = 32'd0; 
			coeff_1_2_ch1_r_in = 32'd0; 
			coeff_1_1_ch1_r_in = 32'd0; 
			coeff_1_0_ch1_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch1_r_in = 20'd0;
			
			//Channel 2
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch2_r_in = 32'd0; 
			recip_stdev_3_ch2_r_in = 32'd0; 
			recip_stdev_2_ch2_r_in = 32'd0; 
			recip_stdev_1_ch2_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch2_r_in = 32'd0;
			neg_mean_3_ch2_r_in = 32'd0; 
			neg_mean_2_ch2_r_in = 32'd0; 
			neg_mean_1_ch2_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch2_r_in = 32'd0;
			coeff_4_9_ch2_r_in = 32'd0;
			coeff_4_8_ch2_r_in = 32'd0; 
			coeff_4_7_ch2_r_in = 32'd0; 
			coeff_4_6_ch2_r_in = 32'd0; 
			coeff_4_5_ch2_r_in = 32'd0; 
			coeff_4_4_ch2_r_in = 32'd0; 
			coeff_4_3_ch2_r_in = 32'd0; 
			coeff_4_2_ch2_r_in = 32'd0; 
			coeff_4_1_ch2_r_in = 32'd0; 
			coeff_4_0_ch2_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch2_r_in = 32'd0; 
			coeff_3_9_ch2_r_in = 32'd0; 
			coeff_3_8_ch2_r_in = 32'd0; 
			coeff_3_7_ch2_r_in = 32'd0; 
			coeff_3_6_ch2_r_in = 32'd0; 
			coeff_3_5_ch2_r_in = 32'd0; 
			coeff_3_4_ch2_r_in = 32'd0; 
			coeff_3_3_ch2_r_in = 32'd0; 
			coeff_3_2_ch2_r_in = 32'd0; 
			coeff_3_1_ch2_r_in = 32'd0; 
			coeff_3_0_ch2_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch2_r_in = 32'd0; 
			coeff_2_9_ch2_r_in = 32'd0; 
			coeff_2_8_ch2_r_in = 32'd0; 
			coeff_2_7_ch2_r_in = 32'd0; 
			coeff_2_6_ch2_r_in = 32'd0; 
			coeff_2_5_ch2_r_in = 32'd0; 
			coeff_2_4_ch2_r_in = 32'd0; 
			coeff_2_3_ch2_r_in = 32'd0; 
			coeff_2_2_ch2_r_in = 32'd0; 
			coeff_2_1_ch2_r_in = 32'd0; 
			coeff_2_0_ch2_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch2_r_in = 32'd0;
			coeff_1_9_ch2_r_in = 32'd0; 
			coeff_1_8_ch2_r_in = 32'd0; 
			coeff_1_7_ch2_r_in = 32'd0; 
			coeff_1_6_ch2_r_in = 32'd0; 
			coeff_1_5_ch2_r_in = 32'd0; 
			coeff_1_4_ch2_r_in = 32'd0; 
			coeff_1_3_ch2_r_in = 32'd0; 
			coeff_1_2_ch2_r_in = 32'd0; 
			coeff_1_1_ch2_r_in = 32'd0; 
			coeff_1_0_ch2_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch2_r_in = 20'd0;
			
			//Channel 3
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch3_r_in = 32'd0; 
			recip_stdev_3_ch3_r_in = 32'd0; 
			recip_stdev_2_ch3_r_in = 32'd0; 
			recip_stdev_1_ch3_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch3_r_in = 32'd0;
			neg_mean_3_ch3_r_in = 32'd0; 
			neg_mean_2_ch3_r_in = 32'd0; 
			neg_mean_1_ch3_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch3_r_in = 32'd0;
			coeff_4_9_ch3_r_in = 32'd0;
			coeff_4_8_ch3_r_in = 32'd0; 
			coeff_4_7_ch3_r_in = 32'd0; 
			coeff_4_6_ch3_r_in = 32'd0; 
			coeff_4_5_ch3_r_in = 32'd0; 
			coeff_4_4_ch3_r_in = 32'd0; 
			coeff_4_3_ch3_r_in = 32'd0; 
			coeff_4_2_ch3_r_in = 32'd0; 
			coeff_4_1_ch3_r_in = 32'd0; 
			coeff_4_0_ch3_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch3_r_in = 32'd0; 
			coeff_3_9_ch3_r_in = 32'd0; 
			coeff_3_8_ch3_r_in = 32'd0; 
			coeff_3_7_ch3_r_in = 32'd0; 
			coeff_3_6_ch3_r_in = 32'd0; 
			coeff_3_5_ch3_r_in = 32'd0; 
			coeff_3_4_ch3_r_in = 32'd0; 
			coeff_3_3_ch3_r_in = 32'd0; 
			coeff_3_2_ch3_r_in = 32'd0; 
			coeff_3_1_ch3_r_in = 32'd0; 
			coeff_3_0_ch3_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch3_r_in = 32'd0; 
			coeff_2_9_ch3_r_in = 32'd0; 
			coeff_2_8_ch3_r_in = 32'd0; 
			coeff_2_7_ch3_r_in = 32'd0; 
			coeff_2_6_ch3_r_in = 32'd0; 
			coeff_2_5_ch3_r_in = 32'd0; 
			coeff_2_4_ch3_r_in = 32'd0; 
			coeff_2_3_ch3_r_in = 32'd0; 
			coeff_2_2_ch3_r_in = 32'd0; 
			coeff_2_1_ch3_r_in = 32'd0; 
			coeff_2_0_ch3_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch3_r_in = 32'd0;
			coeff_1_9_ch3_r_in = 32'd0; 
			coeff_1_8_ch3_r_in = 32'd0; 
			coeff_1_7_ch3_r_in = 32'd0; 
			coeff_1_6_ch3_r_in = 32'd0; 
			coeff_1_5_ch3_r_in = 32'd0; 
			coeff_1_4_ch3_r_in = 32'd0; 
			coeff_1_3_ch3_r_in = 32'd0; 
			coeff_1_2_ch3_r_in = 32'd0; 
			coeff_1_1_ch3_r_in = 32'd0; 
			coeff_1_0_ch3_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch3_r_in = 20'd0;
			
			//Channel 4
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch4_r_in = 32'd0; 
			recip_stdev_3_ch4_r_in = 32'd0; 
			recip_stdev_2_ch4_r_in = 32'd0; 
			recip_stdev_1_ch4_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch4_r_in = 32'd0;
			neg_mean_3_ch4_r_in = 32'd0; 
			neg_mean_2_ch4_r_in = 32'd0; 
			neg_mean_1_ch4_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch4_r_in = 32'd0;
			coeff_4_9_ch4_r_in = 32'd0;
			coeff_4_8_ch4_r_in = 32'd0; 
			coeff_4_7_ch4_r_in = 32'd0; 
			coeff_4_6_ch4_r_in = 32'd0; 
			coeff_4_5_ch4_r_in = 32'd0; 
			coeff_4_4_ch4_r_in = 32'd0; 
			coeff_4_3_ch4_r_in = 32'd0; 
			coeff_4_2_ch4_r_in = 32'd0; 
			coeff_4_1_ch4_r_in = 32'd0; 
			coeff_4_0_ch4_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch4_r_in = 32'd0; 
			coeff_3_9_ch4_r_in = 32'd0; 
			coeff_3_8_ch4_r_in = 32'd0; 
			coeff_3_7_ch4_r_in = 32'd0; 
			coeff_3_6_ch4_r_in = 32'd0; 
			coeff_3_5_ch4_r_in = 32'd0; 
			coeff_3_4_ch4_r_in = 32'd0; 
			coeff_3_3_ch4_r_in = 32'd0; 
			coeff_3_2_ch4_r_in = 32'd0; 
			coeff_3_1_ch4_r_in = 32'd0; 
			coeff_3_0_ch4_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch4_r_in = 32'd0; 
			coeff_2_9_ch4_r_in = 32'd0; 
			coeff_2_8_ch4_r_in = 32'd0; 
			coeff_2_7_ch4_r_in = 32'd0; 
			coeff_2_6_ch4_r_in = 32'd0; 
			coeff_2_5_ch4_r_in = 32'd0; 
			coeff_2_4_ch4_r_in = 32'd0; 
			coeff_2_3_ch4_r_in = 32'd0; 
			coeff_2_2_ch4_r_in = 32'd0; 
			coeff_2_1_ch4_r_in = 32'd0; 
			coeff_2_0_ch4_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch4_r_in = 32'd0;
			coeff_1_9_ch4_r_in = 32'd0; 
			coeff_1_8_ch4_r_in = 32'd0; 
			coeff_1_7_ch4_r_in = 32'd0; 
			coeff_1_6_ch4_r_in = 32'd0; 
			coeff_1_5_ch4_r_in = 32'd0; 
			coeff_1_4_ch4_r_in = 32'd0; 
			coeff_1_3_ch4_r_in = 32'd0; 
			coeff_1_2_ch4_r_in = 32'd0; 
			coeff_1_1_ch4_r_in = 32'd0; 
			coeff_1_0_ch4_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch4_r_in = 20'd0;
			
			//Channel 5
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch5_r_in = 32'd0; 
			recip_stdev_3_ch5_r_in = 32'd0; 
			recip_stdev_2_ch5_r_in = 32'd0; 
			recip_stdev_1_ch5_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch5_r_in = 32'd0;
			neg_mean_3_ch5_r_in = 32'd0; 
			neg_mean_2_ch5_r_in = 32'd0; 
			neg_mean_1_ch5_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch5_r_in = 32'd0;
			coeff_4_9_ch5_r_in = 32'd0;
			coeff_4_8_ch5_r_in = 32'd0; 
			coeff_4_7_ch5_r_in = 32'd0; 
			coeff_4_6_ch5_r_in = 32'd0; 
			coeff_4_5_ch5_r_in = 32'd0; 
			coeff_4_4_ch5_r_in = 32'd0; 
			coeff_4_3_ch5_r_in = 32'd0; 
			coeff_4_2_ch5_r_in = 32'd0; 
			coeff_4_1_ch5_r_in = 32'd0; 
			coeff_4_0_ch5_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch5_r_in = 32'd0; 
			coeff_3_9_ch5_r_in = 32'd0; 
			coeff_3_8_ch5_r_in = 32'd0; 
			coeff_3_7_ch5_r_in = 32'd0; 
			coeff_3_6_ch5_r_in = 32'd0; 
			coeff_3_5_ch5_r_in = 32'd0; 
			coeff_3_4_ch5_r_in = 32'd0; 
			coeff_3_3_ch5_r_in = 32'd0; 
			coeff_3_2_ch5_r_in = 32'd0; 
			coeff_3_1_ch5_r_in = 32'd0; 
			coeff_3_0_ch5_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch5_r_in = 32'd0; 
			coeff_2_9_ch5_r_in = 32'd0; 
			coeff_2_8_ch5_r_in = 32'd0; 
			coeff_2_7_ch5_r_in = 32'd0; 
			coeff_2_6_ch5_r_in = 32'd0; 
			coeff_2_5_ch5_r_in = 32'd0; 
			coeff_2_4_ch5_r_in = 32'd0; 
			coeff_2_3_ch5_r_in = 32'd0; 
			coeff_2_2_ch5_r_in = 32'd0; 
			coeff_2_1_ch5_r_in = 32'd0; 
			coeff_2_0_ch5_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch5_r_in = 32'd0;
			coeff_1_9_ch5_r_in = 32'd0; 
			coeff_1_8_ch5_r_in = 32'd0; 
			coeff_1_7_ch5_r_in = 32'd0; 
			coeff_1_6_ch5_r_in = 32'd0; 
			coeff_1_5_ch5_r_in = 32'd0; 
			coeff_1_4_ch5_r_in = 32'd0; 
			coeff_1_3_ch5_r_in = 32'd0; 
			coeff_1_2_ch5_r_in = 32'd0; 
			coeff_1_1_ch5_r_in = 32'd0; 
			coeff_1_0_ch5_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch5_r_in = 20'd0;
			
			//Channel 6
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch6_r_in = 32'd0; 
			recip_stdev_3_ch6_r_in = 32'd0; 
			recip_stdev_2_ch6_r_in = 32'd0; 
			recip_stdev_1_ch6_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch6_r_in = 32'd0;
			neg_mean_3_ch6_r_in = 32'd0; 
			neg_mean_2_ch6_r_in = 32'd0; 
			neg_mean_1_ch6_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch6_r_in = 32'd0;
			coeff_4_9_ch6_r_in = 32'd0;
			coeff_4_8_ch6_r_in = 32'd0; 
			coeff_4_7_ch6_r_in = 32'd0; 
			coeff_4_6_ch6_r_in = 32'd0; 
			coeff_4_5_ch6_r_in = 32'd0; 
			coeff_4_4_ch6_r_in = 32'd0; 
			coeff_4_3_ch6_r_in = 32'd0; 
			coeff_4_2_ch6_r_in = 32'd0; 
			coeff_4_1_ch6_r_in = 32'd0; 
			coeff_4_0_ch6_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch6_r_in = 32'd0; 
			coeff_3_9_ch6_r_in = 32'd0; 
			coeff_3_8_ch6_r_in = 32'd0; 
			coeff_3_7_ch6_r_in = 32'd0; 
			coeff_3_6_ch6_r_in = 32'd0; 
			coeff_3_5_ch6_r_in = 32'd0; 
			coeff_3_4_ch6_r_in = 32'd0; 
			coeff_3_3_ch6_r_in = 32'd0; 
			coeff_3_2_ch6_r_in = 32'd0; 
			coeff_3_1_ch6_r_in = 32'd0; 
			coeff_3_0_ch6_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch6_r_in = 32'd0; 
			coeff_2_9_ch6_r_in = 32'd0; 
			coeff_2_8_ch6_r_in = 32'd0; 
			coeff_2_7_ch6_r_in = 32'd0; 
			coeff_2_6_ch6_r_in = 32'd0; 
			coeff_2_5_ch6_r_in = 32'd0; 
			coeff_2_4_ch6_r_in = 32'd0; 
			coeff_2_3_ch6_r_in = 32'd0; 
			coeff_2_2_ch6_r_in = 32'd0; 
			coeff_2_1_ch6_r_in = 32'd0; 
			coeff_2_0_ch6_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch6_r_in = 32'd0;
			coeff_1_9_ch6_r_in = 32'd0; 
			coeff_1_8_ch6_r_in = 32'd0; 
			coeff_1_7_ch6_r_in = 32'd0; 
			coeff_1_6_ch6_r_in = 32'd0; 
			coeff_1_5_ch6_r_in = 32'd0; 
			coeff_1_4_ch6_r_in = 32'd0; 
			coeff_1_3_ch6_r_in = 32'd0; 
			coeff_1_2_ch6_r_in = 32'd0; 
			coeff_1_1_ch6_r_in = 32'd0; 
			coeff_1_0_ch6_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch6_r_in = 20'd0;
			
			//Channel 7
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch7_r_in = 32'd0; 
			recip_stdev_3_ch7_r_in = 32'd0; 
			recip_stdev_2_ch7_r_in = 32'd0; 
			recip_stdev_1_ch7_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch7_r_in = 32'd0;
			neg_mean_3_ch7_r_in = 32'd0; 
			neg_mean_2_ch7_r_in = 32'd0; 
			neg_mean_1_ch7_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch7_r_in = 32'd0;
			coeff_4_9_ch7_r_in = 32'd0;
			coeff_4_8_ch7_r_in = 32'd0; 
			coeff_4_7_ch7_r_in = 32'd0; 
			coeff_4_6_ch7_r_in = 32'd0; 
			coeff_4_5_ch7_r_in = 32'd0; 
			coeff_4_4_ch7_r_in = 32'd0; 
			coeff_4_3_ch7_r_in = 32'd0; 
			coeff_4_2_ch7_r_in = 32'd0; 
			coeff_4_1_ch7_r_in = 32'd0; 
			coeff_4_0_ch7_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch7_r_in = 32'd0; 
			coeff_3_9_ch7_r_in = 32'd0; 
			coeff_3_8_ch7_r_in = 32'd0; 
			coeff_3_7_ch7_r_in = 32'd0; 
			coeff_3_6_ch7_r_in = 32'd0; 
			coeff_3_5_ch7_r_in = 32'd0; 
			coeff_3_4_ch7_r_in = 32'd0; 
			coeff_3_3_ch7_r_in = 32'd0; 
			coeff_3_2_ch7_r_in = 32'd0; 
			coeff_3_1_ch7_r_in = 32'd0; 
			coeff_3_0_ch7_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch7_r_in = 32'd0; 
			coeff_2_9_ch7_r_in = 32'd0; 
			coeff_2_8_ch7_r_in = 32'd0; 
			coeff_2_7_ch7_r_in = 32'd0; 
			coeff_2_6_ch7_r_in = 32'd0; 
			coeff_2_5_ch7_r_in = 32'd0; 
			coeff_2_4_ch7_r_in = 32'd0; 
			coeff_2_3_ch7_r_in = 32'd0; 
			coeff_2_2_ch7_r_in = 32'd0; 
			coeff_2_1_ch7_r_in = 32'd0; 
			coeff_2_0_ch7_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch7_r_in = 32'd0;
			coeff_1_9_ch7_r_in = 32'd0; 
			coeff_1_8_ch7_r_in = 32'd0; 
			coeff_1_7_ch7_r_in = 32'd0; 
			coeff_1_6_ch7_r_in = 32'd0; 
			coeff_1_5_ch7_r_in = 32'd0; 
			coeff_1_4_ch7_r_in = 32'd0; 
			coeff_1_3_ch7_r_in = 32'd0; 
			coeff_1_2_ch7_r_in = 32'd0; 
			coeff_1_1_ch7_r_in = 32'd0; 
			coeff_1_0_ch7_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch7_r_in = 20'd0;
			
			//Channel 8
			//Reciprocal standard deviation for the centered and scaled fit
			recip_stdev_4_ch8_r_in = 32'd0; 
			recip_stdev_3_ch8_r_in = 32'd0; 
			recip_stdev_2_ch8_r_in = 32'd0; 
			recip_stdev_1_ch8_r_in = 32'd0; 

			//Negative meand for the centered and scaled fit
			neg_mean_4_ch8_r_in = 32'd0;
			neg_mean_3_ch8_r_in = 32'd0; 
			neg_mean_2_ch8_r_in = 32'd0; 
			neg_mean_1_ch8_r_in = 32'd0; 

			//Section 4 coefficients (x > 0, |x| > section_limit)
			coeff_4_10_ch8_r_in = 32'd0;
			coeff_4_9_ch8_r_in = 32'd0;
			coeff_4_8_ch8_r_in = 32'd0; 
			coeff_4_7_ch8_r_in = 32'd0; 
			coeff_4_6_ch8_r_in = 32'd0; 
			coeff_4_5_ch8_r_in = 32'd0; 
			coeff_4_4_ch8_r_in = 32'd0; 
			coeff_4_3_ch8_r_in = 32'd0; 
			coeff_4_2_ch8_r_in = 32'd0; 
			coeff_4_1_ch8_r_in = 32'd0; 
			coeff_4_0_ch8_r_in = 32'd0; 

			//Section 3 coefficients (x > 0, |x| <= section_limit)
			coeff_3_10_ch8_r_in = 32'd0; 
			coeff_3_9_ch8_r_in = 32'd0; 
			coeff_3_8_ch8_r_in = 32'd0; 
			coeff_3_7_ch8_r_in = 32'd0; 
			coeff_3_6_ch8_r_in = 32'd0; 
			coeff_3_5_ch8_r_in = 32'd0; 
			coeff_3_4_ch8_r_in = 32'd0; 
			coeff_3_3_ch8_r_in = 32'd0; 
			coeff_3_2_ch8_r_in = 32'd0; 
			coeff_3_1_ch8_r_in = 32'd0; 
			coeff_3_0_ch8_r_in = 32'd0; 

			//Section 2 coefficients (x <= 0, |x| <= section_limit)
			coeff_2_10_ch8_r_in = 32'd0; 
			coeff_2_9_ch8_r_in = 32'd0; 
			coeff_2_8_ch8_r_in = 32'd0; 
			coeff_2_7_ch8_r_in = 32'd0; 
			coeff_2_6_ch8_r_in = 32'd0; 
			coeff_2_5_ch8_r_in = 32'd0; 
			coeff_2_4_ch8_r_in = 32'd0; 
			coeff_2_3_ch8_r_in = 32'd0; 
			coeff_2_2_ch8_r_in = 32'd0; 
			coeff_2_1_ch8_r_in = 32'd0; 
			coeff_2_0_ch8_r_in = 32'd0; 

			//Section 1 coefficients (x <= 0, |x| > section_limit)
			coeff_1_10_ch8_r_in = 32'd0;
			coeff_1_9_ch8_r_in = 32'd0; 
			coeff_1_8_ch8_r_in = 32'd0; 
			coeff_1_7_ch8_r_in = 32'd0; 
			coeff_1_6_ch8_r_in = 32'd0; 
			coeff_1_5_ch8_r_in = 32'd0; 
			coeff_1_4_ch8_r_in = 32'd0; 
			coeff_1_3_ch8_r_in = 32'd0; 
			coeff_1_2_ch8_r_in = 32'd0; 
			coeff_1_1_ch8_r_in = 32'd0; 
			coeff_1_0_ch8_r_in = 32'd0;
			
			//X-value that separates the sections
			section_limit_ch8_r_in = 20'd0;

			//Channel input valid
			srdyi_1_r = 1'b0;
			srdyi_2_r = 1'b0;
			srdyi_3_r = 1'b0;
			srdyi_4_r = 1'b0;
			srdyi_5_r = 1'b0;
			srdyi_6_r = 1'b0;
			srdyi_7_r = 1'b0;
			srdyi_8_r = 1'b0;
			
			//Channel inputs
			x_adc_ch1_in_r = 21'd0;
			x_adc_ch2_in_r = 21'd0;
			x_adc_ch3_in_r = 21'd0;
			x_adc_ch4_in_r = 21'd0;
			x_adc_ch5_in_r = 21'd0;
			x_adc_ch6_in_r = 21'd0;
			x_adc_ch7_in_r = 21'd0;
			x_adc_ch8_in_r = 21'd0;
			
			out_enable_r = 1'b0;
			in_enable_r = 1'b0;
			next_state = S0;
		end
	endcase
end

////////////////////////////////////////////////////////////////////////////////
//At clock edge
always @(posedge clk) begin
	if(reset == 1'b1) begin
		state <= S0;
	end
	else begin
		state <= next_state;
	end
	
	GlobalReset <= reset;
	
	x_adc_ch1_r <= x_adc_ch1; 
	x_adc_ch2_r <= x_adc_ch2; 
	x_adc_ch3_r <= x_adc_ch3; 
	x_adc_ch4_r <= x_adc_ch4; 
	x_adc_ch5_r <= x_adc_ch5; 
	x_adc_ch6_r <= x_adc_ch6; 
	x_adc_ch7_r <= x_adc_ch7; 
	x_adc_ch8_r <= x_adc_ch8; 
	x_adc_ch9_r <= x_adc_ch9; 
	x_adc_ch10_r <= x_adc_ch10; 
	x_adc_ch11_r <= x_adc_ch11; 
	x_adc_ch12_r <= x_adc_ch12; 
	x_adc_ch13_r <= x_adc_ch13; 
	x_adc_ch14_r <= x_adc_ch14; 
	x_adc_ch15_r <= x_adc_ch15; 
	x_adc_ch16_r <= x_adc_ch16; 
	x_adc_ch17_r <= x_adc_ch17; 
	x_adc_ch18_r <= x_adc_ch18; 
	x_adc_ch19_r <= x_adc_ch19; 
	x_adc_ch20_r <= x_adc_ch20; 
	x_adc_ch21_r <= x_adc_ch21; 
	x_adc_ch22_r <= x_adc_ch22; 
	x_adc_ch23_r <= x_adc_ch23; 
	x_adc_ch24_r <= x_adc_ch24; 
	x_adc_ch25_r <= x_adc_ch25; 
	x_adc_ch26_r <= x_adc_ch26; 
	x_adc_ch27_r <= x_adc_ch27; 
	x_adc_ch28_r <= x_adc_ch28; 
	x_adc_ch29_r <= x_adc_ch29; 
	x_adc_ch30_r <= x_adc_ch30; 
	x_adc_ch31_r <= x_adc_ch31; 
	x_adc_ch32_r <= x_adc_ch32;
end
endmodule