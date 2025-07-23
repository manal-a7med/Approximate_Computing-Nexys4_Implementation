// TopWrapper.v
`timescale 1ns/1ps
module TopWrapper(
    input clk,
    input [7:0] sw,
    output [15:0] led,
    output [6:0] seg,
    output reg [3:0] an
);
    wire [7:0] A = sw[7:4];
    wire [7:0] B = sw[3:0];

    wire [15:0] ExactProduct, ApproxProduct;
    wire [7:0] PercentError;
    wire ErrorFlag;

    TopModule #(8) uut (
        .A(A),
        .B(B),
        .ExactProduct(ExactProduct),
        .ApproxProduct(ApproxProduct),
        .PercentError(PercentError),
        .ErrorFlag(ErrorFlag)
    );

    assign led[7:0] = ExactProduct[7:0];
    assign led[15:8] = ApproxProduct[7:0];

    wire [3:0] tens = PercentError / 10;
    wire [3:0] ones = PercentError % 10;

    reg [1:0] sel = 0;
    reg [3:0] digit;

    always @(posedge clk) begin
        sel <= sel + 1;
    end

    always @(*) begin
        case (sel)
            2'b00: begin an = 4'b1110; digit = ones; end
            2'b01: begin an = 4'b1101; digit = tens; end
            default: begin an = 4'b1111; digit = 4'd0; end
        endcase
    end

    SevenSegmentDecoder decoder (
        .digit(digit),
        .seg(seg)
    );
endmodule
