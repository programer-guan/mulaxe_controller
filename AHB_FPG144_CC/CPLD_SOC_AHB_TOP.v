module CPLD_SOC_AHB_TOP
(
	input					clkin,
	input  					rst_n,
	input	 	[15:0]		limit_l,    //急停限位 默认高电平 低电平有效
	input	 	[15:0]		limit_r, 
	output		[15:0]		pwm,dir,
	output	wire[31:0]		gpio_out,
//	input		[31:0]		gpio_in,	
	output  reg [3:0] 		ledout  
);

wire rstn,clk200m,clk100m,clk25m,clk8m;	
PLL	U_PLL
(
	.refclk				( clkin	 	),
	.reset				( 1'b0	 	),
	.extlock			( rstn	 	),
	.clk0_out			( clk200m	),
	.clk1_out			( clk100m	),
	.clk2_out			( clk25m 	),
	.clk3_out			( clk8m	 	)
);
/*-----------------------------------------------------------------------*/	
//define the time counter
reg [31:0]      timer;
// cycle counter:from 0 to 4 sec
always@(posedge clk25m or negedge rst_n)
begin
	if (rst_n == 1'b0)
		timer <= 32'd0;                     //when the reset signal valid,time counter clearing
	else if (timer == 32'd199_999_999)      //4 seconds count(25M*8-1=199999999)
		timer <= 32'd0;                     //count done,clearing the time counter
	else
		timer <= timer + 32'd1;             //timer counter = timer counter + 1
end
// LED control
always@(posedge clk25m or negedge rst_n)      //流水灯
begin
	if (rst_n == 1'b0)
		ledout <= 4'b1111;            //when the reset signal active
	else if (timer == 32'd49_999_999)      //time counter count to 1st sec,LED1 lighten
		ledout <= 4'b1110;
	else if (timer == 32'd99_999_999)      //time counter count to 2nd sec,LED2 lighten
		ledout <= 4'b1101;
	else if (timer == 32'd149_999_999)      //time counter count to 3rd sec,LED3 lighten
		ledout <= 4'b1011;
	else if (timer == 32'd199_999_999)      //time counter count to 4th sec,LED4 lighten
		ledout <= 4'b0111;
end
/*-----------------------------------------------------------------------*/	
wire [31:0]	pwm_start_stop;
wire [31:0]	gpio_out;
wire [32:0]	pnum0,pnum1,pnum2,pnum3,pnum4,pnum5,pnum6,pnum7,pnum8,pnum9,pnumA,pnumB,pnumC,pnumD,pnumE,pnumF;
wire [31:0]	freq0,freq1,freq2,freq3,freq4,freq5,freq6,freq7,freq8,freq9,freqA,freqB,freqC,freqD,freqE,freqF;
AHB U_AHB
(
	.clk25m				( clk25m	),		//input
	.clk100m			( clk100m	),
	.rst_n				( rstn	 	),
	.pnumcnt0			( pnumcnt0	),
	.pnumcnt1			( pnumcnt1	),
	.pnumcnt2			( pnumcnt2	),
	.pnumcnt3			( pnumcnt3	),
	.pnumcnt4			( pnumcnt4	),
	.pnumcnt5			( pnumcnt5	),
	.pnumcnt6			( pnumcnt6	),
	.pnumcnt7			( pnumcnt7	),
	.pnumcnt8			( pnumcnt8	),
	.pnumcnt9			( pnumcnt9	),
	.pnumcntA			( pnumcntA	),
	.pnumcntB			( pnumcntB	),
	.pnumcntC			( pnumcntC	),
	.pnumcntD			( pnumcntD	),
	.pnumcntE			( pnumcntE	),
	.pnumcntF			( pnumcntF	),
	.gpio_in			( gpio_in	),
	.pwm_state_read		( pwm_state_read),	
	.pwm_start_stop		( pwm_start_stop),	//output
	.pnum0				( pnum0	 	),		//ARM发送脉冲数量
	.pnum1				( pnum1	 	),	
	.pnum2				( pnum2 	),
	.pnum3				( pnum3		),	
	.pnum4				( pnum4	 	),		
	.pnum5				( pnum5	 	),	
	.pnum6				( pnum6 	),
	.pnum7				( pnum7		),
	.pnum8				( pnum8	 	),		
	.pnum9				( pnum9	 	),	
	.pnumA				( pnumA 	),
	.pnumB				( pnumB		),
	.pnumC				( pnumC	 	),		
	.pnumD				( pnumD	 	),	
	.pnumE				( pnumE 	),
	.pnumF				( pnumF		),
	.freq0				( freq0		),		//ARM发送脉冲频率
	.freq1				( freq1		),	
	.freq2				( freq2 	),
	.freq3				( freq3		),	
	.freq4				( freq4		),		
	.freq5				( freq5		),	
	.freq6				( freq6 	),
	.freq7				( freq7		),
	.freq8				( freq8		),		
	.freq9				( freq9		),	
	.freqA				( freqA 	),
	.freqB				( freqB		),
	.freqC				( freqC		),		
	.freqD				( freqD		),	
	.freqE				( freqE 	),
	.freqF				( freqF		),
	.gpio_out			( gpio_out	),
	.limit_l			( limit_l	),	//16路pwm左限位信息
	.limit_r			( limit_r	)	//16路pwm右限位信息
			
);
/*---------------------------例化16路PWM----------------------------------*/	
wire [23:0] pnumcnt0,pnumcnt1,pnumcnt2,pnumcnt3,pnumcnt4,pnumcnt5,pnumcnt6,pnumcnt7,pnumcnt8,pnumcnt9,pnumcntA,pnumcntB,pnumcntC,pnumcntD,pnumcntE,pnumcntF;	
wire [15:0] pwm_state_read;
OnePWM 	PWM0(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[16]),.Stop(pwm_start_stop[0]), .pnump(pnum0[32]),.freq(freq0),.pnum(pnum0[31:0]),.State(pwm_state_read[0]), .RemaTxNum(pnumcnt0),.pwm(pwm[0]), .dir(dir[0]), .limit(limit_l[0]&&limit_r[0]));
OnePWM	PWM1(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[17]),.Stop(pwm_start_stop[1]), .pnump(pnum1[32]),.freq(freq1),.pnum(pnum1[31:0]),.State(pwm_state_read[1]), .RemaTxNum(pnumcnt1),.pwm(pwm[1]), .dir(dir[1]), .limit(limit_l[1]&&limit_r[1]));
OnePWM 	PWM2(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[18]),.Stop(pwm_start_stop[2]), .pnump(pnum2[32]),.freq(freq2),.pnum(pnum2[31:0]),.State(pwm_state_read[2]), .RemaTxNum(pnumcnt2),.pwm(pwm[2]), .dir(dir[2]), .limit(limit_l[2]&&limit_r[2]));
OnePWM	PWM3(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[19]),.Stop(pwm_start_stop[3]), .pnump(pnum3[32]),.freq(freq3),.pnum(pnum3[31:0]),.State(pwm_state_read[3]), .RemaTxNum(pnumcnt3),.pwm(pwm[3]), .dir(dir[3]), .limit(limit_l[3]&&limit_r[3]));
OnePWM	PWM4(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[20]),.Stop(pwm_start_stop[4]), .pnump(pnum4[32]),.freq(freq4),.pnum(pnum4[31:0]),.State(pwm_state_read[4]), .RemaTxNum(pnumcnt4),.pwm(pwm[4]), .dir(dir[4]), .limit(limit_l[4]&&limit_r[4]));
OnePWM	PWM5(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[21]),.Stop(pwm_start_stop[5]), .pnump(pnum5[32]),.freq(freq5),.pnum(pnum5[31:0]),.State(pwm_state_read[5]), .RemaTxNum(pnumcnt5),.pwm(pwm[5]), .dir(dir[5]), .limit(limit_l[5]&&limit_r[5]));
OnePWM	PWM6(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[22]),.Stop(pwm_start_stop[6]), .pnump(pnum6[32]),.freq(freq6),.pnum(pnum6[31:0]),.State(pwm_state_read[6]), .RemaTxNum(pnumcnt6),.pwm(pwm[6]), .dir(dir[6]), .limit(limit_l[6]&&limit_r[6]));
OnePWM	PWM7(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[23]),.Stop(pwm_start_stop[7]), .pnump(pnum7[32]),.freq(freq7),.pnum(pnum7[31:0]),.State(pwm_state_read[7]), .RemaTxNum(pnumcnt7),.pwm(pwm[7]), .dir(dir[7]), .limit(limit_l[7]&&limit_r[7]));
OnePWM	PWM8(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[24]),.Stop(pwm_start_stop[8]), .pnump(pnum8[32]),.freq(freq8),.pnum(pnum8[31:0]),.State(pwm_state_read[8]), .RemaTxNum(pnumcnt8),.pwm(pwm[8]), .dir(dir[8]), .limit(limit_l[8]&&limit_r[8]));
OnePWM	PWM9(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[25]),.Stop(pwm_start_stop[9]), .pnump(pnum9[32]),.freq(freq9),.pnum(pnum9[31:0]),.State(pwm_state_read[9]), .RemaTxNum(pnumcnt9),.pwm(pwm[9]), .dir(dir[9]), .limit(limit_l[9]&&limit_r[9]));
OnePWM	PWMA(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[26]),.Stop(pwm_start_stop[10]),.pnump(pnumA[32]),.freq(freqA),.pnum(pnumA[31:0]),.State(pwm_state_read[10]),.RemaTxNum(pnumcntA),.pwm(pwm[10]),.dir(dir[10]),.limit(limit_l[10]&&limit_r[10]));
OnePWM	PWMB(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[27]),.Stop(pwm_start_stop[11]),.pnump(pnumB[32]),.freq(freqB),.pnum(pnumB[31:0]),.State(pwm_state_read[11]),.RemaTxNum(pnumcntB),.pwm(pwm[11]),.dir(dir[11]),.limit(limit_l[11]&&limit_r[11]));
OnePWM	PWMC(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[28]),.Stop(pwm_start_stop[12]),.pnump(pnumC[32]),.freq(freqC),.pnum(pnumC[31:0]),.State(pwm_state_read[12]),.RemaTxNum(pnumcntC),.pwm(pwm[12]),.dir(dir[12]),.limit(limit_l[12]&&limit_r[12]));
OnePWM	PWMD(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[29]),.Stop(pwm_start_stop[13]),.pnump(pnumD[32]),.freq(freqD),.pnum(pnumD[31:0]),.State(pwm_state_read[13]),.RemaTxNum(pnumcntD),.pwm(pwm[13]),.dir(dir[13]),.limit(limit_l[13]&&limit_r[13]));
OnePWM	PWME(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[30]),.Stop(pwm_start_stop[14]),.pnump(pnumE[32]),.freq(freqE),.pnum(pnumE[31:0]),.State(pwm_state_read[14]),.RemaTxNum(pnumcntE),.pwm(pwm[14]),.dir(dir[14]),.limit(limit_l[14]&&limit_r[14]));
OnePWM	PWMF(.Clk100m(clk100m),.Rstn(rstn),.Start(pwm_start_stop[31]),.Stop(pwm_start_stop[15]),.pnump(pnumF[32]),.freq(freqF),.pnum(pnumF[31:0]),.State(pwm_state_read[15]),.RemaTxNum(pnumcntF),.pwm(pwm[15]),.dir(dir[15]),.limit(limit_l[15]&&limit_r[15]));

endmodule