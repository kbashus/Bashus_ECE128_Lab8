`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2023 10:51:17 AM
// Design Name: 
// Module Name: Display_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Display_Top(

input mclk,
output wire [6:0] seg,
output wire [3:0] an);


 reg [15:0] stat_bcd = 16'b0;
 
 wire en;
 wire [11:0] bin_d_in;
 wire [15:0] bcd_d_out;
 wire rdy;
 wire clock_out;
 
 example_count uut1(clock_out,en,bin_d_in);
 bin2BCD uut2(clock_out, en,bin_d_in,bcd_d_out,rdy);
 multi_seg_drive uut3(clock_out,stat_bcd,an, seg);
 clk_divider uut4(mclk,clock_out);
 
 always @(posedge mclk)
    begin
    if(rdy)
       begin
       stat_bcd<=bcd_d_out;
       end
     end
    
endmodule
