// tb_TopModule.v
`timescale 1ns/1ps
module tb_TopModule;
    parameter N = 8;

    reg [N-1:0] A, B;
    wire [2*N-1:0] ExactProduct, ApproxProduct;
    wire [7:0] PercentError;
    wire ErrorFlag;

    TopModule #(N) dut (
        .A(A),
        .B(B),
        .ExactProduct(ExactProduct),
        .ApproxProduct(ApproxProduct),
        .PercentError(PercentError),
        .ErrorFlag(ErrorFlag)
    );

    initial begin
        $display("Time\tA\tB\tExact\tApprox\t%%Err\tFlag");
        $monitor("%0dns\t%d\t%d\t%d\t%d\t%d\t%b", $time, A, B, ExactProduct, ApproxProduct, PercentError, ErrorFlag);

        A = 8'd0;   B = 8'd0;   #10;
        A = 8'd2;   B = 8'd3;   #10;
        A = 8'd255; B = 8'd1;   #10;
        A = 8'd150; B = 8'd12;  #10;
        A = 8'd100; B = 8'd100; #10;
        $finish;
    end
endmodule
