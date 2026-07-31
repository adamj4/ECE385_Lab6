//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//                                                                       --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

module  color_mapper ( input  logic [9:0] drawX, drawY,
                       input logic [31:0] reg_value,
                       input logic [3:0] fgd_r, fgd_g, fgd_b, bkg_r, bkg_g, bkg_b,
                       output logic [3:0]  Red, Green, Blue,
                       output logic [9:0] reg_to_read,
                       output logic pixel_val);

    const int NUM_COLS = 80;
    const int NUM_ROWS = 30;
    const int TEXT_WIDTH = 8;
    const int TEXT_HEIGHT = 16;
    
    
    logic [10:0] addr;
    logic [7:0] data;
   
    font_rom font_rom_i (.*);
    
    logic [1:0] char_to_read;
    logic [7:0] char_byte;
    logic pixel_val;
    
    // get register from drawX, drawY
    
    
    always_comb begin
        logic [6:0] col = drawX >> 3;
        logic [4:0] row = drawY >> 4;
        reg_to_read = (row * NUM_COLS + col) >> 2;
        char_to_read = (row * NUM_COLS + col) & 2'b11;
        
        case(char_to_read)
            2'b00: char_byte = reg_value[7:0];
            2'b01: char_byte = reg_value[15:8];
            2'b10: char_byte = reg_value[23:16];
            2'b11: char_byte = reg_value[31:24];
        endcase
        addr = (char_byte[6:0] << 4) + (drawY[3:0]);
        
        pixel_val = data[7 - (drawX[2:0])];
        if (char_byte[7])
            pixel_val = ~pixel_val;
        
        Red = pixel_val ? fgd_r : bkg_r;
        Green = pixel_val ? fgd_g : bkg_g;
        Blue = pixel_val ? fgd_b : bkg_b;
        
    end
    
endmodule
