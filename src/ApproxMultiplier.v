`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 01:50:06 PM
// Design Name: 
// Module Name: ApproxMultiplier
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


module ApproxMultiplier #(parameter N = 8) (
    input  [N-1:0] A,
    input  [N-1:0] B,
    output [2*N-1:0] ApproxProduct
);
    wire [N-1:0] A_approx, B_approx;

    // Truncation: Set 2 LSBs to zero (ignore LSBs)
    assign A_approx = {A[N-1:2], 2'b00};  // Mask out lowest 2 bits
    assign B_approx = {B[N-1:2], 2'b00};  // Mask out lowest 2 bits

    // Multiply the approximated values
    assign ApproxProduct = A_approx * B_approx;

endmodule

