`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Top_Module(
    input clk,
    input [7:0] sw,
    output [15:0] led
);

    wire [7:0] A, B;
    wire [15:0] ExactProduct, ApproxProduct;

    assign A = sw[7:4];  // Upper 4 bits of sw = A
    assign B = sw[3:0];  // Lower 4 bits of sw = B

    // Example exact multiplier
    assign ExactProduct = A * B;

    // Example approximate multiplier (truncated multiplication)
    assign ApproxProduct = {8'b0, A[3:0] * B[3:0]};  // Truncated version

    assign led = ApproxProduct;  // Show result on LEDs

endmodule

