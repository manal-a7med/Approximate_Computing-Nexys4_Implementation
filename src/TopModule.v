`timescale 1ns/1ps

module TopModule #(parameter N = 8)(
    input [N-1:0] A,
    input [N-1:0] B,
    output [2*N-1:0] ExactProduct,
    output [2*N-1:0] ApproxProduct,
    output [7:0] PercentError,
    output ErrorFlag
);
    assign ExactProduct = A * B;
    assign ApproxProduct = {A[N-1:N/2] * B[N-1:N/2], {(N){1'b0}}};

    wire [15:0] diff = (ExactProduct > ApproxProduct) ?
                       (ExactProduct - ApproxProduct) :
                       (ApproxProduct - ExactProduct);

    assign PercentError = (ExactProduct != 0) ? ((diff * 100) / ExactProduct) : 8'd0;
    assign ErrorFlag = (PercentError > 10);
endmodule
