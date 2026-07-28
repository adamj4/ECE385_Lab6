//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Tue Jul 28 17:10:54 2026
//Host        : LAPTOP-SP4K5KFB running 64-bit major release  (build 9200)
//Command     : generate_target hdmi_text_controller_wrapper.bd
//Design      : hdmi_text_controller_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module hdmi_text_controller_wrapper
   (HDMI_0_tmds_clk_n,
    HDMI_0_tmds_clk_p,
    HDMI_0_tmds_data_n,
    HDMI_0_tmds_data_p,
    clk_100MHz,
    reset_rtl_0,
    uart_rtl_0_rxd,
    uart_rtl_0_txd);
  output HDMI_0_tmds_clk_n;
  output HDMI_0_tmds_clk_p;
  output [2:0]HDMI_0_tmds_data_n;
  output [2:0]HDMI_0_tmds_data_p;
  input clk_100MHz;
  input reset_rtl_0;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;

  wire HDMI_0_tmds_clk_n;
  wire HDMI_0_tmds_clk_p;
  wire [2:0]HDMI_0_tmds_data_n;
  wire [2:0]HDMI_0_tmds_data_p;
  wire clk_100MHz;
  wire reset_rtl_0;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;

  hdmi_text_controller hdmi_text_controller_i
       (.HDMI_0_tmds_clk_n(HDMI_0_tmds_clk_n),
        .HDMI_0_tmds_clk_p(HDMI_0_tmds_clk_p),
        .HDMI_0_tmds_data_n(HDMI_0_tmds_data_n),
        .HDMI_0_tmds_data_p(HDMI_0_tmds_data_p),
        .clk_100MHz(clk_100MHz),
        .reset_rtl_0(reset_rtl_0),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd));
endmodule
