`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 01:51:03 PM
// Design Name: 
// Module Name: MultiplierComparator
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

module MultiplierComparator #(parameter N = 8) (
    input  [N-1:0] A,
    input  [N-1:0] B,
    output [2*N-1:0] ExactProduct,
    output [2*N-1:0] ApproxProduct,
    output [2*N-1:0] Error
);

    // Exact multiplication
    assign ExactProduct = A * B;

    // Approximate multiplication: truncation of 2 LSBs
    wire [N-1:0] A_approx = {A[N-1:2], 2'b00};
    wire [N-1:0] B_approx = {B[N-1:2], 2'b00};
    assign ApproxProduct = A_approx * B_approx;

    // Absolute Error = |Exact - Approx|a
    assign Error = (ExactProduct > ApproxProduct) ? 
                   (ExactProduct - ApproxProduct) : 
                   (ApproxProduct - ExactProduct);

endmodule

