module AHB
(
	input				clk25m,
	input				clk100m,
	input  				rst_n,
	input		[31:0]	gpio_in,
	input		[15:0]	limit_l,limit_r,
	input 	    [15:0]	pwm_state_read,
	input 		[23:0]	pnumcnt0,pnumcnt1,pnumcnt2,pnumcnt3,pnumcnt4,pnumcnt5,pnumcnt6,pnumcnt7,pnumcnt8,pnumcnt9,pnumcntA,pnumcntB,pnumcntC,pnumcntD,pnumcntE,pnumcntF,
	output	reg [31:0]	gpio_out,
	output 	reg	[31:0]	pwm_start_stop,
	output	reg [31:0]	freq0,freq1,freq2,freq3,freq4,freq5,freq6,freq7,freq8,freq9,freqA,freqB,freqC,freqD,freqE,freqF,
	output	reg [32:0]	pnum0,pnum1,pnum2,pnum3,pnum4,pnum5,pnum6,pnum7,pnum8,pnum9,pnumA,pnumB,pnumC,pnumD,pnumE,pnumF                              
);
/*-----------------------------------------*/	
wire [31:0]	h2h_haddrw;
wire [31:0]	h2h_hwdata;
reg	 [31:0] h2h_hrdata;
wire 		h2h_hwritew;
reg			h2h_hreadyout;
	
reg h2h_hwrite;
reg [31:0] h2h_haddr;		
always @(posedge clk100m) h2h_hwrite <= h2h_hwritew;
always @(posedge clk100m) h2h_haddr  <= h2h_haddrw;

/*-----------------------------------------*/		
M3WithAHB M3WithAHB
( 
	.ppm_clk			(clk25m			),
	.h2h_haddr			(h2h_haddrw		),//o32 addr ���ߵ�ַ
	.h2h_htrans			(				),//o2��ǰ�������� NONSEQ, SEQ, IDLE, BUSY
	.h2h_hwrite			(h2h_hwritew	),//o 1-write 0-read
	.h2h_hsize			(				),//transfer��������ݴ�С�����ֽ�Ϊ��λ�����֧��1024λ
	.h2h_hburst			(				),//ͻ�����ͣ�֧��4/8/16burst��incrementing/wrapping
	.h2h_hprot			(				),//���������źţ���Ҫslave���������ܣ�һ�㲻��
	.h2h_hwdata			(h2h_hwdata		),//д�������ߣ�Master��Slave
	.h2h_hrdata			(h2h_hrdata		),//���������ߣ�Slave��Master
	.h2h_hreadyout		(1'b1			),//i 1-read salve ok(�������), 0-read slave not ok
	.h2h_hresp			(2'b00			),//i2Slave����Master�����ߴ���״̬ OKAY, ERROR, RETRY, SPLIT
	.h2h_mclk			(clk100m		),//����ʱ�ӣ�������
	.h2h_rstn			(rst_n			) //���߸�λ���͵�ƽ��Ч
);

/*---------------------------��·PWMƵ����FPGA����----------------------------------*/	
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==1 && h2h_haddr[5 ]  ) freq0 <= h2h_hwdata; 			   //��ַΪ32'h2000A020����PWM0Ƶ��
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==1 && h2h_haddr[6 ]  ) freq1 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[2 ]  ) freq2 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[3 ]  ) freq3 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[4 ]  ) freq4 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[5 ]  ) freq5 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[6 ]  ) freq6 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[7 ]  ) freq7 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[8 ]  ) freq8 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[9 ]  ) freq9 <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[10]) freqA <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[11]) freqB <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==0 && h2h_haddr[12]) freqC <= h2h_hwdata;
	
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==1 && h2h_haddr[2]) freqD <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==1 && h2h_haddr[3]) freqE <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==1 && h2h_haddr[4]) freqF <= h2h_hwdata;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==1 && h2h_haddr[7])  gpio_out <= gpio_out | h2h_hwdata;  //��ַΪ32'h2000A080����IO�����λ
	                      else if(h2h_hwrite && h2h_haddr[14:13]==1 && h2h_haddr[8])  gpio_out <= gpio_out & ~h2h_hwdata; //��ַΪ32'h2000A100����IO�������

