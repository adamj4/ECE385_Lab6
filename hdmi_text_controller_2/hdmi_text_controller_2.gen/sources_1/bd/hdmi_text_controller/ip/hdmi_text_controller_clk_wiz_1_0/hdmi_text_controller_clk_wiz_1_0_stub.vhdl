-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Wed Jul 29 09:48:32 2026
-- Host        : LAPTOP-SP4K5KFB running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/adamj/Desktop/Vitis/Lab6/hdmi_text_controller_2/hdmi_text_controller_2.gen/sources_1/bd/hdmi_text_controller/ip/hdmi_text_controller_clk_wiz_1_0/hdmi_text_controller_clk_wiz_1_0_stub.vhdl
-- Design      : hdmi_text_controller_clk_wiz_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hdmi_text_controller_clk_wiz_1_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end hdmi_text_controller_clk_wiz_1_0;

architecture stub of hdmi_text_controller_clk_wiz_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1";
begin
end;
