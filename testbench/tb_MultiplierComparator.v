`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 03:09:44 PM
// Design Name: 
// Module Name: tb_MultiplierComparator
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


`timescale 1ns / 1ps

module tb_MultiplierComparator;

    // Parameter
    parameter N = 8;
    parameter TEST_COUNT = 20;

    // Inputs
    reg [N-1:0] A;
    reg [N-1:0] B;

    // Outputs
    wire [2*N-1:0] ExactProduct;
    wire [2*N-1:0] ApproxProduct;
    wire [2*N-1:0] Error;

    // Percent error (real)
    real percent_error;

    // Instantiate the Unit Under Test (UUT)
    MultiplierComparator #(N) uut (
        .A(A),
        .B(B),
        .ExactProduct(ExactProduct),
        .ApproxProduct(ApproxProduct),
        .Error(Error)
    );

    // Task to display results
    task display_result;
        begin
            if (ExactProduct != 0)
                percent_error = (Error * 100.0) / ExactProduct;
            else
                percent_error = 0.0;

            $display("A=%3d, B=%3d | Exact=%6d | Approx=%6d | Error=%4d | Percent Error=%.2f%%", 
                      A, B, ExactProduct, ApproxProduct, Error, percent_error);
        end
    endtask

    integer i;

    initial begin
        $display("--------- Randomized Multiplier Comparator Test ---------");

        // Edge cases first
        A = 0; B = 0; #10; display_result();
        A = 8'd255; B = 8'd255; #10; display_result();
        A = 8'd1; B = 8'd1; #10; display_result();
        A = 8'd255; B = 8'd0; #10; display_result();
        A = 8'd0; B = 8'd255; #10; display_result();

        // Randomized test cases
        for (i = 0; i < TEST_COUNT; i = i + 1) begin
            A = $urandom % 256;
            B = $urandom % 256;
            #10;
            display_result();
        end

        $finish;
    end

endmodule
