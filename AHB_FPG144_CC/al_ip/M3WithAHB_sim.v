// Verilog netlist created by TD v4.5.12562
// Tue Oct 15 10:07:48 2019

`timescale 1ns / 1ps
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


  EF2_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
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

