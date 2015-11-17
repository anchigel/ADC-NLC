`timescale 1ns/100ps

module NLC_tb();

  reg clk;
  reg GlobalReset;
  reg [31:0] select_section_coefficients_stdev_3_porty; // ufix32
  reg [31:0] select_section_coefficients_stdev_2_porty; // ufix32
  reg [31:0] select_section_coefficients_stdev_1_porty; // ufix32
  
  reg [31:0] select_section_coefficients_mean_3_porty; // ufix32
  reg [31:0] select_section_coefficients_mean_2_porty; // ufix32
  reg [31:0] select_section_coefficients_mean_1_porty; // ufix32
  

  reg [31:0] select_section_coefficients_coeff_3_7_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_6_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_5_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_4_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_3_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_2_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_3_0_porty; // ufix32
  
  reg [31:0] select_section_coefficients_coeff_2_7_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_6_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_5_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_4_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_3_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_2_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_2_0_porty; // ufix32
  
  reg [31:0] select_section_coefficients_coeff_1_7_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_6_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_5_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_4_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_3_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_2_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_1_porty; // ufix32
  reg [31:0] select_section_coefficients_coeff_1_0_porty; // ufix32
  
  wire [20:0] x_lin; // sfix21
  reg [20:0] x_adc; // sfix21
  wire srdyo; // ufix1
  reg srdyi; // ufix1
  reg [19:0] section_limit1; // ufix20
  reg [19:0] section_limit2; // ufix20
  wire [2:0] o_state;
  wire [2:0] o_section;
  wire [20:0] o_abs_x;
  wire [31:0] o_test;
	
// Instantiate a Design Under Test (DUT)
NLC_3sec_1ch NLC00(
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
  .section_limit1(section_limit1),
  .section_limit2(section_limit2),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_3(select_section_coefficients_stdev_3_porty), 
  .recip_stdev_2(select_section_coefficients_stdev_2_porty), 
  .recip_stdev_1(select_section_coefficients_stdev_1_porty), 

  //Negative meand for the centered and scaled fit
  .neg_mean_3(select_section_coefficients_mean_3_porty), 
  .neg_mean_2(select_section_coefficients_mean_2_porty), 
  .neg_mean_1(select_section_coefficients_mean_1_porty), 

  //Section 3 coefficients  
  .coeff_3_7(select_section_coefficients_coeff_3_7_porty), 
  .coeff_3_6(select_section_coefficients_coeff_3_6_porty), 
  .coeff_3_5(select_section_coefficients_coeff_3_5_porty), 
  .coeff_3_4(select_section_coefficients_coeff_3_4_porty), 
  .coeff_3_3(select_section_coefficients_coeff_3_3_porty), 
  .coeff_3_2(select_section_coefficients_coeff_3_2_porty), 
  .coeff_3_1(select_section_coefficients_coeff_3_1_porty), 
  .coeff_3_0(select_section_coefficients_coeff_3_0_porty), 

  //Section 2 coefficients 
  .coeff_2_7(select_section_coefficients_coeff_2_7_porty), 
  .coeff_2_6(select_section_coefficients_coeff_2_6_porty), 
  .coeff_2_5(select_section_coefficients_coeff_2_5_porty), 
  .coeff_2_4(select_section_coefficients_coeff_2_4_porty), 
  .coeff_2_3(select_section_coefficients_coeff_2_3_porty), 
  .coeff_2_2(select_section_coefficients_coeff_2_2_porty), 
  .coeff_2_1(select_section_coefficients_coeff_2_1_porty), 
  .coeff_2_0(select_section_coefficients_coeff_2_0_porty), 

  //Section 1 coefficients
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
  //.o_test(o_test)
	);


// Oscillate the clock (cycle time is 162ns and 6.14Mhz)
always #81 clk = ~clk;
//always #80 i_srdyi;


initial begin
	clk = 1'b1;
	GlobalReset = 1'b1;
	#162 GlobalReset = 1'b0;
	
   select_section_coefficients_stdev_3_porty = 32'd951410944;// ufix32
   select_section_coefficients_stdev_2_porty = 32'd949696384;// ufix32
   select_section_coefficients_stdev_1_porty = 32'd950523200;// ufix32
   
   select_section_coefficients_mean_3_porty = 32'd1210133504;// ufix32
   select_section_coefficients_mean_2_porty = 32'd1170787328;// ufix32
   select_section_coefficients_mean_1_porty = 32'd3357243392;// ufix32
    
   select_section_coefficients_coeff_3_7_porty = 32'd1085902848;// ufix32
   select_section_coefficients_coeff_3_6_porty = 32'd1085352576;// ufix32
   select_section_coefficients_coeff_3_5_porty = 32'd3246574080;// ufix32
   select_section_coefficients_coeff_3_4_porty = 32'd1097485056;// ufix32
   select_section_coefficients_coeff_3_3_porty = 32'd1127626624;// ufix32
   select_section_coefficients_coeff_3_2_porty = 32'd1144894848;// ufix32
   select_section_coefficients_coeff_3_1_porty = 32'd1181071360;// ufix32
   select_section_coefficients_coeff_3_0_porty = 32'd1193700736;// ufix32
   
   select_section_coefficients_coeff_2_7_porty = 32'd0;// ufix32
   select_section_coefficients_coeff_2_6_porty = 32'd0;// ufix32
   select_section_coefficients_coeff_2_5_porty = 32'd0;// ufix32
   select_section_coefficients_coeff_2_4_porty = 32'd0;// ufix32
   select_section_coefficients_coeff_2_3_porty = 32'd1115878784;// ufix32
   select_section_coefficients_coeff_2_2_porty = 32'd3250852096;// ufix32
   select_section_coefficients_coeff_2_1_porty = 32'd1180184832;// ufix32
   select_section_coefficients_coeff_2_0_porty = 32'd3301803008;// ufix32
   
   select_section_coefficients_coeff_1_7_porty = 32'd0;// ufix32
   select_section_coefficients_coeff_1_6_porty = 32'd0;// ufix32
   select_section_coefficients_coeff_1_5_porty = 32'd1077916288;// ufix32
   select_section_coefficients_coeff_1_4_porty = 32'd3251922944;// ufix32
   select_section_coefficients_coeff_1_3_porty = 32'd1124916736;// ufix32
   select_section_coefficients_coeff_1_2_porty = 32'd3291201536;// ufix32
   select_section_coefficients_coeff_1_1_porty = 32'd1180122880;// ufix32
   select_section_coefficients_coeff_1_0_porty = 32'd3341627648; // ufix32
	
	section_limit1 = 20'd1201090048; // ufix20
	section_limit2 = 20'd3350180352; // ufix20
	
	//section 1
	x_adc = 21'd80000;
	srdyi = 1'b1;
	#162 srdyi = 1'b0; // ufix1
	#55000
	
  	//section 2
	x_adc = 21'd25000;
	srdyi = 1'b1;
	#162 srdyi = 1'b0; // ufix1
	#55000
	
	//section 2
	x_adc = -21'd25000;
	srdyi = 1'b1;
	#162 srdyi = 1'b0; // ufix1
	#55000
	
	//section 3
	x_adc = -21'd80000;
	srdyi = 1'b1;
	#162 srdyi = 1'b0; // ufix1
	#35000
	
	#55000 $stop;
	
	
	end
	
	endmodule