//Wrapper file for Part B
module NLC_4sec_10th_order_32ch_v0 (
  input clk,
  input GlobalReset,

  output srdyo, // ufix1
  input srdyi, // ufix1


  //NLC ports for channel 31
  output [20:0] ch31_x_lin, // sfix21
  input  [20:0] ch31_x_adc, // sfix21
  input  [19:0] ch31_section_limit, // ufix20
  input  [31:0] ch31_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch31_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 30
  output [20:0] ch30_x_lin, // sfix21
  input  [20:0] ch30_x_adc, // sfix21
  input  [19:0] ch30_section_limit, // ufix20
  input  [31:0] ch30_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch30_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 29
  output [20:0] ch29_x_lin, // sfix21
  input  [20:0] ch29_x_adc, // sfix21
  input  [19:0] ch29_section_limit, // ufix20
  input  [31:0] ch29_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch29_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 28
  output [20:0] ch28_x_lin, // sfix21
  input  [20:0] ch28_x_adc, // sfix21
  input  [19:0] ch28_section_limit, // ufix20
  input  [31:0] ch28_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch28_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 27
  output [20:0] ch27_x_lin, // sfix21
  input  [20:0] ch27_x_adc, // sfix21
  input  [19:0] ch27_section_limit, // ufix20
  input  [31:0] ch27_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch27_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 26
  output [20:0] ch26_x_lin, // sfix21
  input  [20:0] ch26_x_adc, // sfix21
  input  [19:0] ch26_section_limit, // ufix20
  input  [31:0] ch26_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch26_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 25
  output [20:0] ch25_x_lin, // sfix21
  input  [20:0] ch25_x_adc, // sfix21
  input  [19:0] ch25_section_limit, // ufix20
  input  [31:0] ch25_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch25_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 24
  output [20:0] ch24_x_lin, // sfix21
  input  [20:0] ch24_x_adc, // sfix21
  input  [19:0] ch24_section_limit, // ufix20
  input  [31:0] ch24_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch24_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 23
  output [20:0] ch23_x_lin, // sfix21
  input  [20:0] ch23_x_adc, // sfix21
  input  [19:0] ch23_section_limit, // ufix20
  input  [31:0] ch23_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch23_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 22
  output [20:0] ch22_x_lin, // sfix21
  input  [20:0] ch22_x_adc, // sfix21
  input  [19:0] ch22_section_limit, // ufix20
  input  [31:0] ch22_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch22_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 21
  output [20:0] ch21_x_lin, // sfix21
  input  [20:0] ch21_x_adc, // sfix21
  input  [19:0] ch21_section_limit, // ufix20
  input  [31:0] ch21_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch21_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 20
  output [20:0] ch20_x_lin, // sfix21
  input  [20:0] ch20_x_adc, // sfix21
  input  [19:0] ch20_section_limit, // ufix20
  input  [31:0] ch20_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch20_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 19
  output [20:0] ch19_x_lin, // sfix21
  input  [20:0] ch19_x_adc, // sfix21
  input  [19:0] ch19_section_limit, // ufix20
  input  [31:0] ch19_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch19_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 18
  output [20:0] ch18_x_lin, // sfix21
  input  [20:0] ch18_x_adc, // sfix21
  input  [19:0] ch18_section_limit, // ufix20
  input  [31:0] ch18_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch18_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 17
  output [20:0] ch17_x_lin, // sfix21
  input  [20:0] ch17_x_adc, // sfix21
  input  [19:0] ch17_section_limit, // ufix20
  input  [31:0] ch17_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch17_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 16
  output [20:0] ch16_x_lin, // sfix21
  input  [20:0] ch16_x_adc, // sfix21
  input  [19:0] ch16_section_limit, // ufix20
  input  [31:0] ch16_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch16_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 15
  output [20:0] ch15_x_lin, // sfix21
  input  [20:0] ch15_x_adc, // sfix21
  input  [19:0] ch15_section_limit, // ufix20
  input  [31:0] ch15_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch15_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 14
  output [20:0] ch14_x_lin, // sfix21
  input  [20:0] ch14_x_adc, // sfix21
  input  [19:0] ch14_section_limit, // ufix20
  input  [31:0] ch14_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch14_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 13
  output [20:0] ch13_x_lin, // sfix21
  input  [20:0] ch13_x_adc, // sfix21
  input  [19:0] ch13_section_limit, // ufix20
  input  [31:0] ch13_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch13_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 12
  output [20:0] ch12_x_lin, // sfix21
  input  [20:0] ch12_x_adc, // sfix21
  input  [19:0] ch12_section_limit, // ufix20
  input  [31:0] ch12_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch12_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 11
  output [20:0] ch11_x_lin, // sfix21
  input  [20:0] ch11_x_adc, // sfix21
  input  [19:0] ch11_section_limit, // ufix20
  input  [31:0] ch11_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch11_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 10
  output [20:0] ch10_x_lin, // sfix21
  input  [20:0] ch10_x_adc, // sfix21
  input  [19:0] ch10_section_limit, // ufix20
  input  [31:0] ch10_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch10_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 9
  output [20:0] ch9_x_lin, // sfix21
  input  [20:0] ch9_x_adc, // sfix21
  input  [19:0] ch9_section_limit, // ufix20
  input  [31:0] ch9_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch9_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 8
  output [20:0] ch8_x_lin, // sfix21
  input  [20:0] ch8_x_adc, // sfix21
  input  [19:0] ch8_section_limit, // ufix20
  input  [31:0] ch8_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch8_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 7
  output [20:0] ch7_x_lin, // sfix21
  input  [20:0] ch7_x_adc, // sfix21
  input  [19:0] ch7_section_limit, // ufix20
  input  [31:0] ch7_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch7_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 6
  output [20:0] ch6_x_lin, // sfix21
  input  [20:0] ch6_x_adc, // sfix21
  input  [19:0] ch6_section_limit, // ufix20
  input  [31:0] ch6_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch6_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 5
  output [20:0] ch5_x_lin, // sfix21
  input  [20:0] ch5_x_adc, // sfix21
  input  [19:0] ch5_section_limit, // ufix20
  input  [31:0] ch5_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch5_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 4
  output [20:0] ch4_x_lin, // sfix21
  input  [20:0] ch4_x_adc, // sfix21
  input  [19:0] ch4_section_limit, // ufix20
  input  [31:0] ch4_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch4_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 3
  output [20:0] ch3_x_lin, // sfix21
  input  [20:0] ch3_x_adc, // sfix21
  input  [19:0] ch3_section_limit, // ufix20
  input  [31:0] ch3_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch3_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 2
  output [20:0] ch2_x_lin, // sfix21
  input  [20:0] ch2_x_adc, // sfix21
  input  [19:0] ch2_section_limit, // ufix20
  input  [31:0] ch2_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch2_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 1
  output [20:0] ch1_x_lin, // sfix21
  input  [20:0] ch1_x_adc, // sfix21
  input  [19:0] ch1_section_limit, // ufix20
  input  [31:0] ch1_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch1_select_section_coefficients_coeff_1_0_porty, // ufix32

  //NLC ports for channel 0
  output [20:0] ch0_x_lin, // sfix21
  input  [20:0] ch0_x_adc, // sfix21
  input  [19:0] ch0_section_limit, // ufix20
  input  [31:0] ch0_select_section_coefficients_stdev_4_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_stdev_3_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_stdev_2_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_stdev_1_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_mean_4_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_mean_3_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_mean_2_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_mean_1_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_9_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_8_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_7_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_6_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_5_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_4_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_3_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_2_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_10_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_1_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_4_0_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_9_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_8_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_7_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_6_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_5_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_4_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_3_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_2_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_10_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_1_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_3_0_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_9_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_8_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_7_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_6_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_5_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_4_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_3_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_2_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_10_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_1_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_2_0_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_9_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_8_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_7_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_6_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_5_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_4_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_3_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_2_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_10_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_1_porty, // ufix32
  input  [31:0] ch0_select_section_coefficients_coeff_1_0_porty // ufix32

);

