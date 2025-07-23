`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 03:09:04 PM
// Design Name: 
// Module Name: tb_ApproxMultiplier
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

module tb_ApproxMultiplier;

    // Parameter
    parameter N = 8;

    // Inputs
    reg [N-1:0] A;
    reg [N-1:0] B;

    // Output
    wire [2*N-1:0] ApproxProduct;

    // Instantiate the Unit Under Test (UUT)
    ApproxMultiplier #(N) uut (
        .A(A),
        .B(B),
        .ApproxProduct(ApproxProduct)
    );

    // Task to display values
    task display_result;
        begin
            $display("Time=%0t | A=%0d B=%0d | A_approx=%0d B_approx=%0d | ApproxProduct=%0d", 
                     $time, A, B, {A[N-1:2], 2'b00}, {B[N-1:2], 2'b00}, ApproxProduct);
        end
    endtask

    initial begin
        // Monitor signals
        $monitor("A = %0d, B = %0d, ApproxProduct = %0d", A, B, ApproxProduct);

        // Test Vectors
        A = 8'd15; B = 8'd10; #10; display_result();
        A = 8'd255; B = 8'd255; #10; display_result();
        A = 8'd100; B = 8'd25; #10; display_result();
        A = 8'd64; B = 8'd3; #10; display_result();
        A = 8'd0; B = 8'd200; #10; display_result();
        A = 8'd7; B = 8'd7; #10; display_result();
        A = 8'd1; B = 8'd1; #10; display_result();
        A = 8'd128; B = 8'd128; #10; display_result();

        $finish;
    end

endmodule

