`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    binarycoddeddecimal 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//                     In this module, 16-bit decimal number "bin" is splitted in to equivalent 4-bit binary numbers
//                     For example:
//                                 BCD of 841 = 0000 1000 0100 0001 
//////////////////////////////////////////////////////////////////////////////////
module binarycoddeddecimal(
    input [15:0] bin,
	output reg[3:0] thousands,
	output reg[3:0] hundreds,
    output reg[3:0] tens,
    output reg[3:0] ones
    );
integer i;
always @(bin)
begin
thousands=4'd0;
hundreds=4'd0;
tens=4'd0;
ones=4'd0;
for(i=15;i>=0;i=i-1)begin
if(thousands>=5)
  thousands=thousands+3;
if(hundreds>=5)
  hundreds=hundreds+3;
if(tens>=5)
  tens=tens+3;
if(ones>=5)
  ones=ones+3;
thousands=thousands<<1;
thousands[0]=hundreds[3];
hundreds=hundreds<<1;
hundreds[0]=tens[3];
tens=tens<<1;
tens[0]=ones[3];
ones=ones<<1;
ones[0]=bin[i];
end end
endmodule