/*---------------------------����������������FPGA����----------------------------------*/		
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==3 && h2h_haddr[5] ) pnum0 <= {1'b1,h2h_hwdata};  else  pnum0 <= 0;	//��ַΪ32'h2000E020����������1
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==3 && h2h_haddr[6] ) pnum1 <= {1'b1,h2h_hwdata};  else  pnum1 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[2] ) pnum2 <= {1'b1,h2h_hwdata};  else  pnum2 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[3] ) pnum3 <= {1'b1,h2h_hwdata};  else  pnum3 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[4] ) pnum4 <= {1'b1,h2h_hwdata};  else  pnum4 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[5] ) pnum5 <= {1'b1,h2h_hwdata};  else  pnum5 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[6] ) pnum6 <= {1'b1,h2h_hwdata};  else  pnum6 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[7] ) pnum7 <= {1'b1,h2h_hwdata};  else  pnum7 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[8] ) pnum8 <= {1'b1,h2h_hwdata};  else  pnum8 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[9] ) pnum9 <= {1'b1,h2h_hwdata};  else  pnum9 <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[10]) pnumA <= {1'b1,h2h_hwdata};  else  pnumA <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[11]) pnumB <= {1'b1,h2h_hwdata};  else  pnumB <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==2 && h2h_haddr[12]) pnumC <= {1'b1,h2h_hwdata};  else  pnumC <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==3 && h2h_haddr[2])  pnumD <= {1'b1,h2h_hwdata};  else  pnumD <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==3 && h2h_haddr[3])  pnumE <= {1'b1,h2h_hwdata};  else  pnumE <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==3 && h2h_haddr[4])  pnumF <= {1'b1,h2h_hwdata};  else  pnumF <= 0;
always @(posedge clk100m) if(h2h_hwrite && h2h_haddr[14:13]==3 && h2h_haddr[7])  pwm_start_stop <=h2h_hwdata;  
						  else  pwm_start_stop <= 0;	      //��ַΪ32'h2000E080����PWM����ֹͣ����	
				  
/*--------------------------ʣ����������ARM����----------------------------------------------*/	
always @(posedge clk100m)begin 
	if(~h2h_hwrite && h2h_haddr[14:13]==0)begin				
		case(1'b1)
			h2h_haddr[2]  : h2h_hrdata <= {8'd0,pnumcnt0};						 //0x20008004
	    	h2h_haddr[3]  : h2h_hrdata <= {8'd0,pnumcnt1};					     //0x20008008
 	    	h2h_haddr[4]  : h2h_hrdata <= {8'd0,pnumcnt2};						 //0x20008010
 	    	h2h_haddr[5]  : h2h_hrdata <= {8'd0,pnumcnt3};						 //0x20008020
	    	h2h_haddr[6]  : h2h_hrdata <= {8'd0,pnumcnt4};						 //0x20008040
	    	h2h_haddr[7]  : h2h_hrdata <= {8'd0,pnumcnt5};						 //0x20008080
	    	h2h_haddr[8]  : h2h_hrdata <= {8'd0,pnumcnt6};						 //0x20008100
	   		h2h_haddr[9]  : h2h_hrdata <= {8'd0,pnumcnt7};						 //0x20008200
	    	h2h_haddr[10]: h2h_hrdata <= {8'd0,pnumcnt8};						 //0x20008400
	    	h2h_haddr[11]: h2h_hrdata <= {8'd0,pnumcnt9};						 //0x20008800
	    	h2h_haddr[12]: h2h_hrdata <= {8'd0,pnumcntA};						 //0x20009000
		endcase
	end 
	else if(~h2h_hwrite && h2h_haddr[14:13]==1)begin
		case(1'b1)
	    	h2h_haddr[2]: h2h_hrdata <= {8'd0,pnumcntB};						  //0x2000A004
	    	h2h_haddr[3]: h2h_hrdata <= {8'd0,pnumcntC};						  //0x2000A008
	    	h2h_haddr[4]: h2h_hrdata <= {8'd0,pnumcntD};						  //0x2000A010
	    	h2h_haddr[5]: h2h_hrdata <= {8'd0,pnumcntE};						  //0x2000A020
	    	h2h_haddr[6]: h2h_hrdata <= {8'd0,pnumcntF};						  //0x2000A040
		    h2h_haddr[7]: h2h_hrdata <= {pwm_state_read,pwm_state_read};//״̬����  //0x2000A080 
			h2h_haddr[8]: h2h_hrdata <= gpio_in;						//IO�����ȡ//0x2000A100
			h2h_haddr[9]: h2h_hrdata <= {limit_l,limit_r};				//��λ��Ϣ  //0x2000A200						//IO�����ȡ//0x2000A200
		  endcase
	end
end

endmodule