// Verilog netlist created by TD v4.5.12562
// Thu Dec 19 17:41:43 2019

`timescale 1ns / 1ps
module CPLD_SOC_AHB_TOP  // CPLD_SOC_AHB_TOP.v(1)
  (
  clkin,
  limit_l,
  limit_r,
  rst_n,
  dir,
  gpio_out,
  ledout,
  pwm
  );

  input clkin;  // CPLD_SOC_AHB_TOP.v(3)
  input [15:0] limit_l;  // CPLD_SOC_AHB_TOP.v(5)
  input [15:0] limit_r;  // CPLD_SOC_AHB_TOP.v(6)
  input rst_n;  // CPLD_SOC_AHB_TOP.v(4)
  output [15:0] dir;  // CPLD_SOC_AHB_TOP.v(7)
  output [31:0] gpio_out;  // CPLD_SOC_AHB_TOP.v(8)
  output [3:0] ledout;  // CPLD_SOC_AHB_TOP.v(10)
  output [15:0] pwm;  // CPLD_SOC_AHB_TOP.v(7)

  wire [31:0] freq0;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq1;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq2;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq3;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq4;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq5;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq6;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq7;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq8;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freq9;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freqA;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freqB;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freqC;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freqD;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freqE;  // CPLD_SOC_AHB_TOP.v(55)
  wire [31:0] freqF;  // CPLD_SOC_AHB_TOP.v(55)
  wire [3:0] n10;
  wire [31:0] n2;
  wire [31:0] n3;
  wire [3:0] n7;
  wire [3:0] n8;
  wire [3:0] n9;
  wire [32:0] pnum0;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum1;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum2;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum3;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum4;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum5;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum6;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum7;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum8;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnum9;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnumA;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnumB;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnumC;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnumD;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnumE;  // CPLD_SOC_AHB_TOP.v(54)
  wire [32:0] pnumF;  // CPLD_SOC_AHB_TOP.v(54)
  wire [23:0] pnumcnt0;  // CPLD_SOC_AHB_TOP.v(61)
  wire [23:0] pnumcnt1;  // CPLD_SOC_AHB_TOP.v(62)
  wire [23:0] pnumcnt2;  // CPLD_SOC_AHB_TOP.v(63)
  wire [23:0] pnumcnt3;  // CPLD_SOC_AHB_TOP.v(64)
  wire [23:0] pnumcnt4;  // CPLD_SOC_AHB_TOP.v(65)
  wire [23:0] pnumcnt5;  // CPLD_SOC_AHB_TOP.v(66)
  wire [23:0] pnumcnt6;  // CPLD_SOC_AHB_TOP.v(67)
  wire [23:0] pnumcnt7;  // CPLD_SOC_AHB_TOP.v(68)
  wire [23:0] pnumcnt8;  // CPLD_SOC_AHB_TOP.v(69)
  wire [23:0] pnumcnt9;  // CPLD_SOC_AHB_TOP.v(70)
  wire [23:0] pnumcntA;  // CPLD_SOC_AHB_TOP.v(71)
  wire [23:0] pnumcntB;  // CPLD_SOC_AHB_TOP.v(72)
  wire [23:0] pnumcntC;  // CPLD_SOC_AHB_TOP.v(73)
  wire [23:0] pnumcntD;  // CPLD_SOC_AHB_TOP.v(74)
  wire [23:0] pnumcntE;  // CPLD_SOC_AHB_TOP.v(75)
  wire [23:0] pnumcntF;  // CPLD_SOC_AHB_TOP.v(76)
  wire [31:0] pwm_start_stop;  // CPLD_SOC_AHB_TOP.v(52)
  wire [15:0] pwm_state_read;  // CPLD_SOC_AHB_TOP.v(78)
  wire [31:0] timer;  // CPLD_SOC_AHB_TOP.v(26)
  wire clk100m;  // CPLD_SOC_AHB_TOP.v(13)
  wire clk25m;  // CPLD_SOC_AHB_TOP.v(13)
  wire n0;
  wire n1;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n17;
  wire n18;
  wire n19;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n4;
  wire n5;
  wire n6;
  wire rstn;  // CPLD_SOC_AHB_TOP.v(13)

  OnePWM PWM0 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[16]),
    .Stop(pwm_start_stop[0]),
    .freq(freq0),
    .limit(n11),
    .pnum(pnum0[31:0]),
    .pnump(pnum0[32]),
    .RemaTxNum(pnumcnt0),
    .State(pwm_state_read[0]),
    .dir(dir[0]),
    .pwm(pwm[0]));  // CPLD_SOC_AHB_TOP.v(120)
  OnePWM PWM1 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[17]),
    .Stop(pwm_start_stop[1]),
    .freq(freq1),
    .limit(n12),
    .pnum(pnum1[31:0]),
    .pnump(pnum1[32]),
    .RemaTxNum(pnumcnt1),
    .State(pwm_state_read[1]),
    .dir(dir[1]),
    .pwm(pwm[1]));  // CPLD_SOC_AHB_TOP.v(121)
  OnePWM PWM2 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[18]),
    .Stop(pwm_start_stop[2]),
    .freq(freq2),
    .limit(n13),
    .pnum(pnum2[31:0]),
    .pnump(pnum2[32]),
    .RemaTxNum(pnumcnt2),
    .State(pwm_state_read[2]),
    .dir(dir[2]),
    .pwm(pwm[2]));  // CPLD_SOC_AHB_TOP.v(122)
  OnePWM PWM3 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[19]),
    .Stop(pwm_start_stop[3]),
    .freq(freq3),
    .limit(n14),
    .pnum(pnum3[31:0]),
    .pnump(pnum3[32]),
    .RemaTxNum(pnumcnt3),
    .State(pwm_state_read[3]),
    .dir(dir[3]),
    .pwm(pwm[3]));  // CPLD_SOC_AHB_TOP.v(123)
  OnePWM PWM4 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[20]),
    .Stop(pwm_start_stop[4]),
    .freq(freq4),
    .limit(n15),
    .pnum(pnum4[31:0]),
    .pnump(pnum4[32]),
    .RemaTxNum(pnumcnt4),
    .State(pwm_state_read[4]),
    .dir(dir[4]),
    .pwm(pwm[4]));  // CPLD_SOC_AHB_TOP.v(124)
  OnePWM PWM5 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[21]),
    .Stop(pwm_start_stop[5]),
    .freq(freq5),
    .limit(n16),
    .pnum(pnum5[31:0]),
    .pnump(pnum5[32]),
    .RemaTxNum(pnumcnt5),
    .State(pwm_state_read[5]),
    .dir(dir[5]),
    .pwm(pwm[5]));  // CPLD_SOC_AHB_TOP.v(125)
  OnePWM PWM6 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[22]),
    .Stop(pwm_start_stop[6]),
    .freq(freq6),
    .limit(n17),
    .pnum(pnum6[31:0]),
    .pnump(pnum6[32]),
    .RemaTxNum(pnumcnt6),
    .State(pwm_state_read[6]),
    .dir(dir[6]),
    .pwm(pwm[6]));  // CPLD_SOC_AHB_TOP.v(126)
  OnePWM PWM7 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[23]),
    .Stop(pwm_start_stop[7]),
    .freq(freq7),
    .limit(n18),
    .pnum(pnum7[31:0]),
    .pnump(pnum7[32]),
    .RemaTxNum(pnumcnt7),
    .State(pwm_state_read[7]),
    .dir(dir[7]),
    .pwm(pwm[7]));  // CPLD_SOC_AHB_TOP.v(127)
  OnePWM PWM8 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[24]),
    .Stop(pwm_start_stop[8]),
    .freq(freq8),
    .limit(n19),
    .pnum(pnum8[31:0]),
    .pnump(pnum8[32]),
    .RemaTxNum(pnumcnt8),
    .State(pwm_state_read[8]),
    .dir(dir[8]),
    .pwm(pwm[8]));  // CPLD_SOC_AHB_TOP.v(128)
  OnePWM PWM9 (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[25]),
    .Stop(pwm_start_stop[9]),
    .freq(freq9),
    .limit(n20),
    .pnum(pnum9[31:0]),
    .pnump(pnum9[32]),
    .RemaTxNum(pnumcnt9),
    .State(pwm_state_read[9]),
    .dir(dir[9]),
    .pwm(pwm[9]));  // CPLD_SOC_AHB_TOP.v(129)
  OnePWM PWMA (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[26]),
    .Stop(pwm_start_stop[10]),
    .freq(freqA),
    .limit(n21),
    .pnum(pnumA[31:0]),
    .pnump(pnumA[32]),
    .RemaTxNum(pnumcntA),
    .State(pwm_state_read[10]),
    .dir(dir[10]),
    .pwm(pwm[10]));  // CPLD_SOC_AHB_TOP.v(130)
  OnePWM PWMB (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[27]),
    .Stop(pwm_start_stop[11]),
    .freq(freqB),
    .limit(n22),
    .pnum(pnumB[31:0]),
    .pnump(pnumB[32]),
    .RemaTxNum(pnumcntB),
    .State(pwm_state_read[11]),
    .dir(dir[11]),
    .pwm(pwm[11]));  // CPLD_SOC_AHB_TOP.v(131)
  OnePWM PWMC (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[28]),
    .Stop(pwm_start_stop[12]),
    .freq(freqC),
    .limit(n23),
    .pnum(pnumC[31:0]),
    .pnump(pnumC[32]),
    .RemaTxNum(pnumcntC),
    .State(pwm_state_read[12]),
    .dir(dir[12]),
    .pwm(pwm[12]));  // CPLD_SOC_AHB_TOP.v(132)
  OnePWM PWMD (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[29]),
    .Stop(pwm_start_stop[13]),
    .freq(freqD),
    .limit(n24),
    .pnum(pnumD[31:0]),
    .pnump(pnumD[32]),
    .RemaTxNum(pnumcntD),
    .State(pwm_state_read[13]),
    .dir(dir[13]),
    .pwm(pwm[13]));  // CPLD_SOC_AHB_TOP.v(133)
  OnePWM PWME (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[30]),
    .Stop(pwm_start_stop[14]),
    .freq(freqE),
    .limit(n25),
    .pnum(pnumE[31:0]),
    .pnump(pnumE[32]),
    .RemaTxNum(pnumcntE),
    .State(pwm_state_read[14]),
    .dir(dir[14]),
    .pwm(pwm[14]));  // CPLD_SOC_AHB_TOP.v(134)
  OnePWM PWMF (
    .Clk100m(clk100m),
    .Rstn(rstn),
    .Start(pwm_start_stop[31]),
    .Stop(pwm_start_stop[15]),
    .freq(freqF),
    .limit(n26),
    .pnum(pnumF[31:0]),
    .pnump(pnumF[32]),
    .RemaTxNum(pnumcntF),
    .State(pwm_state_read[15]),
    .dir(dir[15]),
    .pwm(pwm[15]));  // CPLD_SOC_AHB_TOP.v(135)
  AHB U_AHB (
    .clk100m(clk100m),
    .clk25m(clk25m),
    .gpio_in(32'b0000000000000000000000000000000x),
    .limit_l(limit_l),
    .limit_r(limit_r),
    .pnumcnt0(pnumcnt0),
    .pnumcnt1(pnumcnt1),
    .pnumcnt2(pnumcnt2),
    .pnumcnt3(pnumcnt3),
    .pnumcnt4(pnumcnt4),
    .pnumcnt5(pnumcnt5),
    .pnumcnt6(pnumcnt6),
    .pnumcnt7(pnumcnt7),
    .pnumcnt8(pnumcnt8),
    .pnumcnt9(pnumcnt9),
    .pnumcntA(pnumcntA),
    .pnumcntB(pnumcntB),
    .pnumcntC(pnumcntC),
    .pnumcntD(pnumcntD),
    .pnumcntE(pnumcntE),
    .pnumcntF(pnumcntF),
    .pwm_state_read(pwm_state_read),
    .rst_n(rstn),
    .freq0(freq0),
    .freq1(freq1),
    .freq2(freq2),
    .freq3(freq3),
    .freq4(freq4),
    .freq5(freq5),
    .freq6(freq6),
    .freq7(freq7),
    .freq8(freq8),
    .freq9(freq9),
    .freqA(freqA),
    .freqB(freqB),
    .freqC(freqC),
    .freqD(freqD),
    .freqE(freqE),
    .freqF(freqF),
    .gpio_out(gpio_out),
    .pnum0(pnum0),
    .pnum1(pnum1),
    .pnum2(pnum2),
    .pnum3(pnum3),
    .pnum4(pnum4),
    .pnum5(pnum5),
    .pnum6(pnum6),
    .pnum7(pnum7),
    .pnum8(pnum8),
    .pnum9(pnum9),
    .pnumA(pnumA),
    .pnumB(pnumB),
    .pnumC(pnumC),
    .pnumD(pnumD),
    .pnumE(pnumE),
    .pnumF(pnumF),
    .pwm_start_stop(pwm_start_stop));  // CPLD_SOC_AHB_TOP.v(56)
  PLL U_PLL (
    .refclk(clkin),
    .reset(1'b0),
    .clk1_out(clk100m),
    .clk2_out(clk25m),
    .extlock(rstn));  // CPLD_SOC_AHB_TOP.v(14)
  add_pu32_pu32_o32 add0 (
    .i0(timer),
    .i1(32'b00000000000000000000000000000001),
    .o(n2));  // CPLD_SOC_AHB_TOP.v(35)
  eq_w32 eq0 (
    .i0(timer),
    .i1(32'b00001011111010111100000111111111),
    .o(n1));  // CPLD_SOC_AHB_TOP.v(32)
  eq_w32 eq1 (
    .i0(timer),
    .i1(32'b00000010111110101111000001111111),
    .o(n4));  // CPLD_SOC_AHB_TOP.v(42)
  eq_w32 eq2 (
    .i0(timer),
    .i1(32'b00000101111101011110000011111111),
    .o(n5));  // CPLD_SOC_AHB_TOP.v(44)
  eq_w32 eq3 (
    .i0(timer),
    .i1(32'b00001000111100001101000101111111),
    .o(n6));  // CPLD_SOC_AHB_TOP.v(46)
  binary_mux_s1_w32 mux0 (
    .i0(n2),
    .i1(32'b00000000000000000000000000000000),
    .sel(n1),
    .o(n3));  // CPLD_SOC_AHB_TOP.v(35)
  binary_mux_s1_w4 mux1 (
    .i0(ledout),
    .i1(4'b0111),
    .sel(n1),
    .o(n7));  // CPLD_SOC_AHB_TOP.v(49)
  binary_mux_s1_w4 mux2 (
    .i0(n7),
    .i1(4'b1011),
    .sel(n6),
    .o(n8));  // CPLD_SOC_AHB_TOP.v(49)
  binary_mux_s1_w4 mux3 (
    .i0(n8),
    .i1(4'b1101),
    .sel(n5),
    .o(n9));  // CPLD_SOC_AHB_TOP.v(49)
  binary_mux_s1_w4 mux4 (
    .i0(n9),
    .i1(4'b1110),
    .sel(n4),
    .o(n10));  // CPLD_SOC_AHB_TOP.v(49)
  reg_ar_as_w32 reg0 (
    .clk(clk25m),
    .d(n3),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(32'b00000000000000000000000000000000),
    .q(timer));  // CPLD_SOC_AHB_TOP.v(35)
  reg_ar_as_w4 reg1 (
    .clk(clk25m),
    .d(n10),
    .reset(4'b0000),
    .set({n0,n0,n0,n0}),
    .q(ledout));  // CPLD_SOC_AHB_TOP.v(49)
  and u10 (n18, limit_l[7], limit_r[7]);  // CPLD_SOC_AHB_TOP.v(127)
  and u11 (n19, limit_l[8], limit_r[8]);  // CPLD_SOC_AHB_TOP.v(128)
  and u12 (n20, limit_l[9], limit_r[9]);  // CPLD_SOC_AHB_TOP.v(129)
  and u13 (n21, limit_l[10], limit_r[10]);  // CPLD_SOC_AHB_TOP.v(130)
  and u14 (n22, limit_l[11], limit_r[11]);  // CPLD_SOC_AHB_TOP.v(131)
  and u15 (n23, limit_l[12], limit_r[12]);  // CPLD_SOC_AHB_TOP.v(132)
  and u16 (n24, limit_l[13], limit_r[13]);  // CPLD_SOC_AHB_TOP.v(133)
  and u17 (n25, limit_l[14], limit_r[14]);  // CPLD_SOC_AHB_TOP.v(134)
  and u18 (n26, limit_l[15], limit_r[15]);  // CPLD_SOC_AHB_TOP.v(135)
  not u2 (n0, rst_n);  // CPLD_SOC_AHB_TOP.v(30)
  and u3 (n11, limit_l[0], limit_r[0]);  // CPLD_SOC_AHB_TOP.v(120)
  and u4 (n12, limit_l[1], limit_r[1]);  // CPLD_SOC_AHB_TOP.v(121)
  and u5 (n13, limit_l[2], limit_r[2]);  // CPLD_SOC_AHB_TOP.v(122)
  and u6 (n14, limit_l[3], limit_r[3]);  // CPLD_SOC_AHB_TOP.v(123)
  and u7 (n15, limit_l[4], limit_r[4]);  // CPLD_SOC_AHB_TOP.v(124)
  and u8 (n16, limit_l[5], limit_r[5]);  // CPLD_SOC_AHB_TOP.v(125)
  and u9 (n17, limit_l[6], limit_r[6]);  // CPLD_SOC_AHB_TOP.v(126)

endmodule 

module OnePWM  // src/OnePWM.v(1)
  (
  Clk100m,
  Rstn,
  Start,
  Stop,
  freq,
  limit,
  pnum,
  pnump,
  RemaTxNum,
  State,
  dir,
  pwm
  );

  input Clk100m;  // src/OnePWM.v(2)
  input Rstn;  // src/OnePWM.v(2)
  input Start;  // src/OnePWM.v(3)
  input Stop;  // src/OnePWM.v(3)
  input [31:0] freq;  // src/OnePWM.v(4)
  input limit;  // src/OnePWM.v(6)
  input [31:0] pnum;  // src/OnePWM.v(5)
  input pnump;  // src/OnePWM.v(3)
  output [23:0] RemaTxNum /* synthesis keep=1 */ ;  // src/OnePWM.v(8)
  output State;  // src/OnePWM.v(7)
  output dir /* synthesis keep=1 */ ;  // src/OnePWM.v(9)
  output pwm /* synthesis keep=1 */ ;  // src/OnePWM.v(9)

  wire [26:0] FreCnt;  // src/OnePWM.v(13)
  wire [26:0] FreCntr;  // src/OnePWM.v(13)
  wire [27:0] n12;
  wire [26:0] n13;
  wire [26:0] n14;
  wire [26:0] n15;
  wire [26:0] n16;
  wire [31:0] n22;
  wire [31:0] n23;
  wire [24:0] n26;
  wire [23:0] n27;
  wire [23:0] n29;
  wire [23:0] n31;
  wire [31:0] pnumr;  // src/OnePWM.v(47)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n17;
  wire n18;
  wire n19;
  wire n2;
  wire n20;
  wire n21;
  wire n24;
  wire n25;
  wire n28;
  wire n3;
  wire n30;
  wire n32;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire stopreq /* synthesis keep=1 */ ;  // src/OnePWM.v(14)

  AL_DFF State_reg (
    .clk(Clk100m),
    .d(n10),
    .reset(n3),
    .set(1'b0),
    .q(State));  // src/OnePWM.v(26)
  AL_DFF dir_reg (
    .clk(Clk100m),
    .d(n32),
    .reset(1'b0),
    .set(1'b0),
    .q(dir));  // src/OnePWM.v(58)
  eq_w27 eq0 (
    .i0(FreCnt),
    .i1(27'b000000000000000000000000000),
    .o(n0));  // src/OnePWM.v(15)
  eq_w24 eq1 (
    .i0(RemaTxNum),
    .i1(24'b000000000000000000000001),
    .o(n5));  // src/OnePWM.v(25)
  eq_w27 eq2 (
    .i0(FreCnt),
    .i1({1'b0,FreCntr[26:1]}),
    .o(n17));  // src/OnePWM.v(41)
  eq_w27 eq3 (
    .i0(FreCnt),
    .i1(FreCntr),
    .o(n18));  // src/OnePWM.v(43)
  binary_mux_s1_w27 mux0 (
    .i0(n12[26:0]),
    .i1(freq[26:0]),
    .sel(n0),
    .o(n13));  // src/OnePWM.v(32)
  binary_mux_s1_w27 mux1 (
    .i0(FreCntr),
    .i1(freq[26:0]),
    .sel(n0),
    .o(n14));  // src/OnePWM.v(32)
  binary_mux_s1_w27 mux2 (
    .i0(27'b000000000000000000000000000),
    .i1(n13),
    .sel(n11),
    .o(n15));  // src/OnePWM.v(36)
  binary_mux_s1_w27 mux3 (
    .i0(FreCntr),
    .i1(n14),
    .sel(n11),
    .o(n16));  // src/OnePWM.v(36)
  binary_mux_s1_w32 mux4 (
    .i0(pnumr),
    .i1(32'b00000000000000000000000000000000),
    .sel(Start),
    .o(n22));  // src/OnePWM.v(48)
  binary_mux_s1_w32 mux5 (
    .i0(n22),
    .i1(pnum),
    .sel(pnump),
    .o(n23));  // src/OnePWM.v(48)
  binary_mux_s1_w24 mux6 (
    .i0(pnumr[23:0]),
    .i1(n26[23:0]),
    .sel(n25),
    .o(n27));  // src/OnePWM.v(56)
  binary_mux_s1_w24 mux7 (
    .i0(RemaTxNum),
    .i1(n27),
    .sel(n24),
    .o(n29));  // src/OnePWM.v(57)
  binary_mux_s1_w24 mux8 (
    .i0(n29),
    .i1(pnumr[23:0]),
    .sel(Start),
    .o(n31));  // src/OnePWM.v(57)
  ne_w32 neq0 (
    .i0({8'b00000000,RemaTxNum}),
    .i1(32'b00000000000000000000000000000000),
    .o(n25));  // src/OnePWM.v(55)
  AL_DFF pwm_reg (
    .clk(Clk100m),
    .d(n21),
    .reset(1'b0),
    .set(1'b0),
    .q(pwm));  // src/OnePWM.v(45)
  reg_ar_as_w27 reg0 (
    .clk(Clk100m),
    .d(n15),
    .reset(27'b000000000000000000000000000),
    .set(27'b000000000000000000000000000),
    .q(FreCnt));  // src/OnePWM.v(37)
  reg_ar_as_w27 reg1 (
    .clk(Clk100m),
    .d(n16),
    .reset(27'b000000000000000000000000000),
    .set(27'b000000000000000000000000000),
    .q(FreCntr));  // src/OnePWM.v(37)
  reg_ar_as_w32 reg2 (
    .clk(Clk100m),
    .d(n23),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(pnumr));  // src/OnePWM.v(48)
  reg_ar_as_w24 reg3 (
    .clk(Clk100m),
    .d(n31),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(RemaTxNum));  // src/OnePWM.v(58)
  AL_DFF stopreq_reg (
    .clk(Clk100m),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(stopreq));  // src/OnePWM.v(15)
  add_pu28_mu28_o28 sub0 (
    .i0({1'b0,FreCnt}),
    .i1(28'b0000000000000000000000000001),
    .o({open_n4,n12[26:0]}));  // src/OnePWM.v(32)
  add_pu25_mu25_o25 sub1 (
    .i0({1'b0,RemaTxNum}),
    .i1(25'b0000000000000000000000001),
    .o({open_n5,n26[23:0]}));  // src/OnePWM.v(55)
  AL_MUX u10 (
    .i0(1'b0),
    .i1(n9),
    .sel(limit),
    .o(n10));  // src/OnePWM.v(26)
  or u11 (n11, State, Start);  // src/OnePWM.v(30)
  AL_MUX u12 (
    .i0(pwm),
    .i1(1'b1),
    .sel(n18),
    .o(n19));  // src/OnePWM.v(44)
  AL_MUX u13 (
    .i0(n19),
    .i1(1'b0),
    .sel(n17),
    .o(n20));  // src/OnePWM.v(44)
  AL_MUX u14 (
    .i0(1'b0),
    .i1(n20),
    .sel(State),
    .o(n21));  // src/OnePWM.v(44)
  and u15 (n24, n0, State);  // src/OnePWM.v(54)
  AL_MUX u16 (
    .i0(pnumr[31]),
    .i1(dir),
    .sel(n25),
    .o(n28));  // src/OnePWM.v(56)
  AL_MUX u17 (
    .i0(dir),
    .i1(n28),
    .sel(n24),
    .o(n30));  // src/OnePWM.v(57)
  AL_MUX u18 (
    .i0(n30),
    .i1(pnumr[31]),
    .sel(Start),
    .o(n32));  // src/OnePWM.v(57)
  AL_MUX u2 (
    .i0(stopreq),
    .i1(1'b0),
    .sel(n0),
    .o(n1));  // src/OnePWM.v(15)
  AL_MUX u3 (
    .i0(n1),
    .i1(1'b1),
    .sel(Stop),
    .o(n2));  // src/OnePWM.v(15)
  not u4 (n3, Rstn);  // src/OnePWM.v(17)
  and u5 (n4, stopreq, n0);  // src/OnePWM.v(23)
  and u6 (n6, n5, n0);  // src/OnePWM.v(25)
  AL_MUX u7 (
    .i0(State),
    .i1(1'b0),
    .sel(n6),
    .o(n7));  // src/OnePWM.v(26)
  AL_MUX u8 (
    .i0(n7),
    .i1(1'b0),
    .sel(n4),
    .o(n8));  // src/OnePWM.v(26)
  AL_MUX u9 (
    .i0(n8),
    .i1(1'b1),
    .sel(Start),
    .o(n9));  // src/OnePWM.v(26)

endmodule 

module AHB  // src/AHB.v(1)
  (
  clk100m,
  clk25m,
  gpio_in,
  limit_l,
  limit_r,
  pnumcnt0,
  pnumcnt1,
  pnumcnt2,
  pnumcnt3,
  pnumcnt4,
  pnumcnt5,
  pnumcnt6,
  pnumcnt7,
  pnumcnt8,
  pnumcnt9,
  pnumcntA,
  pnumcntB,
  pnumcntC,
  pnumcntD,
  pnumcntE,
  pnumcntF,
  pwm_state_read,
  rst_n,
  freq0,
  freq1,
  freq2,
  freq3,
  freq4,
  freq5,
  freq6,
  freq7,
  freq8,
  freq9,
  freqA,
  freqB,
  freqC,
  freqD,
  freqE,
  freqF,
  gpio_out,
  pnum0,
  pnum1,
  pnum2,
  pnum3,
  pnum4,
  pnum5,
  pnum6,
  pnum7,
  pnum8,
  pnum9,
  pnumA,
  pnumB,
  pnumC,
  pnumD,
  pnumE,
  pnumF,
  pwm_start_stop
  );

  input clk100m;  // src/AHB.v(4)
  input clk25m;  // src/AHB.v(3)
  input [31:0] gpio_in;  // src/AHB.v(6)
  input [15:0] limit_l;  // src/AHB.v(7)
  input [15:0] limit_r;  // src/AHB.v(7)
  input [23:0] pnumcnt0;  // src/AHB.v(9)
  input [23:0] pnumcnt1;  // src/AHB.v(9)
  input [23:0] pnumcnt2;  // src/AHB.v(9)
  input [23:0] pnumcnt3;  // src/AHB.v(9)
  input [23:0] pnumcnt4;  // src/AHB.v(9)
  input [23:0] pnumcnt5;  // src/AHB.v(9)
  input [23:0] pnumcnt6;  // src/AHB.v(9)
  input [23:0] pnumcnt7;  // src/AHB.v(9)
  input [23:0] pnumcnt8;  // src/AHB.v(9)
  input [23:0] pnumcnt9;  // src/AHB.v(9)
  input [23:0] pnumcntA;  // src/AHB.v(9)
  input [23:0] pnumcntB;  // src/AHB.v(9)
  input [23:0] pnumcntC;  // src/AHB.v(9)
  input [23:0] pnumcntD;  // src/AHB.v(9)
  input [23:0] pnumcntE;  // src/AHB.v(9)
  input [23:0] pnumcntF;  // src/AHB.v(9)
  input [15:0] pwm_state_read;  // src/AHB.v(8)
  input rst_n;  // src/AHB.v(5)
  output [31:0] freq0;  // src/AHB.v(12)
  output [31:0] freq1;  // src/AHB.v(12)
  output [31:0] freq2;  // src/AHB.v(12)
  output [31:0] freq3;  // src/AHB.v(12)
  output [31:0] freq4;  // src/AHB.v(12)
  output [31:0] freq5;  // src/AHB.v(12)
  output [31:0] freq6;  // src/AHB.v(12)
  output [31:0] freq7;  // src/AHB.v(12)
  output [31:0] freq8;  // src/AHB.v(12)
  output [31:0] freq9;  // src/AHB.v(12)
  output [31:0] freqA;  // src/AHB.v(12)
  output [31:0] freqB;  // src/AHB.v(12)
  output [31:0] freqC;  // src/AHB.v(12)
  output [31:0] freqD;  // src/AHB.v(12)
  output [31:0] freqE;  // src/AHB.v(12)
  output [31:0] freqF;  // src/AHB.v(12)
  output [31:0] gpio_out;  // src/AHB.v(10)
  output [32:0] pnum0;  // src/AHB.v(13)
  output [32:0] pnum1;  // src/AHB.v(13)
  output [32:0] pnum2;  // src/AHB.v(13)
  output [32:0] pnum3;  // src/AHB.v(13)
  output [32:0] pnum4;  // src/AHB.v(13)
  output [32:0] pnum5;  // src/AHB.v(13)
  output [32:0] pnum6;  // src/AHB.v(13)
  output [32:0] pnum7;  // src/AHB.v(13)
  output [32:0] pnum8;  // src/AHB.v(13)
  output [32:0] pnum9;  // src/AHB.v(13)
  output [32:0] pnumA;  // src/AHB.v(13)
  output [32:0] pnumB;  // src/AHB.v(13)
  output [32:0] pnumC;  // src/AHB.v(13)
  output [32:0] pnumD;  // src/AHB.v(13)
  output [32:0] pnumE;  // src/AHB.v(13)
  output [32:0] pnumF;  // src/AHB.v(13)
  output [31:0] pwm_start_stop;  // src/AHB.v(11)

  wire [31:0] h2h_haddr;  // src/AHB.v(23)
  wire [31:0] h2h_haddrw;  // src/AHB.v(16)
  wire [31:0] h2h_hrdata;  // src/AHB.v(18)
  wire [31:0] h2h_hwdata;  // src/AHB.v(17)
  wire [31:0] n11;
  wire [31:0] n114;
  wire [31:0] n116;
  wire [31:0] n117;
  wire [31:0] n118;
  wire [31:0] n13;
  wire [31:0] n15;
  wire [31:0] n17;
  wire [31:0] n19;
  wire [31:0] n21;
  wire [31:0] n23;
  wire [31:0] n25;
  wire [31:0] n27;
  wire [31:0] n29;
  wire [31:0] n3;
  wire [31:0] n31;
  wire [31:0] n33;
  wire [31:0] n35;
  wire [31:0] n37;
  wire [31:0] n39;
  wire [31:0] n40;
  wire [31:0] n41;
  wire [31:0] n42;
  wire [32:0] n46;
  wire [32:0] n48;
  wire [31:0] n5;
  wire [32:0] n52;
  wire [32:0] n54;
  wire [32:0] n56;
  wire [32:0] n58;
  wire [32:0] n60;
  wire [32:0] n62;
  wire [32:0] n64;
  wire [32:0] n66;
  wire [32:0] n68;
  wire [32:0] n70;
  wire [32:0] n72;
  wire [32:0] n74;
  wire [32:0] n76;
  wire [32:0] n78;
  wire [31:0] n80;
  wire [31:0] n9;
  wire h2h_hwrite;  // src/AHB.v(22)
  wire h2h_hwritew;  // src/AHB.v(19)
  wire n0;
  wire n1;
  wire n10;
  wire n100;
  wire n101;
  wire n102;
  wire n103;
  wire n104;
  wire n105;
  wire n106;
  wire n107;
  wire n108;
  wire n109;
  wire n110;
  wire n111;
  wire n112;
  wire n113;
  wire n115;
  wire n12;
  wire n14;
  wire n16;
  wire n18;
  wire n2;
  wire n20;
  wire n22;
  wire n24;
  wire n26;
  wire n28;
  wire n30;
  wire n32;
  wire n34;
  wire n36;
  wire n38;
  wire n4;
  wire n43;
  wire n44;
  wire n45;
  wire n47;
  wire n49;
  wire n50;
  wire n51;
  wire n53;
  wire n55;
  wire n57;
  wire n59;
  wire n6;
  wire n61;
  wire n63;
  wire n65;
  wire n67;
  wire n69;
  wire n7;
  wire n71;
  wire n73;
  wire n75;
  wire n77;
  wire n79;
  wire n8;
  wire n81;
  wire n82;
  wire n83;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n88;
  wire n89;
  wire n90;
  wire n91;
  wire n92;
  wire n93;
  wire n94;
  wire n95;
  wire n96;
  wire n97;
  wire n98;
  wire n99;

  M3WithAHB M3WithAHB (
    .h2h_hrdata(h2h_hrdata),
    .h2h_hreadyout(1'b1),
    .h2h_hresp(2'b00),
    .h2h_mclk(clk100m),
    .h2h_rstn(rst_n),
    .ppm_clk(clk25m),
    .h2h_haddr({open_n0,open_n1,open_n2,open_n3,open_n4,open_n5,open_n6,open_n7,open_n8,open_n9,open_n10,open_n11,open_n12,open_n13,open_n14,open_n15,open_n16,h2h_haddrw[14:2],open_n17,open_n18}),
    .h2h_hwdata(h2h_hwdata),
    .h2h_hwrite(h2h_hwritew));  // src/AHB.v(28)
  eq_w2 eq0 (
    .i0(h2h_haddr[14:13]),
    .i1(2'b01),
    .o(n0));  // src/AHB.v(46)
  eq_w2 eq1 (
    .i0(h2h_haddr[14:13]),
    .i1(2'b00),
    .o(n6));  // src/AHB.v(48)
  eq_w2 eq2 (
    .i0(h2h_haddr[14:13]),
    .i1(2'b11),
    .o(n43));  // src/AHB.v(67)
  eq_w2 eq3 (
    .i0(h2h_haddr[14:13]),
    .i1(2'b10),
    .o(n49));  // src/AHB.v(69)
  AL_DFF h2h_hwrite_reg (
    .clk(clk100m),
    .d(h2h_hwritew),
    .reset(1'b0),
    .set(1'b0),
    .q(h2h_hwrite));  // src/AHB.v(24)
  binary_mux_s1_w32 mux0 (
    .i0(freq0),
    .i1(h2h_hwdata),
    .sel(n2),
    .o(n3));  // src/AHB.v(46)
  binary_mux_s1_w32 mux1 (
    .i0(freq1),
    .i1(h2h_hwdata),
    .sel(n4),
    .o(n5));  // src/AHB.v(47)
  binary_mux_s1_w32 mux10 (
    .i0(freqA),
    .i1(h2h_hwdata),
    .sel(n24),
    .o(n25));  // src/AHB.v(56)
  binary_mux_s1_w32 mux11 (
    .i0(freqB),
    .i1(h2h_hwdata),
    .sel(n26),
    .o(n27));  // src/AHB.v(57)
  binary_mux_s1_w32 mux12 (
    .i0(freqC),
    .i1(h2h_hwdata),
    .sel(n28),
    .o(n29));  // src/AHB.v(58)
  binary_mux_s1_w32 mux13 (
    .i0(freqD),
    .i1(h2h_hwdata),
    .sel(n30),
    .o(n31));  // src/AHB.v(60)
  binary_mux_s1_w32 mux14 (
    .i0(freqE),
    .i1(h2h_hwdata),
    .sel(n32),
    .o(n33));  // src/AHB.v(61)
  binary_mux_s1_w32 mux15 (
    .i0(freqF),
    .i1(h2h_hwdata),
    .sel(n34),
    .o(n35));  // src/AHB.v(62)
  binary_mux_s1_w32 mux16 (
    .i0(gpio_out),
    .i1(n40),
    .sel(n38),
    .o(n41));  // src/AHB.v(64)
  binary_mux_s1_w32 mux17 (
    .i0(n41),
    .i1(n37),
    .sel(n36),
    .o(n42));  // src/AHB.v(64)
  binary_mux_s1_w33 mux18 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n45),
    .o(n46));  // src/AHB.v(67)
  binary_mux_s1_w33 mux19 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n47),
    .o(n48));  // src/AHB.v(68)
  binary_mux_s1_w32 mux2 (
    .i0(freq2),
    .i1(h2h_hwdata),
    .sel(n8),
    .o(n9));  // src/AHB.v(48)
  binary_mux_s1_w33 mux20 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n51),
    .o(n52));  // src/AHB.v(69)
  binary_mux_s1_w33 mux21 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n53),
    .o(n54));  // src/AHB.v(70)
  binary_mux_s1_w33 mux22 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n55),
    .o(n56));  // src/AHB.v(71)
  binary_mux_s1_w33 mux23 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n57),
    .o(n58));  // src/AHB.v(72)
  binary_mux_s1_w33 mux24 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n59),
    .o(n60));  // src/AHB.v(73)
  binary_mux_s1_w33 mux25 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n61),
    .o(n62));  // src/AHB.v(74)
  binary_mux_s1_w33 mux26 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n63),
    .o(n64));  // src/AHB.v(75)
  binary_mux_s1_w33 mux27 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n65),
    .o(n66));  // src/AHB.v(76)
  binary_mux_s1_w33 mux28 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n67),
    .o(n68));  // src/AHB.v(77)
  binary_mux_s1_w33 mux29 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n69),
    .o(n70));  // src/AHB.v(78)
  binary_mux_s1_w32 mux3 (
    .i0(freq3),
    .i1(h2h_hwdata),
    .sel(n10),
    .o(n11));  // src/AHB.v(49)
  binary_mux_s1_w33 mux30 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n71),
    .o(n72));  // src/AHB.v(79)
  binary_mux_s1_w33 mux31 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n73),
    .o(n74));  // src/AHB.v(80)
  binary_mux_s1_w33 mux32 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n75),
    .o(n76));  // src/AHB.v(81)
  binary_mux_s1_w33 mux33 (
    .i0(33'b000000000000000000000000000000000),
    .i1({1'b1,h2h_hwdata}),
    .sel(n77),
    .o(n78));  // src/AHB.v(82)
  binary_mux_s1_w32 mux34 (
    .i0(32'b00000000000000000000000000000000),
    .i1(h2h_hwdata),
    .sel(n79),
    .o(n80));  // src/AHB.v(84)
  binary_mux_s1_w32 mux35 (
    .i0(h2h_hrdata),
    .i1(n116),
    .sel(n115),
    .o(n117));  // src/AHB.v(114)
  binary_mux_s1_w32 mux36 (
    .i0(n117),
    .i1(n114),
    .sel(n82),
    .o(n118));  // src/AHB.v(114)
  binary_mux_s1_w32 mux4 (
    .i0(freq4),
    .i1(h2h_hwdata),
    .sel(n12),
    .o(n13));  // src/AHB.v(50)
  binary_mux_s1_w32 mux5 (
    .i0(freq5),
    .i1(h2h_hwdata),
    .sel(n14),
    .o(n15));  // src/AHB.v(51)
  binary_mux_s1_w32 mux6 (
    .i0(freq6),
    .i1(h2h_hwdata),
    .sel(n16),
    .o(n17));  // src/AHB.v(52)
  binary_mux_s1_w32 mux7 (
    .i0(freq7),
    .i1(h2h_hwdata),
    .sel(n18),
    .o(n19));  // src/AHB.v(53)
  binary_mux_s1_w32 mux8 (
    .i0(freq8),
    .i1(h2h_hwdata),
    .sel(n20),
    .o(n21));  // src/AHB.v(54)
  binary_mux_s1_w32 mux9 (
    .i0(freq9),
    .i1(h2h_hwdata),
    .sel(n22),
    .o(n23));  // src/AHB.v(55)
  reg_ar_as_w13 reg0 (
    .clk(clk100m),
    .d(h2h_haddrw[14:2]),
    .reset(13'b0000000000000),
    .set(13'b0000000000000),
    .q(h2h_haddr[14:2]));  // src/AHB.v(25)
  reg_ar_as_w32 reg1 (
    .clk(clk100m),
    .d(n3),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq0));  // src/AHB.v(46)
  reg_ar_as_w32 reg10 (
    .clk(clk100m),
    .d(n23),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq9));  // src/AHB.v(55)
  reg_ar_as_w32 reg11 (
    .clk(clk100m),
    .d(n25),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freqA));  // src/AHB.v(56)
  reg_ar_as_w32 reg12 (
    .clk(clk100m),
    .d(n27),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freqB));  // src/AHB.v(57)
  reg_ar_as_w32 reg13 (
    .clk(clk100m),
    .d(n29),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freqC));  // src/AHB.v(58)
  reg_ar_as_w32 reg14 (
    .clk(clk100m),
    .d(n31),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freqD));  // src/AHB.v(60)
  reg_ar_as_w32 reg15 (
    .clk(clk100m),
    .d(n33),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freqE));  // src/AHB.v(61)
  reg_ar_as_w32 reg16 (
    .clk(clk100m),
    .d(n35),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freqF));  // src/AHB.v(62)
  reg_ar_as_w32 reg17 (
    .clk(clk100m),
    .d(n42),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(gpio_out));  // src/AHB.v(64)
  reg_ar_as_w33 reg18 (
    .clk(clk100m),
    .d(n46),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum0));  // src/AHB.v(67)
  reg_ar_as_w33 reg19 (
    .clk(clk100m),
    .d(n48),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum1));  // src/AHB.v(68)
  reg_ar_as_w32 reg2 (
    .clk(clk100m),
    .d(n5),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq1));  // src/AHB.v(47)
  reg_ar_as_w33 reg20 (
    .clk(clk100m),
    .d(n52),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum2));  // src/AHB.v(69)
  reg_ar_as_w33 reg21 (
    .clk(clk100m),
    .d(n54),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum3));  // src/AHB.v(70)
  reg_ar_as_w33 reg22 (
    .clk(clk100m),
    .d(n56),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum4));  // src/AHB.v(71)
  reg_ar_as_w33 reg23 (
    .clk(clk100m),
    .d(n58),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum5));  // src/AHB.v(72)
  reg_ar_as_w33 reg24 (
    .clk(clk100m),
    .d(n60),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum6));  // src/AHB.v(73)
  reg_ar_as_w33 reg25 (
    .clk(clk100m),
    .d(n62),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum7));  // src/AHB.v(74)
  reg_ar_as_w33 reg26 (
    .clk(clk100m),
    .d(n64),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum8));  // src/AHB.v(75)
  reg_ar_as_w33 reg27 (
    .clk(clk100m),
    .d(n66),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnum9));  // src/AHB.v(76)
  reg_ar_as_w33 reg28 (
    .clk(clk100m),
    .d(n68),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnumA));  // src/AHB.v(77)
  reg_ar_as_w33 reg29 (
    .clk(clk100m),
    .d(n70),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnumB));  // src/AHB.v(78)
  reg_ar_as_w32 reg3 (
    .clk(clk100m),
    .d(n9),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq2));  // src/AHB.v(48)
  reg_ar_as_w33 reg30 (
    .clk(clk100m),
    .d(n72),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnumC));  // src/AHB.v(79)
  reg_ar_as_w33 reg31 (
    .clk(clk100m),
    .d(n74),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnumD));  // src/AHB.v(80)
  reg_ar_as_w33 reg32 (
    .clk(clk100m),
    .d(n76),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnumE));  // src/AHB.v(81)
  reg_ar_as_w33 reg33 (
    .clk(clk100m),
    .d(n78),
    .reset(33'b000000000000000000000000000000000),
    .set(33'b000000000000000000000000000000000),
    .q(pnumF));  // src/AHB.v(82)
  reg_ar_as_w32 reg34 (
    .clk(clk100m),
    .d(n80),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(pwm_start_stop));  // src/AHB.v(84)
  reg_ar_as_w32 reg35 (
    .clk(clk100m),
    .d(n118),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(h2h_hrdata));  // src/AHB.v(115)
  reg_ar_as_w32 reg4 (
    .clk(clk100m),
    .d(n11),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq3));  // src/AHB.v(49)
  reg_ar_as_w32 reg5 (
    .clk(clk100m),
    .d(n13),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq4));  // src/AHB.v(50)
  reg_ar_as_w32 reg6 (
    .clk(clk100m),
    .d(n15),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq5));  // src/AHB.v(51)
  reg_ar_as_w32 reg7 (
    .clk(clk100m),
    .d(n17),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq6));  // src/AHB.v(52)
  reg_ar_as_w32 reg8 (
    .clk(clk100m),
    .d(n19),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq7));  // src/AHB.v(53)
  reg_ar_as_w32 reg9 (
    .clk(clk100m),
    .d(n21),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(freq8));  // src/AHB.v(54)
  onehot_mux_s12_w32 sel0 (
    .i0(h2h_hrdata),
    .i1({8'b00000000,pnumcntA}),
    .i10({8'b00000000,pnumcnt1}),
    .i11({8'b00000000,pnumcnt0}),
    .i2({8'b00000000,pnumcnt9}),
    .i3({8'b00000000,pnumcnt8}),
    .i4({8'b00000000,pnumcnt7}),
    .i5({8'b00000000,pnumcnt6}),
    .i6({8'b00000000,pnumcnt5}),
    .i7({8'b00000000,pnumcnt4}),
    .i8({8'b00000000,pnumcnt3}),
    .i9({8'b00000000,pnumcnt2}),
    .sel({h2h_haddr[2],n84,n87,n90,n93,n96,n99,n102,n105,n108,n111,n113}),
    .o(n114));  // src/AHB.v(101)
  onehot_mux_s9_w32 sel1 (
    .i0(h2h_hrdata),
    .i1({limit_l,limit_r}),
    .i2(gpio_in),
    .i3({pwm_state_read,pwm_state_read}),
    .i4({8'b00000000,pnumcntF}),
    .i5({8'b00000000,pnumcntE}),
    .i6({8'b00000000,pnumcntD}),
    .i7({8'b00000000,pnumcntC}),
    .i8({8'b00000000,pnumcntB}),
    .sel({h2h_haddr[2],n84,n87,n90,n93,n96,n99,n102,n104}),
    .o(n116));  // src/AHB.v(113)
  or u10 (n37[21], gpio_out[21], h2h_hwdata[21]);  // src/AHB.v(63)
  and u100 (n40[27], gpio_out[27], n39[27]);  // src/AHB.v(64)
  and u101 (n77, n44, h2h_haddr[4]);  // src/AHB.v(82)
  and u102 (n40[26], gpio_out[26], n39[26]);  // src/AHB.v(64)
  and u103 (n40[25], gpio_out[25], n39[25]);  // src/AHB.v(64)
  and u104 (n79, n44, h2h_haddr[7]);  // src/AHB.v(83)
  not u105 (n81, h2h_hwrite);  // src/AHB.v(88)
  and u106 (n40[24], gpio_out[24], n39[24]);  // src/AHB.v(64)
  and u107 (n82, n81, n6);  // src/AHB.v(88)
  not u108 (n83, h2h_haddr[2]);  // src/AHB.v(101)
  and u109 (n84, h2h_haddr[3], n83);  // src/AHB.v(101)
  and u11 (n10, n7, h2h_haddr[3]);  // src/AHB.v(49)
  or u110 (n85, h2h_haddr[2], h2h_haddr[3]);  // src/AHB.v(101)
  not u111 (n86, n85);  // src/AHB.v(101)
  and u112 (n87, h2h_haddr[4], n86);  // src/AHB.v(101)
  or u113 (n88, n85, h2h_haddr[4]);  // src/AHB.v(101)
  not u114 (n89, n88);  // src/AHB.v(101)
  and u115 (n90, h2h_haddr[5], n89);  // src/AHB.v(101)
  or u116 (n91, n88, h2h_haddr[5]);  // src/AHB.v(101)
  not u117 (n92, n91);  // src/AHB.v(101)
  and u118 (n93, h2h_haddr[6], n92);  // src/AHB.v(101)
  or u119 (n94, n91, h2h_haddr[6]);  // src/AHB.v(101)
  or u12 (n37[20], gpio_out[20], h2h_hwdata[20]);  // src/AHB.v(63)
  not u120 (n95, n94);  // src/AHB.v(101)
  and u121 (n96, h2h_haddr[7], n95);  // src/AHB.v(101)
  or u122 (n97, n94, h2h_haddr[7]);  // src/AHB.v(101)
  not u123 (n98, n97);  // src/AHB.v(101)
  and u124 (n99, h2h_haddr[8], n98);  // src/AHB.v(101)
  or u125 (n100, n97, h2h_haddr[8]);  // src/AHB.v(101)
  not u126 (n101, n100);  // src/AHB.v(101)
  and u127 (n102, h2h_haddr[9], n101);  // src/AHB.v(101)
  or u128 (n103, n100, h2h_haddr[9]);  // src/AHB.v(101)
  not u129 (n104, n103);  // src/AHB.v(101)
  or u13 (n37[19], gpio_out[19], h2h_hwdata[19]);  // src/AHB.v(63)
  and u130 (n105, h2h_haddr[10], n104);  // src/AHB.v(101)
  or u131 (n106, n103, h2h_haddr[10]);  // src/AHB.v(101)
  not u132 (n107, n106);  // src/AHB.v(101)
  and u133 (n108, h2h_haddr[11], n107);  // src/AHB.v(101)
  or u134 (n109, n106, h2h_haddr[11]);  // src/AHB.v(101)
  not u135 (n110, n109);  // src/AHB.v(101)
  and u136 (n111, h2h_haddr[12], n110);  // src/AHB.v(101)
  or u137 (n112, n109, h2h_haddr[12]);  // src/AHB.v(101)
  not u138 (n113, n112);  // src/AHB.v(101)
  and u139 (n40[23], gpio_out[23], n39[23]);  // src/AHB.v(64)
  and u14 (n12, n7, h2h_haddr[4]);  // src/AHB.v(50)
  and u140 (n40[22], gpio_out[22], n39[22]);  // src/AHB.v(64)
  and u141 (n115, n81, n0);  // src/AHB.v(103)
  or u142 (n37[31], gpio_out[31], h2h_hwdata[31]);  // src/AHB.v(63)
  or u143 (n37[30], gpio_out[30], h2h_hwdata[30]);  // src/AHB.v(63)
  or u144 (n37[29], gpio_out[29], h2h_hwdata[29]);  // src/AHB.v(63)
  or u145 (n37[28], gpio_out[28], h2h_hwdata[28]);  // src/AHB.v(63)
  or u146 (n37[27], gpio_out[27], h2h_hwdata[27]);  // src/AHB.v(63)
  or u147 (n37[26], gpio_out[26], h2h_hwdata[26]);  // src/AHB.v(63)
  or u148 (n37[25], gpio_out[25], h2h_hwdata[25]);  // src/AHB.v(63)
  and u149 (n40[21], gpio_out[21], n39[21]);  // src/AHB.v(64)
  or u15 (n37[18], gpio_out[18], h2h_hwdata[18]);  // src/AHB.v(63)
  and u150 (n40[20], gpio_out[20], n39[20]);  // src/AHB.v(64)
  and u151 (n40[19], gpio_out[19], n39[19]);  // src/AHB.v(64)
  and u152 (n40[18], gpio_out[18], n39[18]);  // src/AHB.v(64)
  and u153 (n40[17], gpio_out[17], n39[17]);  // src/AHB.v(64)
  and u154 (n40[16], gpio_out[16], n39[16]);  // src/AHB.v(64)
  and u155 (n40[15], gpio_out[15], n39[15]);  // src/AHB.v(64)
  and u156 (n40[14], gpio_out[14], n39[14]);  // src/AHB.v(64)
  and u157 (n40[13], gpio_out[13], n39[13]);  // src/AHB.v(64)
  and u158 (n40[12], gpio_out[12], n39[12]);  // src/AHB.v(64)
  and u159 (n40[11], gpio_out[11], n39[11]);  // src/AHB.v(64)
  or u16 (n37[17], gpio_out[17], h2h_hwdata[17]);  // src/AHB.v(63)
  and u160 (n40[10], gpio_out[10], n39[10]);  // src/AHB.v(64)
  and u161 (n40[9], gpio_out[9], n39[9]);  // src/AHB.v(64)
  and u162 (n40[8], gpio_out[8], n39[8]);  // src/AHB.v(64)
  and u163 (n40[7], gpio_out[7], n39[7]);  // src/AHB.v(64)
  and u164 (n40[6], gpio_out[6], n39[6]);  // src/AHB.v(64)
  and u165 (n40[5], gpio_out[5], n39[5]);  // src/AHB.v(64)
  and u166 (n40[4], gpio_out[4], n39[4]);  // src/AHB.v(64)
  and u167 (n40[3], gpio_out[3], n39[3]);  // src/AHB.v(64)
  and u168 (n40[2], gpio_out[2], n39[2]);  // src/AHB.v(64)
  and u169 (n40[1], gpio_out[1], n39[1]);  // src/AHB.v(64)
  and u17 (n14, n7, h2h_haddr[5]);  // src/AHB.v(51)
  and u170 (n40[0], gpio_out[0], n39[0]);  // src/AHB.v(64)
  or u18 (n37[16], gpio_out[16], h2h_hwdata[16]);  // src/AHB.v(63)
  or u19 (n37[15], gpio_out[15], h2h_hwdata[15]);  // src/AHB.v(63)
  and u2 (n1, h2h_hwrite, n0);  // src/AHB.v(46)
  and u20 (n16, n7, h2h_haddr[6]);  // src/AHB.v(52)
  or u21 (n37[14], gpio_out[14], h2h_hwdata[14]);  // src/AHB.v(63)
  or u22 (n37[13], gpio_out[13], h2h_hwdata[13]);  // src/AHB.v(63)
  and u23 (n18, n7, h2h_haddr[7]);  // src/AHB.v(53)
  or u24 (n37[12], gpio_out[12], h2h_hwdata[12]);  // src/AHB.v(63)
  or u25 (n37[11], gpio_out[11], h2h_hwdata[11]);  // src/AHB.v(63)
  and u26 (n20, n7, h2h_haddr[8]);  // src/AHB.v(54)
  or u27 (n37[10], gpio_out[10], h2h_hwdata[10]);  // src/AHB.v(63)
  or u28 (n37[9], gpio_out[9], h2h_hwdata[9]);  // src/AHB.v(63)
  and u29 (n22, n7, h2h_haddr[9]);  // src/AHB.v(55)
  and u3 (n2, n1, h2h_haddr[5]);  // src/AHB.v(46)
  or u30 (n37[8], gpio_out[8], h2h_hwdata[8]);  // src/AHB.v(63)
  or u31 (n37[7], gpio_out[7], h2h_hwdata[7]);  // src/AHB.v(63)
  and u32 (n24, n7, h2h_haddr[10]);  // src/AHB.v(56)
  or u33 (n37[6], gpio_out[6], h2h_hwdata[6]);  // src/AHB.v(63)
  or u34 (n37[5], gpio_out[5], h2h_hwdata[5]);  // src/AHB.v(63)
  and u35 (n26, n7, h2h_haddr[11]);  // src/AHB.v(57)
  or u36 (n37[4], gpio_out[4], h2h_hwdata[4]);  // src/AHB.v(63)
  or u37 (n37[3], gpio_out[3], h2h_hwdata[3]);  // src/AHB.v(63)
  and u38 (n28, n7, h2h_haddr[12]);  // src/AHB.v(58)
  or u39 (n37[2], gpio_out[2], h2h_hwdata[2]);  // src/AHB.v(63)
  or u4 (n37[24], gpio_out[24], h2h_hwdata[24]);  // src/AHB.v(63)
  or u40 (n37[1], gpio_out[1], h2h_hwdata[1]);  // src/AHB.v(63)
  and u41 (n30, n1, h2h_haddr[2]);  // src/AHB.v(60)
  not u42 (n39[31], h2h_hwdata[31]);  // src/AHB.v(64)
  not u43 (n39[30], h2h_hwdata[30]);  // src/AHB.v(64)
  and u44 (n32, n1, h2h_haddr[3]);  // src/AHB.v(61)
  not u45 (n39[29], h2h_hwdata[29]);  // src/AHB.v(64)
  not u46 (n39[28], h2h_hwdata[28]);  // src/AHB.v(64)
  and u47 (n34, n1, h2h_haddr[4]);  // src/AHB.v(62)
  not u48 (n39[27], h2h_hwdata[27]);  // src/AHB.v(64)
  not u49 (n39[26], h2h_hwdata[26]);  // src/AHB.v(64)
  or u5 (n37[23], gpio_out[23], h2h_hwdata[23]);  // src/AHB.v(63)
  and u50 (n36, n1, h2h_haddr[7]);  // src/AHB.v(63)
  not u51 (n39[25], h2h_hwdata[25]);  // src/AHB.v(64)
  not u52 (n39[24], h2h_hwdata[24]);  // src/AHB.v(64)
  and u53 (n38, n1, h2h_haddr[8]);  // src/AHB.v(64)
  or u54 (n37[0], gpio_out[0], h2h_hwdata[0]);  // src/AHB.v(63)
  not u55 (n39[0], h2h_hwdata[0]);  // src/AHB.v(64)
  and u56 (n44, h2h_hwrite, n43);  // src/AHB.v(67)
  and u57 (n45, n44, h2h_haddr[5]);  // src/AHB.v(67)
  not u58 (n39[23], h2h_hwdata[23]);  // src/AHB.v(64)
  not u59 (n39[22], h2h_hwdata[22]);  // src/AHB.v(64)
  and u6 (n4, n1, h2h_haddr[6]);  // src/AHB.v(47)
  and u60 (n47, n44, h2h_haddr[6]);  // src/AHB.v(68)
  and u61 (n50, h2h_hwrite, n49);  // src/AHB.v(69)
  and u62 (n51, n50, h2h_haddr[2]);  // src/AHB.v(69)
  not u63 (n39[21], h2h_hwdata[21]);  // src/AHB.v(64)
  not u64 (n39[20], h2h_hwdata[20]);  // src/AHB.v(64)
  and u65 (n53, n50, h2h_haddr[3]);  // src/AHB.v(70)
  not u66 (n39[19], h2h_hwdata[19]);  // src/AHB.v(64)
  not u67 (n39[18], h2h_hwdata[18]);  // src/AHB.v(64)
  and u68 (n55, n50, h2h_haddr[4]);  // src/AHB.v(71)
  not u69 (n39[17], h2h_hwdata[17]);  // src/AHB.v(64)
  and u7 (n7, h2h_hwrite, n6);  // src/AHB.v(48)
  not u70 (n39[16], h2h_hwdata[16]);  // src/AHB.v(64)
  and u71 (n57, n50, h2h_haddr[5]);  // src/AHB.v(72)
  not u72 (n39[15], h2h_hwdata[15]);  // src/AHB.v(64)
  not u73 (n39[14], h2h_hwdata[14]);  // src/AHB.v(64)
  and u74 (n59, n50, h2h_haddr[6]);  // src/AHB.v(73)
  not u75 (n39[13], h2h_hwdata[13]);  // src/AHB.v(64)
  not u76 (n39[12], h2h_hwdata[12]);  // src/AHB.v(64)
  and u77 (n61, n50, h2h_haddr[7]);  // src/AHB.v(74)
  not u78 (n39[11], h2h_hwdata[11]);  // src/AHB.v(64)
  not u79 (n39[10], h2h_hwdata[10]);  // src/AHB.v(64)
  and u8 (n8, n7, h2h_haddr[2]);  // src/AHB.v(48)
  and u80 (n63, n50, h2h_haddr[8]);  // src/AHB.v(75)
  not u81 (n39[9], h2h_hwdata[9]);  // src/AHB.v(64)
  not u82 (n39[8], h2h_hwdata[8]);  // src/AHB.v(64)
  and u83 (n65, n50, h2h_haddr[9]);  // src/AHB.v(76)
  not u84 (n39[7], h2h_hwdata[7]);  // src/AHB.v(64)
  not u85 (n39[6], h2h_hwdata[6]);  // src/AHB.v(64)
  and u86 (n67, n50, h2h_haddr[10]);  // src/AHB.v(77)
  not u87 (n39[5], h2h_hwdata[5]);  // src/AHB.v(64)
  not u88 (n39[4], h2h_hwdata[4]);  // src/AHB.v(64)
  and u89 (n69, n50, h2h_haddr[11]);  // src/AHB.v(78)
  or u9 (n37[22], gpio_out[22], h2h_hwdata[22]);  // src/AHB.v(63)
  not u90 (n39[3], h2h_hwdata[3]);  // src/AHB.v(64)
  not u91 (n39[2], h2h_hwdata[2]);  // src/AHB.v(64)
  and u92 (n71, n50, h2h_haddr[12]);  // src/AHB.v(79)
  not u93 (n39[1], h2h_hwdata[1]);  // src/AHB.v(64)
  and u94 (n40[31], gpio_out[31], n39[31]);  // src/AHB.v(64)
  and u95 (n73, n44, h2h_haddr[2]);  // src/AHB.v(80)
  and u96 (n40[30], gpio_out[30], n39[30]);  // src/AHB.v(64)
  and u97 (n40[29], gpio_out[29], n39[29]);  // src/AHB.v(64)
  and u98 (n75, n44, h2h_haddr[3]);  // src/AHB.v(81)
  and u99 (n40[28], gpio_out[28], n39[28]);  // src/AHB.v(64)

endmodule 

module PLL  // al_ip/PLL.v(25)
  (
  refclk,
  reset,
  clk0_out,
  clk1_out,
  clk2_out,
  clk3_out,
  extlock
  );

  input refclk;  // al_ip/PLL.v(33)
  input reset;  // al_ip/PLL.v(34)
  output clk0_out;  // al_ip/PLL.v(36)
  output clk1_out;  // al_ip/PLL.v(37)
  output clk2_out;  // al_ip/PLL.v(38)
  output clk3_out;  // al_ip/PLL.v(39)
  output extlock;  // al_ip/PLL.v(35)


  EF2_PHY_PLL #(
    .CLKC0_CPHASE(4),
    .CLKC0_DIV(5),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_DUTY(0.500000),
    .CLKC0_DUTY50("ENABLE"),
    .CLKC0_DUTY_INT(3),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(9),
    .CLKC1_DIV(10),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_DUTY(0.500000),
    .CLKC1_DUTY50("ENABLE"),
    .CLKC1_DUTY_INT(5),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(39),
    .CLKC2_DIV(40),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("ENABLE"),
    .CLKC2_FPHASE(0),
    .CLKC3_CPHASE(124),
    .CLKC3_DIV(125),
    .CLKC3_DIV2_ENABLE("DISABLE"),
    .CLKC3_ENABLE("ENABLE"),
    .CLKC3_FPHASE(0),
    .CLKC4_CPHASE(1),
    .CLKC4_DIV(1),
    .CLKC4_DIV2_ENABLE("DISABLE"),
    .CLKC4_ENABLE("DISABLE"),
    .CLKC4_FPHASE(0),
    .CLKC5_CPHASE(1),
    .CLKC5_DIV(1),
    .CLKC5_DIV2_ENABLE("DISABLE"),
    .CLKC5_ENABLE("DISABLE"),
    .CLKC6_CPHASE(1),
    .CLKC6_DIV(1),
    .CLKC6_DIV2_ENABLE("DISABLE"),
    .CLKC6_ENABLE("DISABLE"),
    .DERIVE_PLL_CLOCKS("DISABLE"),
    .DPHASE_SOURCE("DISABLE"),
    .DYNCFG("DISABLE"),
    .FBCLK_DIV(40),
    .FEEDBK_MODE("NOCOMP"),
    .FEEDBK_PATH("VCO_PHASE_0"),
    .FIN("25.000"),
    .FREQ_LOCK_ACCURACY(2),
    .FREQ_OFFSET("0.000000"),
    .FREQ_OFFSET_INT("0"),
    .GEN_BASIC_CLOCK("DISABLE"),
    .GMC_GAIN(6),
    .GMC_TEST(14),
    .HIGH_SPEED_EN("ENABLE"),
    .ICP_CURRENT(3),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .INTPI(3),
    .KVCO(6),
    .LPF_CAPACITOR(3),
    .LPF_RESISTOR(2),
    .NORESET("DISABLE"),
    .ODIV_MUXC0("DIV"),
    .ODIV_MUXC1("DIV"),
    .ODIV_MUXC2("DIV"),
    .ODIV_MUXC3("DIV"),
    .ODIV_MUXC4("DIV"),
    .OFFSET_MODE("EXT"),
    .PLLC2RST_ENA("DISABLE"),
    .PLLC34RST_ENA("DISABLE"),
    .PLLMRST_ENA("DISABLE"),
    .PLLRST_ENA("ENABLE"),
    .PLL_LOCK_MODE(0),
    .PREDIV_MUXC0("VCO"),
    .PREDIV_MUXC1("VCO"),
    .PREDIV_MUXC2("VCO"),
    .PREDIV_MUXC3("VCO"),
    .PREDIV_MUXC4("VCO"),
    .PREDIV_MUXC5("VCO"),
    .PREDIV_MUXC6("VCO"),
    .PU_INTP("DISABLE"),
    .REFCLK_DIV(1),
    .REFCLK_SEL("INTERNAL"),
    .SSC_AMP("0.000000"),
    .SSC_ENABLE("DISABLE"),
    .SSC_FREQ_DIV(0),
    .SSC_MODE("Down"),
    .SSC_RNGE(0),
    .STDBY_ENABLE("DISABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("DISABLE"),
    .VCO_NORESET("DISABLE"))
    pll_inst (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dsm_refclk(1'b0),
    .dsm_rst(reset),
    .dwe(1'b0),
    .fbclk(1'b0),
    .frac_offset_valid(1'b0),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(refclk),
    .reset(reset),
    .ssc_en(1'b0),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,open_n2,clk3_out,clk2_out,clk1_out,clk0_out}),
    .extlock(extlock));  // al_ip/PLL.v(92)

endmodule 

module add_pu32_pu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;



endmodule 

module eq_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output o;



endmodule 

module binary_mux_s1_w32
  (
  i0,
  i1,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input sel;
  output [31:0] o;



endmodule 

module binary_mux_s1_w4
  (
  i0,
  i1,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input sel;
  output [3:0] o;



endmodule 

module reg_ar_as_w32
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [31:0] d;
  input en;
  input [31:0] reset;
  input [31:0] set;
  output [31:0] q;



endmodule 

module reg_ar_as_w4
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [3:0] d;
  input en;
  input [3:0] reset;
  input [3:0] set;
  output [3:0] q;



endmodule 

module eq_w27
  (
  i0,
  i1,
  o
  );

  input [26:0] i0;
  input [26:0] i1;
  output o;



endmodule 

module eq_w24
  (
  i0,
  i1,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  output o;



endmodule 

module binary_mux_s1_w27
  (
  i0,
  i1,
  sel,
  o
  );

  input [26:0] i0;
  input [26:0] i1;
  input sel;
  output [26:0] o;



endmodule 

module binary_mux_s1_w24
  (
  i0,
  i1,
  sel,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  input sel;
  output [23:0] o;



endmodule 

module ne_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output o;



endmodule 

module reg_ar_as_w27
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [26:0] d;
  input en;
  input [26:0] reset;
  input [26:0] set;
  output [26:0] q;



endmodule 

module reg_ar_as_w24
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [23:0] d;
  input en;
  input [23:0] reset;
  input [23:0] set;
  output [23:0] q;



endmodule 

module add_pu28_mu28_o28
  (
  i0,
  i1,
  o
  );

  input [27:0] i0;
  input [27:0] i1;
  output [27:0] o;



endmodule 

module add_pu25_mu25_o25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output [24:0] o;



endmodule 

module M3WithAHB  // al_ip/M3WithAHB.v(14)
  (
  h2h_hrdata,
  h2h_hreadyout,
  h2h_hresp,
  h2h_mclk,
  h2h_rstn,
  ppm_clk,
  h2h_haddr,
  h2h_hburst,
  h2h_hprot,
  h2h_hsize,
  h2h_htrans,
  h2h_hwdata,
  h2h_hwrite
  );

  input [31:0] h2h_hrdata;  // al_ip/M3WithAHB.v(35)
  input h2h_hreadyout;  // al_ip/M3WithAHB.v(36)
  input [1:0] h2h_hresp;  // al_ip/M3WithAHB.v(37)
  input h2h_mclk;  // al_ip/M3WithAHB.v(38)
  input h2h_rstn;  // al_ip/M3WithAHB.v(39)
  input ppm_clk;  // al_ip/M3WithAHB.v(40)
  output [31:0] h2h_haddr;  // al_ip/M3WithAHB.v(28)
  output [2:0] h2h_hburst;  // al_ip/M3WithAHB.v(32)
  output [3:0] h2h_hprot;  // al_ip/M3WithAHB.v(33)
  output [2:0] h2h_hsize;  // al_ip/M3WithAHB.v(31)
  output [1:0] h2h_htrans;  // al_ip/M3WithAHB.v(29)
  output [31:0] h2h_hwdata;  // al_ip/M3WithAHB.v(34)
  output h2h_hwrite;  // al_ip/M3WithAHB.v(30)


  EF2_PHY_MCU #(
    .GPIO_L0("ENABLE"),
    .GPIO_L1("ENABLE"),
    .GPIO_L10("DISABLE"),
    .GPIO_L11("DISABLE"),
    .GPIO_L12("DISABLE"),
    .GPIO_L13("DISABLE"),
    .GPIO_L14("DISABLE"),
    .GPIO_L15("DISABLE"),
    .GPIO_L2("DISABLE"),
    .GPIO_L3("DISABLE"),
    .GPIO_L4("DISABLE"),
    .GPIO_L5("DISABLE"),
    .GPIO_L6("DISABLE"),
    .GPIO_L7("DISABLE"),
    .GPIO_L8("ENABLE"),
    .GPIO_L9("ENABLE"))
    mcu_inst (
    .gpio_h_in(16'b0000000000000000),
    .h2h_hrdata(h2h_hrdata),
    .h2h_hreadyout(h2h_hreadyout),
    .h2h_hresp(h2h_hresp),
    .h2h_mclk(h2h_mclk),
    .h2h_rstn(h2h_rstn),
    .ppm_clk(ppm_clk),
    .h2h_haddr(h2h_haddr),
    .h2h_hburst(h2h_hburst),
    .h2h_hprot(h2h_hprot),
    .h2h_hsize(h2h_hsize),
    .h2h_htrans(h2h_htrans),
    .h2h_hwdata(h2h_hwdata),
    .h2h_hwrite(h2h_hwrite));  // al_ip/M3WithAHB.v(46)

endmodule 

module eq_w2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output o;



endmodule 

module binary_mux_s1_w33
  (
  i0,
  i1,
  sel,
  o
  );

  input [32:0] i0;
  input [32:0] i1;
  input sel;
  output [32:0] o;



endmodule 

module reg_ar_as_w13
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [12:0] d;
  input en;
  input [12:0] reset;
  input [12:0] set;
  output [12:0] q;



endmodule 

module reg_ar_as_w33
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [32:0] d;
  input en;
  input [32:0] reset;
  input [32:0] set;
  output [32:0] q;



endmodule 

module onehot_mux_s12_w32
  (
  i0,
  i1,
  i10,
  i11,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i10;
  input [31:0] i11;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [31:0] i5;
  input [31:0] i6;
  input [31:0] i7;
  input [31:0] i8;
  input [31:0] i9;
  input [11:0] sel;
  output [31:0] o;



endmodule 

module onehot_mux_s9_w32
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [31:0] i5;
  input [31:0] i6;
  input [31:0] i7;
  input [31:0] i8;
  input [8:0] sel;
  output [31:0] o;



endmodule 

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