NLC_4sec_10th_32ch_opt UUT(
  //System clock and reset
  .clk(clk),
  .reset(GlobalReset),

  //Input valid and output ready signals (one for all 32ch)  
  .srdyi(srdyi), 
  .srdyo(srdyo), 

  .x_adc_ch32(ch31_x_adc),//NLC output 
  .x_lin_ch32(ch31_x_lin),//ADC output 
  .section_limit_ch32(ch31_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch32(ch31_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch32(ch31_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch32(ch31_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch32(ch31_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch32(ch31_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch32(ch31_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch32(ch31_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch32(ch31_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch32(ch31_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch32(ch31_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch32(ch31_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch32(ch31_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch32(ch31_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch32(ch31_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch32(ch31_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch32(ch31_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch32(ch31_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch32(ch31_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch32(ch31_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch32(ch31_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch32(ch31_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch32(ch31_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch32(ch31_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch32(ch31_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch32(ch31_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch32(ch31_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch32(ch31_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch32(ch31_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch32(ch31_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch32(ch31_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch32(ch31_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch32(ch31_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch32(ch31_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch32(ch31_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch32(ch31_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch32(ch31_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch32(ch31_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch32(ch31_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch32(ch31_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch32(ch31_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch32(ch31_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch32(ch31_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch32(ch31_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch32(ch31_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch32(ch31_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch32(ch31_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch32(ch31_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch32(ch31_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch32(ch31_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch32(ch31_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch32(ch31_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch32(ch31_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch31(ch30_x_adc),//NLC output 
  .x_lin_ch31(ch30_x_lin),//ADC output 
  .section_limit_ch31(ch30_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch31(ch30_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch31(ch30_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch31(ch30_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch31(ch30_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch31(ch30_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch31(ch30_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch31(ch30_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch31(ch30_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch31(ch30_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch31(ch30_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch31(ch30_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch31(ch30_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch31(ch30_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch31(ch30_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch31(ch30_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch31(ch30_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch31(ch30_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch31(ch30_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch31(ch30_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch31(ch30_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch31(ch30_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch31(ch30_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch31(ch30_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch31(ch30_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch31(ch30_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch31(ch30_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch31(ch30_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch31(ch30_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch31(ch30_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch31(ch30_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch31(ch30_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch31(ch30_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch31(ch30_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch31(ch30_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch31(ch30_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch31(ch30_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch31(ch30_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch31(ch30_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch31(ch30_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch31(ch30_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch31(ch30_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch31(ch30_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch31(ch30_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch31(ch30_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch31(ch30_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch31(ch30_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch31(ch30_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch31(ch30_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch31(ch30_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch31(ch30_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch31(ch30_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch31(ch30_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch30(ch29_x_adc),//NLC output 
  .x_lin_ch30(ch29_x_lin),//ADC output 
  .section_limit_ch30(ch29_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch30(ch29_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch30(ch29_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch30(ch29_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch30(ch29_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch30(ch29_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch30(ch29_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch30(ch29_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch30(ch29_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch30(ch29_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch30(ch29_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch30(ch29_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch30(ch29_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch30(ch29_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch30(ch29_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch30(ch29_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch30(ch29_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch30(ch29_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch30(ch29_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch30(ch29_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch30(ch29_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch30(ch29_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch30(ch29_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch30(ch29_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch30(ch29_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch30(ch29_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch30(ch29_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch30(ch29_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch30(ch29_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch30(ch29_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch30(ch29_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch30(ch29_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch30(ch29_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch30(ch29_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch30(ch29_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch30(ch29_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch30(ch29_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch30(ch29_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch30(ch29_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch30(ch29_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch30(ch29_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch30(ch29_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch30(ch29_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch30(ch29_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch30(ch29_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch30(ch29_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch30(ch29_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch30(ch29_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch30(ch29_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch30(ch29_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch30(ch29_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch30(ch29_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch30(ch29_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch29(ch28_x_adc),//NLC output 
  .x_lin_ch29(ch28_x_lin),//ADC output 
  .section_limit_ch29(ch28_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch29(ch28_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch29(ch28_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch29(ch28_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch29(ch28_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch29(ch28_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch29(ch28_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch29(ch28_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch29(ch28_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch29(ch28_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch29(ch28_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch29(ch28_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch29(ch28_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch29(ch28_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch29(ch28_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch29(ch28_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch29(ch28_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch29(ch28_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch29(ch28_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch29(ch28_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch29(ch28_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch29(ch28_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch29(ch28_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch29(ch28_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch29(ch28_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch29(ch28_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch29(ch28_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch29(ch28_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch29(ch28_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch29(ch28_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch29(ch28_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch29(ch28_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch29(ch28_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch29(ch28_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch29(ch28_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch29(ch28_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch29(ch28_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch29(ch28_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch29(ch28_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch29(ch28_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch29(ch28_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch29(ch28_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch29(ch28_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch29(ch28_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch29(ch28_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch29(ch28_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch29(ch28_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch29(ch28_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch29(ch28_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch29(ch28_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch29(ch28_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch29(ch28_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch29(ch28_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch28(ch27_x_adc),//NLC output 
  .x_lin_ch28(ch27_x_lin),//ADC output 
  .section_limit_ch28(ch27_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch28(ch27_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch28(ch27_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch28(ch27_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch28(ch27_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch28(ch27_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch28(ch27_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch28(ch27_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch28(ch27_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch28(ch27_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch28(ch27_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch28(ch27_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch28(ch27_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch28(ch27_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch28(ch27_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch28(ch27_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch28(ch27_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch28(ch27_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch28(ch27_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch28(ch27_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch28(ch27_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch28(ch27_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch28(ch27_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch28(ch27_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch28(ch27_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch28(ch27_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch28(ch27_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch28(ch27_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch28(ch27_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch28(ch27_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch28(ch27_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch28(ch27_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch28(ch27_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch28(ch27_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch28(ch27_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch28(ch27_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch28(ch27_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch28(ch27_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch28(ch27_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch28(ch27_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch28(ch27_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch28(ch27_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch28(ch27_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch28(ch27_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch28(ch27_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch28(ch27_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch28(ch27_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch28(ch27_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch28(ch27_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch28(ch27_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch28(ch27_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch28(ch27_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch28(ch27_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch27(ch26_x_adc),//NLC output 
  .x_lin_ch27(ch26_x_lin),//ADC output 
  .section_limit_ch27(ch26_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch27(ch26_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch27(ch26_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch27(ch26_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch27(ch26_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch27(ch26_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch27(ch26_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch27(ch26_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch27(ch26_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch27(ch26_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch27(ch26_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch27(ch26_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch27(ch26_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch27(ch26_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch27(ch26_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch27(ch26_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch27(ch26_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch27(ch26_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch27(ch26_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch27(ch26_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch27(ch26_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch27(ch26_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch27(ch26_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch27(ch26_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch27(ch26_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch27(ch26_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch27(ch26_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch27(ch26_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch27(ch26_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch27(ch26_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch27(ch26_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch27(ch26_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch27(ch26_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch27(ch26_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch27(ch26_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch27(ch26_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch27(ch26_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch27(ch26_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch27(ch26_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch27(ch26_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch27(ch26_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch27(ch26_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch27(ch26_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch27(ch26_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch27(ch26_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch27(ch26_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch27(ch26_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch27(ch26_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch27(ch26_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch27(ch26_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch27(ch26_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch27(ch26_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch27(ch26_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch26(ch25_x_adc),//NLC output 
  .x_lin_ch26(ch25_x_lin),//ADC output 
  .section_limit_ch26(ch25_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch26(ch25_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch26(ch25_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch26(ch25_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch26(ch25_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch26(ch25_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch26(ch25_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch26(ch25_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch26(ch25_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch26(ch25_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch26(ch25_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch26(ch25_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch26(ch25_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch26(ch25_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch26(ch25_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch26(ch25_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch26(ch25_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch26(ch25_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch26(ch25_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch26(ch25_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch26(ch25_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch26(ch25_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch26(ch25_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch26(ch25_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch26(ch25_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch26(ch25_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch26(ch25_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch26(ch25_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch26(ch25_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch26(ch25_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch26(ch25_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch26(ch25_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch26(ch25_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch26(ch25_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch26(ch25_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch26(ch25_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch26(ch25_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch26(ch25_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch26(ch25_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch26(ch25_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch26(ch25_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch26(ch25_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch26(ch25_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch26(ch25_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch26(ch25_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch26(ch25_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch26(ch25_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch26(ch25_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch26(ch25_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch26(ch25_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch26(ch25_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch26(ch25_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch26(ch25_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch25(ch24_x_adc),//NLC output 
  .x_lin_ch25(ch24_x_lin),//ADC output 
  .section_limit_ch25(ch24_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch25(ch24_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch25(ch24_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch25(ch24_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch25(ch24_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch25(ch24_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch25(ch24_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch25(ch24_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch25(ch24_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch25(ch24_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch25(ch24_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch25(ch24_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch25(ch24_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch25(ch24_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch25(ch24_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch25(ch24_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch25(ch24_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch25(ch24_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch25(ch24_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch25(ch24_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch25(ch24_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch25(ch24_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch25(ch24_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch25(ch24_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch25(ch24_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch25(ch24_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch25(ch24_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch25(ch24_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch25(ch24_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch25(ch24_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch25(ch24_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch25(ch24_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch25(ch24_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch25(ch24_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch25(ch24_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch25(ch24_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch25(ch24_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch25(ch24_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch25(ch24_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch25(ch24_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch25(ch24_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch25(ch24_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch25(ch24_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch25(ch24_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch25(ch24_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch25(ch24_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch25(ch24_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch25(ch24_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch25(ch24_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch25(ch24_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch25(ch24_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch25(ch24_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch25(ch24_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch24(ch23_x_adc),//NLC output 
  .x_lin_ch24(ch23_x_lin),//ADC output 
  .section_limit_ch24(ch23_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch24(ch23_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch24(ch23_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch24(ch23_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch24(ch23_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch24(ch23_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch24(ch23_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch24(ch23_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch24(ch23_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch24(ch23_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch24(ch23_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch24(ch23_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch24(ch23_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch24(ch23_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch24(ch23_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch24(ch23_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch24(ch23_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch24(ch23_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch24(ch23_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch24(ch23_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch24(ch23_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch24(ch23_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch24(ch23_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch24(ch23_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch24(ch23_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch24(ch23_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch24(ch23_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch24(ch23_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch24(ch23_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch24(ch23_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch24(ch23_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch24(ch23_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch24(ch23_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch24(ch23_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch24(ch23_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch24(ch23_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch24(ch23_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch24(ch23_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch24(ch23_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch24(ch23_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch24(ch23_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch24(ch23_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch24(ch23_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch24(ch23_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch24(ch23_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch24(ch23_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch24(ch23_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch24(ch23_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch24(ch23_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch24(ch23_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch24(ch23_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch24(ch23_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch24(ch23_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch23(ch22_x_adc),//NLC output 
  .x_lin_ch23(ch22_x_lin),//ADC output 
  .section_limit_ch23(ch22_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch23(ch22_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch23(ch22_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch23(ch22_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch23(ch22_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch23(ch22_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch23(ch22_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch23(ch22_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch23(ch22_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch23(ch22_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch23(ch22_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch23(ch22_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch23(ch22_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch23(ch22_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch23(ch22_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch23(ch22_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch23(ch22_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch23(ch22_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch23(ch22_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch23(ch22_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch23(ch22_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch23(ch22_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch23(ch22_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch23(ch22_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch23(ch22_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch23(ch22_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch23(ch22_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch23(ch22_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch23(ch22_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch23(ch22_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch23(ch22_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch23(ch22_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch23(ch22_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch23(ch22_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch23(ch22_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch23(ch22_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch23(ch22_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch23(ch22_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch23(ch22_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch23(ch22_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch23(ch22_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch23(ch22_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch23(ch22_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch23(ch22_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch23(ch22_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch23(ch22_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch23(ch22_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch23(ch22_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch23(ch22_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch23(ch22_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch23(ch22_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch23(ch22_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch23(ch22_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch22(ch21_x_adc),//NLC output 
  .x_lin_ch22(ch21_x_lin),//ADC output 
  .section_limit_ch22(ch21_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch22(ch21_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch22(ch21_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch22(ch21_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch22(ch21_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch22(ch21_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch22(ch21_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch22(ch21_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch22(ch21_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch22(ch21_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch22(ch21_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch22(ch21_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch22(ch21_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch22(ch21_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch22(ch21_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch22(ch21_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch22(ch21_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch22(ch21_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch22(ch21_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch22(ch21_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch22(ch21_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch22(ch21_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch22(ch21_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch22(ch21_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch22(ch21_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch22(ch21_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch22(ch21_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch22(ch21_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch22(ch21_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch22(ch21_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch22(ch21_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch22(ch21_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch22(ch21_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch22(ch21_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch22(ch21_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch22(ch21_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch22(ch21_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch22(ch21_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch22(ch21_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch22(ch21_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch22(ch21_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch22(ch21_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch22(ch21_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch22(ch21_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch22(ch21_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch22(ch21_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch22(ch21_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch22(ch21_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch22(ch21_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch22(ch21_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch22(ch21_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch22(ch21_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch22(ch21_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch21(ch20_x_adc),//NLC output 
  .x_lin_ch21(ch20_x_lin),//ADC output 
  .section_limit_ch21(ch20_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch21(ch20_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch21(ch20_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch21(ch20_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch21(ch20_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch21(ch20_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch21(ch20_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch21(ch20_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch21(ch20_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch21(ch20_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch21(ch20_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch21(ch20_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch21(ch20_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch21(ch20_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch21(ch20_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch21(ch20_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch21(ch20_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch21(ch20_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch21(ch20_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch21(ch20_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch21(ch20_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch21(ch20_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch21(ch20_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch21(ch20_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch21(ch20_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch21(ch20_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch21(ch20_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch21(ch20_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch21(ch20_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch21(ch20_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch21(ch20_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch21(ch20_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch21(ch20_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch21(ch20_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch21(ch20_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch21(ch20_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch21(ch20_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch21(ch20_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch21(ch20_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch21(ch20_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch21(ch20_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch21(ch20_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch21(ch20_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch21(ch20_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch21(ch20_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch21(ch20_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch21(ch20_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch21(ch20_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch21(ch20_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch21(ch20_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch21(ch20_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch21(ch20_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch21(ch20_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch20(ch19_x_adc),//NLC output 
  .x_lin_ch20(ch19_x_lin),//ADC output 
  .section_limit_ch20(ch19_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch20(ch19_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch20(ch19_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch20(ch19_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch20(ch19_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch20(ch19_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch20(ch19_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch20(ch19_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch20(ch19_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch20(ch19_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch20(ch19_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch20(ch19_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch20(ch19_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch20(ch19_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch20(ch19_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch20(ch19_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch20(ch19_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch20(ch19_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch20(ch19_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch20(ch19_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch20(ch19_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch20(ch19_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch20(ch19_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch20(ch19_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch20(ch19_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch20(ch19_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch20(ch19_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch20(ch19_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch20(ch19_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch20(ch19_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch20(ch19_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch20(ch19_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch20(ch19_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch20(ch19_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch20(ch19_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch20(ch19_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch20(ch19_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch20(ch19_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch20(ch19_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch20(ch19_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch20(ch19_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch20(ch19_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch20(ch19_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch20(ch19_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch20(ch19_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch20(ch19_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch20(ch19_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch20(ch19_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch20(ch19_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch20(ch19_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch20(ch19_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch20(ch19_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch20(ch19_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch19(ch18_x_adc),//NLC output 
  .x_lin_ch19(ch18_x_lin),//ADC output 
  .section_limit_ch19(ch18_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch19(ch18_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch19(ch18_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch19(ch18_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch19(ch18_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch19(ch18_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch19(ch18_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch19(ch18_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch19(ch18_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch19(ch18_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch19(ch18_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch19(ch18_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch19(ch18_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch19(ch18_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch19(ch18_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch19(ch18_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch19(ch18_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch19(ch18_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch19(ch18_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch19(ch18_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch19(ch18_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch19(ch18_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch19(ch18_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch19(ch18_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch19(ch18_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch19(ch18_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch19(ch18_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch19(ch18_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch19(ch18_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch19(ch18_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch19(ch18_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch19(ch18_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch19(ch18_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch19(ch18_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch19(ch18_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch19(ch18_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch19(ch18_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch19(ch18_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch19(ch18_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch19(ch18_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch19(ch18_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch19(ch18_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch19(ch18_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch19(ch18_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch19(ch18_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch19(ch18_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch19(ch18_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch19(ch18_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch19(ch18_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch19(ch18_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch19(ch18_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch19(ch18_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch19(ch18_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch18(ch17_x_adc),//NLC output 
  .x_lin_ch18(ch17_x_lin),//ADC output 
  .section_limit_ch18(ch17_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch18(ch17_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch18(ch17_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch18(ch17_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch18(ch17_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch18(ch17_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch18(ch17_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch18(ch17_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch18(ch17_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch18(ch17_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch18(ch17_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch18(ch17_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch18(ch17_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch18(ch17_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch18(ch17_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch18(ch17_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch18(ch17_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch18(ch17_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch18(ch17_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch18(ch17_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch18(ch17_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch18(ch17_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch18(ch17_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch18(ch17_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch18(ch17_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch18(ch17_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch18(ch17_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch18(ch17_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch18(ch17_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch18(ch17_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch18(ch17_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch18(ch17_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch18(ch17_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch18(ch17_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch18(ch17_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch18(ch17_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch18(ch17_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch18(ch17_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch18(ch17_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch18(ch17_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch18(ch17_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch18(ch17_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch18(ch17_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch18(ch17_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch18(ch17_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch18(ch17_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch18(ch17_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch18(ch17_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch18(ch17_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch18(ch17_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch18(ch17_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch18(ch17_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch18(ch17_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch17(ch16_x_adc),//NLC output 
  .x_lin_ch17(ch16_x_lin),//ADC output 
  .section_limit_ch17(ch16_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch17(ch16_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch17(ch16_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch17(ch16_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch17(ch16_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch17(ch16_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch17(ch16_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch17(ch16_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch17(ch16_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch17(ch16_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch17(ch16_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch17(ch16_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch17(ch16_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch17(ch16_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch17(ch16_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch17(ch16_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch17(ch16_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch17(ch16_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch17(ch16_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch17(ch16_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch17(ch16_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch17(ch16_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch17(ch16_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch17(ch16_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch17(ch16_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch17(ch16_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch17(ch16_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch17(ch16_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch17(ch16_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch17(ch16_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch17(ch16_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch17(ch16_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch17(ch16_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch17(ch16_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch17(ch16_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch17(ch16_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch17(ch16_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch17(ch16_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch17(ch16_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch17(ch16_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch17(ch16_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch17(ch16_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch17(ch16_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch17(ch16_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch17(ch16_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch17(ch16_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch17(ch16_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch17(ch16_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch17(ch16_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch17(ch16_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch17(ch16_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch17(ch16_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch17(ch16_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch16(ch15_x_adc),//NLC output 
  .x_lin_ch16(ch15_x_lin),//ADC output 
  .section_limit_ch16(ch15_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch16(ch15_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch16(ch15_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch16(ch15_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch16(ch15_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch16(ch15_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch16(ch15_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch16(ch15_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch16(ch15_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch16(ch15_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch16(ch15_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch16(ch15_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch16(ch15_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch16(ch15_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch16(ch15_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch16(ch15_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch16(ch15_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch16(ch15_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch16(ch15_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch16(ch15_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch16(ch15_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch16(ch15_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch16(ch15_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch16(ch15_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch16(ch15_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch16(ch15_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch16(ch15_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch16(ch15_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch16(ch15_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch16(ch15_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch16(ch15_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch16(ch15_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch16(ch15_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch16(ch15_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch16(ch15_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch16(ch15_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch16(ch15_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch16(ch15_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch16(ch15_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch16(ch15_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch16(ch15_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch16(ch15_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch16(ch15_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch16(ch15_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch16(ch15_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch16(ch15_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch16(ch15_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch16(ch15_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch16(ch15_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch16(ch15_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch16(ch15_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch16(ch15_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch16(ch15_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch15(ch14_x_adc),//NLC output 
  .x_lin_ch15(ch14_x_lin),//ADC output 
  .section_limit_ch15(ch14_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch15(ch14_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch15(ch14_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch15(ch14_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch15(ch14_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch15(ch14_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch15(ch14_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch15(ch14_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch15(ch14_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch15(ch14_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch15(ch14_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch15(ch14_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch15(ch14_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch15(ch14_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch15(ch14_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch15(ch14_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch15(ch14_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch15(ch14_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch15(ch14_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch15(ch14_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch15(ch14_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch15(ch14_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch15(ch14_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch15(ch14_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch15(ch14_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch15(ch14_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch15(ch14_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch15(ch14_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch15(ch14_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch15(ch14_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch15(ch14_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch15(ch14_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch15(ch14_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch15(ch14_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch15(ch14_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch15(ch14_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch15(ch14_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch15(ch14_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch15(ch14_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch15(ch14_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch15(ch14_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch15(ch14_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch15(ch14_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch15(ch14_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch15(ch14_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch15(ch14_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch15(ch14_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch15(ch14_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch15(ch14_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch15(ch14_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch15(ch14_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch15(ch14_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch15(ch14_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch14(ch13_x_adc),//NLC output 
  .x_lin_ch14(ch13_x_lin),//ADC output 
  .section_limit_ch14(ch13_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch14(ch13_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch14(ch13_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch14(ch13_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch14(ch13_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch14(ch13_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch14(ch13_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch14(ch13_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch14(ch13_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch14(ch13_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch14(ch13_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch14(ch13_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch14(ch13_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch14(ch13_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch14(ch13_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch14(ch13_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch14(ch13_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch14(ch13_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch14(ch13_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch14(ch13_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch14(ch13_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch14(ch13_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch14(ch13_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch14(ch13_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch14(ch13_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch14(ch13_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch14(ch13_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch14(ch13_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch14(ch13_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch14(ch13_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch14(ch13_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch14(ch13_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch14(ch13_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch14(ch13_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch14(ch13_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch14(ch13_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch14(ch13_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch14(ch13_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch14(ch13_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch14(ch13_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch14(ch13_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch14(ch13_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch14(ch13_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch14(ch13_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch14(ch13_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch14(ch13_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch14(ch13_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch14(ch13_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch14(ch13_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch14(ch13_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch14(ch13_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch14(ch13_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch14(ch13_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch13(ch12_x_adc),//NLC output 
  .x_lin_ch13(ch12_x_lin),//ADC output 
  .section_limit_ch13(ch12_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch13(ch12_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch13(ch12_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch13(ch12_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch13(ch12_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch13(ch12_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch13(ch12_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch13(ch12_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch13(ch12_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch13(ch12_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch13(ch12_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch13(ch12_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch13(ch12_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch13(ch12_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch13(ch12_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch13(ch12_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch13(ch12_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch13(ch12_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch13(ch12_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch13(ch12_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch13(ch12_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch13(ch12_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch13(ch12_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch13(ch12_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch13(ch12_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch13(ch12_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch13(ch12_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch13(ch12_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch13(ch12_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch13(ch12_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch13(ch12_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch13(ch12_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch13(ch12_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch13(ch12_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch13(ch12_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch13(ch12_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch13(ch12_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch13(ch12_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch13(ch12_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch13(ch12_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch13(ch12_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch13(ch12_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch13(ch12_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch13(ch12_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch13(ch12_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch13(ch12_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch13(ch12_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch13(ch12_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch13(ch12_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch13(ch12_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch13(ch12_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch13(ch12_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch13(ch12_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch12(ch11_x_adc),//NLC output 
  .x_lin_ch12(ch11_x_lin),//ADC output 
  .section_limit_ch12(ch11_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch12(ch11_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch12(ch11_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch12(ch11_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch12(ch11_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch12(ch11_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch12(ch11_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch12(ch11_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch12(ch11_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch12(ch11_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch12(ch11_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch12(ch11_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch12(ch11_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch12(ch11_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch12(ch11_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch12(ch11_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch12(ch11_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch12(ch11_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch12(ch11_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch12(ch11_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch12(ch11_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch12(ch11_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch12(ch11_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch12(ch11_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch12(ch11_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch12(ch11_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch12(ch11_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch12(ch11_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch12(ch11_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch12(ch11_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch12(ch11_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch12(ch11_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch12(ch11_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch12(ch11_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch12(ch11_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch12(ch11_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch12(ch11_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch12(ch11_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch12(ch11_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch12(ch11_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch12(ch11_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch12(ch11_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch12(ch11_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch12(ch11_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch12(ch11_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch12(ch11_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch12(ch11_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch12(ch11_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch12(ch11_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch12(ch11_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch12(ch11_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch12(ch11_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch12(ch11_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch11(ch10_x_adc),//NLC output 
  .x_lin_ch11(ch10_x_lin),//ADC output 
  .section_limit_ch11(ch10_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch11(ch10_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch11(ch10_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch11(ch10_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch11(ch10_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch11(ch10_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch11(ch10_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch11(ch10_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch11(ch10_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch11(ch10_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch11(ch10_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch11(ch10_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch11(ch10_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch11(ch10_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch11(ch10_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch11(ch10_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch11(ch10_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch11(ch10_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch11(ch10_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch11(ch10_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch11(ch10_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch11(ch10_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch11(ch10_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch11(ch10_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch11(ch10_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch11(ch10_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch11(ch10_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch11(ch10_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch11(ch10_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch11(ch10_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch11(ch10_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch11(ch10_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch11(ch10_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch11(ch10_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch11(ch10_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch11(ch10_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch11(ch10_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch11(ch10_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch11(ch10_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch11(ch10_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch11(ch10_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch11(ch10_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch11(ch10_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch11(ch10_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch11(ch10_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch11(ch10_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch11(ch10_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch11(ch10_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch11(ch10_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch11(ch10_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch11(ch10_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch11(ch10_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch11(ch10_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch10(ch9_x_adc),//NLC output 
  .x_lin_ch10(ch9_x_lin),//ADC output 
  .section_limit_ch10(ch9_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch10(ch9_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch10(ch9_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch10(ch9_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch10(ch9_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch10(ch9_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch10(ch9_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch10(ch9_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch10(ch9_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch10(ch9_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch10(ch9_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch10(ch9_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch10(ch9_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch10(ch9_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch10(ch9_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch10(ch9_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch10(ch9_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch10(ch9_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch10(ch9_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch10(ch9_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch10(ch9_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch10(ch9_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch10(ch9_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch10(ch9_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch10(ch9_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch10(ch9_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch10(ch9_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch10(ch9_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch10(ch9_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch10(ch9_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch10(ch9_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch10(ch9_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch10(ch9_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch10(ch9_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch10(ch9_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch10(ch9_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch10(ch9_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch10(ch9_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch10(ch9_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch10(ch9_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch10(ch9_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch10(ch9_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch10(ch9_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch10(ch9_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch10(ch9_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch10(ch9_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch10(ch9_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch10(ch9_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch10(ch9_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch10(ch9_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch10(ch9_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch10(ch9_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch10(ch9_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch9(ch8_x_adc),//NLC output 
  .x_lin_ch9(ch8_x_lin),//ADC output 
  .section_limit_ch9(ch8_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch9(ch8_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch9(ch8_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch9(ch8_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch9(ch8_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch9(ch8_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch9(ch8_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch9(ch8_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch9(ch8_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch9(ch8_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch9(ch8_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch9(ch8_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch9(ch8_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch9(ch8_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch9(ch8_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch9(ch8_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch9(ch8_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch9(ch8_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch9(ch8_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch9(ch8_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch9(ch8_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch9(ch8_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch9(ch8_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch9(ch8_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch9(ch8_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch9(ch8_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch9(ch8_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch9(ch8_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch9(ch8_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch9(ch8_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch9(ch8_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch9(ch8_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch9(ch8_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch9(ch8_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch9(ch8_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch9(ch8_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch9(ch8_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch9(ch8_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch9(ch8_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch9(ch8_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch9(ch8_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch9(ch8_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch9(ch8_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch9(ch8_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch9(ch8_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch9(ch8_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch9(ch8_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch9(ch8_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch9(ch8_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch9(ch8_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch9(ch8_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch9(ch8_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch9(ch8_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch8(ch7_x_adc),//NLC output 
  .x_lin_ch8(ch7_x_lin),//ADC output 
  .section_limit_ch8(ch7_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch8(ch7_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch8(ch7_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch8(ch7_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch8(ch7_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch8(ch7_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch8(ch7_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch8(ch7_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch8(ch7_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch8(ch7_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch8(ch7_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch8(ch7_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch8(ch7_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch8(ch7_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch8(ch7_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch8(ch7_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch8(ch7_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch8(ch7_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch8(ch7_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch8(ch7_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch8(ch7_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch8(ch7_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch8(ch7_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch8(ch7_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch8(ch7_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch8(ch7_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch8(ch7_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch8(ch7_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch8(ch7_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch8(ch7_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch8(ch7_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch8(ch7_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch8(ch7_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch8(ch7_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch8(ch7_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch8(ch7_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch8(ch7_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch8(ch7_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch8(ch7_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch8(ch7_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch8(ch7_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch8(ch7_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch8(ch7_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch8(ch7_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch8(ch7_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch8(ch7_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch8(ch7_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch8(ch7_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch8(ch7_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch8(ch7_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch8(ch7_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch8(ch7_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch8(ch7_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch7(ch6_x_adc),//NLC output 
  .x_lin_ch7(ch6_x_lin),//ADC output 
  .section_limit_ch7(ch6_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch7(ch6_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch7(ch6_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch7(ch6_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch7(ch6_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch7(ch6_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch7(ch6_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch7(ch6_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch7(ch6_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch7(ch6_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch7(ch6_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch7(ch6_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch7(ch6_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch7(ch6_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch7(ch6_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch7(ch6_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch7(ch6_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch7(ch6_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch7(ch6_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch7(ch6_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch7(ch6_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch7(ch6_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch7(ch6_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch7(ch6_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch7(ch6_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch7(ch6_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch7(ch6_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch7(ch6_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch7(ch6_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch7(ch6_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch7(ch6_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch7(ch6_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch7(ch6_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch7(ch6_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch7(ch6_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch7(ch6_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch7(ch6_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch7(ch6_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch7(ch6_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch7(ch6_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch7(ch6_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch7(ch6_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch7(ch6_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch7(ch6_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch7(ch6_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch7(ch6_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch7(ch6_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch7(ch6_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch7(ch6_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch7(ch6_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch7(ch6_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch7(ch6_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch7(ch6_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch6(ch5_x_adc),//NLC output 
  .x_lin_ch6(ch5_x_lin),//ADC output 
  .section_limit_ch6(ch5_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch6(ch5_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch6(ch5_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch6(ch5_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch6(ch5_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch6(ch5_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch6(ch5_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch6(ch5_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch6(ch5_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch6(ch5_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch6(ch5_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch6(ch5_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch6(ch5_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch6(ch5_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch6(ch5_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch6(ch5_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch6(ch5_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch6(ch5_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch6(ch5_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch6(ch5_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch6(ch5_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch6(ch5_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch6(ch5_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch6(ch5_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch6(ch5_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch6(ch5_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch6(ch5_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch6(ch5_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch6(ch5_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch6(ch5_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch6(ch5_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch6(ch5_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch6(ch5_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch6(ch5_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch6(ch5_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch6(ch5_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch6(ch5_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch6(ch5_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch6(ch5_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch6(ch5_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch6(ch5_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch6(ch5_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch6(ch5_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch6(ch5_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch6(ch5_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch6(ch5_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch6(ch5_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch6(ch5_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch6(ch5_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch6(ch5_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch6(ch5_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch6(ch5_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch6(ch5_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch5(ch4_x_adc),//NLC output 
  .x_lin_ch5(ch4_x_lin),//ADC output 
  .section_limit_ch5(ch4_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch5(ch4_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch5(ch4_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch5(ch4_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch5(ch4_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch5(ch4_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch5(ch4_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch5(ch4_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch5(ch4_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch5(ch4_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch5(ch4_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch5(ch4_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch5(ch4_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch5(ch4_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch5(ch4_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch5(ch4_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch5(ch4_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch5(ch4_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch5(ch4_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch5(ch4_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch5(ch4_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch5(ch4_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch5(ch4_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch5(ch4_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch5(ch4_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch5(ch4_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch5(ch4_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch5(ch4_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch5(ch4_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch5(ch4_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch5(ch4_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch5(ch4_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch5(ch4_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch5(ch4_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch5(ch4_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch5(ch4_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch5(ch4_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch5(ch4_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch5(ch4_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch5(ch4_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch5(ch4_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch5(ch4_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch5(ch4_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch5(ch4_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch5(ch4_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch5(ch4_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch5(ch4_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch5(ch4_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch5(ch4_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch5(ch4_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch5(ch4_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch5(ch4_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch5(ch4_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch4(ch3_x_adc),//NLC output 
  .x_lin_ch4(ch3_x_lin),//ADC output 
  .section_limit_ch4(ch3_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch4(ch3_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch4(ch3_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch4(ch3_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch4(ch3_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch4(ch3_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch4(ch3_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch4(ch3_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch4(ch3_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch4(ch3_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch4(ch3_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch4(ch3_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch4(ch3_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch4(ch3_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch4(ch3_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch4(ch3_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch4(ch3_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch4(ch3_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch4(ch3_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch4(ch3_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch4(ch3_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch4(ch3_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch4(ch3_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch4(ch3_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch4(ch3_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch4(ch3_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch4(ch3_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch4(ch3_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch4(ch3_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch4(ch3_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch4(ch3_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch4(ch3_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch4(ch3_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch4(ch3_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch4(ch3_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch4(ch3_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch4(ch3_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch4(ch3_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch4(ch3_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch4(ch3_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch4(ch3_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch4(ch3_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch4(ch3_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch4(ch3_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch4(ch3_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch4(ch3_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch4(ch3_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch4(ch3_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch4(ch3_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch4(ch3_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch4(ch3_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch4(ch3_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch4(ch3_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch3(ch2_x_adc),//NLC output 
  .x_lin_ch3(ch2_x_lin),//ADC output 
  .section_limit_ch3(ch2_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch3(ch2_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch3(ch2_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch3(ch2_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch3(ch2_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch3(ch2_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch3(ch2_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch3(ch2_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch3(ch2_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch3(ch2_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch3(ch2_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch3(ch2_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch3(ch2_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch3(ch2_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch3(ch2_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch3(ch2_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch3(ch2_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch3(ch2_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch3(ch2_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch3(ch2_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch3(ch2_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch3(ch2_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch3(ch2_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch3(ch2_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch3(ch2_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch3(ch2_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch3(ch2_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch3(ch2_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch3(ch2_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch3(ch2_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch3(ch2_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch3(ch2_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch3(ch2_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch3(ch2_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch3(ch2_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch3(ch2_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch3(ch2_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch3(ch2_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch3(ch2_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch3(ch2_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch3(ch2_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch3(ch2_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch3(ch2_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch3(ch2_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch3(ch2_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch3(ch2_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch3(ch2_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch3(ch2_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch3(ch2_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch3(ch2_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch3(ch2_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch3(ch2_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch3(ch2_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch2(ch1_x_adc),//NLC output 
  .x_lin_ch2(ch1_x_lin),//ADC output 
  .section_limit_ch2(ch1_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch2(ch1_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch2(ch1_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch2(ch1_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch2(ch1_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch2(ch1_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch2(ch1_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch2(ch1_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch2(ch1_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch2(ch1_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch2(ch1_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch2(ch1_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch2(ch1_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch2(ch1_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch2(ch1_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch2(ch1_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch2(ch1_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch2(ch1_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch2(ch1_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch2(ch1_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch2(ch1_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch2(ch1_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch2(ch1_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch2(ch1_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch2(ch1_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch2(ch1_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch2(ch1_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch2(ch1_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch2(ch1_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch2(ch1_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch2(ch1_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch2(ch1_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch2(ch1_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch2(ch1_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch2(ch1_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch2(ch1_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch2(ch1_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch2(ch1_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch2(ch1_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch2(ch1_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch2(ch1_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch2(ch1_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch2(ch1_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch2(ch1_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch2(ch1_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch2(ch1_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch2(ch1_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch2(ch1_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch2(ch1_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch2(ch1_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch2(ch1_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch2(ch1_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch2(ch1_select_section_coefficients_coeff_1_0_porty), 

  .x_adc_ch1(ch0_x_adc),//NLC output 
  .x_lin_ch1(ch0_x_lin),//ADC output 
  .section_limit_ch1(ch0_section_limit),//X-value that separates the sections 
  .recip_stdev_4_ch1(ch0_select_section_coefficients_stdev_4_porty),//Reciprocal standard deviation for the centered and scaled fit  
  .recip_stdev_3_ch1(ch0_select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2_ch1(ch0_select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1_ch1(ch0_select_section_coefficients_stdev_1_porty), 
  .neg_mean_4_ch1(ch0_select_section_coefficients_mean_4_porty),//Negative meand for the centered and scaled fit  
  .neg_mean_3_ch1(ch0_select_section_coefficients_mean_3_porty), 
  .neg_mean_2_ch1(ch0_select_section_coefficients_mean_2_porty), 
  .neg_mean_1_ch1(ch0_select_section_coefficients_mean_1_porty), 
  .coeff_4_10_ch1(ch0_select_section_coefficients_coeff_4_10_porty), //Section 4 coefficients (x > 0, |x| > section_limit) 
  .coeff_4_9_ch1(ch0_select_section_coefficients_coeff_4_9_porty), 
  .coeff_4_8_ch1(ch0_select_section_coefficients_coeff_4_8_porty), 
  .coeff_4_7_ch1(ch0_select_section_coefficients_coeff_4_7_porty), 
  .coeff_4_6_ch1(ch0_select_section_coefficients_coeff_4_6_porty), 
  .coeff_4_5_ch1(ch0_select_section_coefficients_coeff_4_5_porty), 
  .coeff_4_4_ch1(ch0_select_section_coefficients_coeff_4_4_porty), 
  .coeff_4_3_ch1(ch0_select_section_coefficients_coeff_4_3_porty), 
  .coeff_4_2_ch1(ch0_select_section_coefficients_coeff_4_2_porty), 
  .coeff_4_1_ch1(ch0_select_section_coefficients_coeff_4_1_porty), 
  .coeff_4_0_ch1(ch0_select_section_coefficients_coeff_4_0_porty), 
  .coeff_3_10_ch1(ch0_select_section_coefficients_coeff_3_10_porty),//Section 3 coefficients (x > 0, |x| <= section_limit)  
  .coeff_3_9_ch1(ch0_select_section_coefficients_coeff_3_9_porty), 
  .coeff_3_8_ch1(ch0_select_section_coefficients_coeff_3_8_porty), 
  .coeff_3_7_ch1(ch0_select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6_ch1(ch0_select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5_ch1(ch0_select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4_ch1(ch0_select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3_ch1(ch0_select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2_ch1(ch0_select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1_ch1(ch0_select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0_ch1(ch0_select_section_coefficients_coeff_3_0_porty), 
  .coeff_2_10_ch1(ch0_select_section_coefficients_coeff_2_10_porty),//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  .coeff_2_9_ch1(ch0_select_section_coefficients_coeff_2_9_porty), 
  .coeff_2_8_ch1(ch0_select_section_coefficients_coeff_2_8_porty), 
  .coeff_2_7_ch1(ch0_select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6_ch1(ch0_select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5_ch1(ch0_select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4_ch1(ch0_select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3_ch1(ch0_select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2_ch1(ch0_select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1_ch1(ch0_select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0_ch1(ch0_select_section_coefficients_coeff_2_0_porty), 
  .coeff_1_10_ch1(ch0_select_section_coefficients_coeff_1_10_porty),//Section 1 coefficients (x <= 0, |x| > section_limit)  
  .coeff_1_9_ch1(ch0_select_section_coefficients_coeff_1_9_porty), 
  .coeff_1_8_ch1(ch0_select_section_coefficients_coeff_1_8_porty), 
  .coeff_1_7_ch1(ch0_select_section_coefficients_coeff_1_7_porty), 
  .coeff_1_6_ch1(ch0_select_section_coefficients_coeff_1_6_porty), 
  .coeff_1_5_ch1(ch0_select_section_coefficients_coeff_1_5_porty), 
  .coeff_1_4_ch1(ch0_select_section_coefficients_coeff_1_4_porty), 
  .coeff_1_3_ch1(ch0_select_section_coefficients_coeff_1_3_porty), 
  .coeff_1_2_ch1(ch0_select_section_coefficients_coeff_1_2_porty), 
  .coeff_1_1_ch1(ch0_select_section_coefficients_coeff_1_1_porty), 
  .coeff_1_0_ch1(ch0_select_section_coefficients_coeff_1_0_porty) 

);


endmodule

