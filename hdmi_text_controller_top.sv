//-------------------------------------------------------------------------
//    mb_usb_hdmi_top.sv                                                 --
//    Zuofu Cheng                                                        --
//    2-29-24                                                            --
//                                                                       --
//                                                                       --
//    Spring 2024 Distribution                                           --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module hdmi_text_controller_top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
);
    
    logic clk_25MHz, clk_125MHz, clk, clk_100MHz;
    logic locked;
    logic [9:0] drawX, drawY, ballxsig, ballysig, ballsizesig;

    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    
    assign reset_ah = reset_rtl_0;
    
    hdmi_text_controller hdmi_text_controller_i (
        .clk_100MHz(Clk),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .HDMI_0_tmds_clk_n(hdmi_tmds_clk_n),
        .HDMI_0_tmds_clk_p(hdmi_tmds_clk_p),
        .HDMI_0_tmds_data_n(hdmi_tmds_data_n),
        .HDMI_0_tmds_data_p(hdmi_tmds_data_p)
    );
        
    // //clock wizard configured with a 1x and 5x clock for HDMI
    // clk_wiz_0 clk_wiz (
    //     .clk_out1(clk_25MHz),
    //     .clk_out2(clk_125MHz),
    //     .reset(reset_ah),
    //     .locked(locked),
    //     .clk_in1(Clk)
    // );
    
    // //VGA Sync signal generator
    // vga_controller vga (
    //     .pixel_clk(clk_25MHz),
    //     .reset(reset_ah),
    //     .hs(hsync),
    //     .vs(vsync),
    //     .active_nblank(vde),
    //     .drawX(drawX),
    //     .drawY(drawY)
    // );    

    // //Real Digital VGA to HDMI converter
    // hdmi_tx_0 vga_to_hdmi (
    //     //Clocking and Reset
    //     .pix_clk(clk_25MHz),
    //     .pix_clkx5(clk_125MHz),
    //     .pix_clk_locked(locked),
    //     //Reset is active LOW
    //     .rst(reset_ah),
    //     //Color and Sync Signals
    //     .red(red),
    //     .green(green),
    //     .blue(blue),
    //     .hsync(hsync),
    //     .vsync(vsync),
    //     .vde(vde),
        
    //     //aux Data (unused)
    //     .aux0_din(4'b0),
    //     .aux1_din(4'b0),
    //     .aux2_din(4'b0),
    //     .ade(1'b0),
        
    //     //Differential outputs
    //     .TMDS_CLK_P(hdmi_tmds_clk_p),          
    //     .TMDS_CLK_N(hdmi_tmds_clk_n),          
    //     .TMDS_DATA_P(hdmi_tmds_data_p),         
    //     .TMDS_DATA_N(hdmi_tmds_data_n)          
    // );

    
endmodule
