module OnePWM(
	input				Clk100m,Rstn,
	input				Start,Stop,pnump,
	input	[31:0]		freq,			//PWM频率值pulsefreq，有效值是低27bits，即忽略高5bits值。PWM频率=50MHz/（pulsefreq+1），占空比50%。
	input	[31:0]		pnum,
	input	 			limit,     		//急停限位
	output	reg			State, 			/* synthesis keep */ 	//读取16位PWM的当前状态，高16位有效，1表示正在发送；0表示空闲
	output	reg [23:0]	RemaTxNum, 		/* synthesis keep */	//PWM脉冲数值pulsenub，有效值是低24bits和最高位，最高位代表dir值，脉冲数量=pulsenub[23:0]+1
	output	reg			pwm,dir

);
	
	reg [26:0]	FreCnt,FreCntr;
	reg			stopreq;/* synthesis keep */
	always @(posedge Clk100m)if(Stop) stopreq <= 1; else if(FreCnt==0) stopreq <= 0; //State状态反馈
	always @(posedge Clk100m or negedge Rstn)begin
		if(~Rstn)  
			State <= 0;
		else if(~limit)   				  //急停
			State <= 0;
		else if(Start) 
			State <= 1;
		else if(stopreq && FreCnt==0)   
			State <= 0; 
		else if(RemaTxNum==1 && FreCnt==0)
			State <= 0; 
	end
	
	always @(posedge Clk100m)begin    	 //50%PWM脉冲输出
		if(State ||Start)begin
			if(FreCnt==0)begin FreCnt <= freq[26:0]; FreCntr <=  freq[26:0]; end
			else FreCnt <= FreCnt -1;
		end 
		else begin
			FreCnt <= 0;
		end
	end
	always @(posedge Clk100m)begin			 	
		if(~State) 
			pwm <= 0;
		else if(FreCnt=={1'b0,FreCntr[26:1]}) 
			pwm <= 0;
		else if(FreCnt==FreCntr) 
			pwm <= 1'b1;
	end

	reg [31:0]	pnumr;/* synthesis keep *///脉冲数计数
	always @(posedge Clk100m) if(pnump) pnumr <= pnum; else if(Start) pnumr <= 0;
	always @(posedge Clk100m)begin
		if(Start) begin
			RemaTxNum <= pnumr[23:0];
			dir <= pnumr[31];
		end 
		else if(FreCnt==0 && State)begin
			if(RemaTxNum!=0) RemaTxNum <= RemaTxNum-1;
			else begin  RemaTxNum <= pnumr[23:0]; dir <= pnumr[31];end
		end
	end

endmodule