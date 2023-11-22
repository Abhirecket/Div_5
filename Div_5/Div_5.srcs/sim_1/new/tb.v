`timescale 1ns / 1ps
module tb();
//COLLEGE OF VLSI
reg clk, rst, d_in;
wire [2:0] remainder;
wire d_out;

    Div_5 dut(clk,
              rst,
              d_in,
              d_out,
              remainder                   
              );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
       rst = 1'b0;       d_in = 1'b0;
       @(posedge clk);
       rst = 1'b1;

       repeat(20) begin
        @(posedge clk);
        d_in = $random;
       end
       
       $finish;
    end
endmodule
//COLLEGE OF VLSI
