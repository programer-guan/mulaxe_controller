--------------------------------------------------------------
 --  Copyright (c) 2011-2021 Anlogic, Inc.
 --  All Right Reserved.
--------------------------------------------------------------
 -- Log	:	This file is generated by Anlogic IP Generator.
 -- File	:	F:/Internship/ANLU_DEMO/FPGA_ARM/DESIGN/UART_PWMv6.4/AHB_FPGA256_CC/al_ip/PLL.vhd
 -- Date	:	2019 10 15
 -- TD version	:	4.5.12562
--------------------------------------------------------------

-------------------------------------------------------------------------------
--	Input frequency:             25.000Mhz
--	Clock multiplication factor: 40
--	Clock division factor:       1
--	Clock information:
--		Clock name	| Frequency 	| Phase shift
--		C0        	| 200.000000MHZ	| 0  DEG     
--		C1        	| 100.000000MHZ	| 0  DEG     
--		C2        	| 25.000000 MHZ	| 0  DEG     
--		C3        	| 8.000000  MHZ	| 0  DEG     
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;
LIBRARY ef2_macro;
USE ef2_macro.EF2_COMPONENTS.ALL;

ENTITY PLL IS
	PORT ( refclk	: IN	STD_LOGIC;
		reset	: IN	STD_LOGIC;
		extlock	: OUT	STD_LOGIC;
		clk0_out	: OUT	STD_LOGIC;
		clk1_out	: OUT	STD_LOGIC;
		clk2_out	: OUT	STD_LOGIC;
		clk3_out	: OUT	STD_LOGIC);
END PLL;

ARCHITECTURE rtl OF PLL IS
	SIGNAL clkc_wire	: STD_LOGIC_VECTOR (6 DOWNTO 0);
BEGIN
	pll_inst : EF2_PHY_PLL	GENERIC MAP ( DPHASE_SOURCE => "DISABLE",
		DYNCFG => "DISABLE",
		FIN => "25.000",
		FEEDBK_MODE => "NOCOMP",
		FEEDBK_PATH => "VCO_PHASE_0",
		STDBY_ENABLE => "DISABLE",
		PLLRST_ENA => "ENABLE",
		SYNC_ENABLE => "DISABLE",
		DERIVE_PLL_CLOCKS => "DISABLE",
		GEN_BASIC_CLOCK => "DISABLE",
		GMC_GAIN => 6,
		ICP_CURRENT => 3,
		KVCO => 6,
		LPF_CAPACITOR => 3,
		LPF_RESISTOR => 2,
		REFCLK_DIV => 1,
		FBCLK_DIV => 40,
		CLKC0_ENABLE => "ENABLE",
		CLKC0_DIV => 5,
		CLKC0_CPHASE => 4,
		CLKC0_FPHASE => 0,
		CLKC1_ENABLE => "ENABLE",
		CLKC1_DIV => 10,
		CLKC1_CPHASE => 9,
		CLKC1_FPHASE => 0,
		CLKC2_ENABLE => "ENABLE",
		CLKC2_DIV => 40,
		CLKC2_CPHASE => 39,
		CLKC2_FPHASE => 0,
		CLKC3_ENABLE => "ENABLE",
		CLKC3_DIV => 125,
		CLKC3_CPHASE => 124,
		CLKC3_FPHASE => 0,
		PU_INTP => "DISABLE",
		INTPI => 3,
		HIGH_SPEED_EN => "ENABLE",
		SSC_ENABLE => "DISABLE",
		SSC_MODE => "Down",
		SSC_AMP => 0.0000,
		SSC_FREQ_DIV => 0,
		SSC_RNGE => 0,
		FREQ_OFFSET => 0.0000,
		OFFSET_MODE => "EXT",
		FREQ_OFFSET_INT => 0,
		CLKC0_DUTY => 0.5000,
		CLKC0_DUTY_INT => 3,
		CLKC0_DUTY50 => "ENABLE",
		CLKC1_DUTY => 0.5000,
		CLKC1_DUTY_INT => 5,
		CLKC1_DUTY50 => "ENABLE")
		PORT MAP ( refclk => refclk,
			reset => reset,
			stdby => '0',
			extlock => extlock,
			psclk => '0',
			psdown => '0',
			psstep => '0',
			psclksel => "000",
			dclk => '0',
			dcs => '0',
			dwe => '0',
			di => "00000000",
			daddr => "000000",
			fbclk => '0',
			clkc => clkc_wire,
			ssc_en => '0',
			frac_offset_valid => '0',
			dsm_refclk => '0',
			dsm_rst => reset);

		clk3_out <= clkc_wire(3);
		clk2_out <= clkc_wire(2);
		clk1_out <= clkc_wire(1);
		clk0_out <= clkc_wire(0);

END rtl;
