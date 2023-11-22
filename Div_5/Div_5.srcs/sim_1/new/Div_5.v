
module Div_5 (clk,
              rst,
              d_in,
              d_out,
              remainder                   
              );
//COLLEGE OF VLSI
input clk, rst, d_in;
output reg [2:0] remainder;
output reg d_out;

parameter IDLE=3'd0, REM1=3'd1,REM2=3'd2, REM3=3'd3, REM4=3'd4, REM0=3'd5;
reg [2:0] pr_state, nxt_state;

always @(posedge clk , negedge rst)
    begin
    if(!rst==1) begin
        pr_state <= IDLE;
        d_out <= 1'd0;
        end
    else
        pr_state <= nxt_state;

    end

always @(pr_state, d_in) 
    begin
    case(pr_state)

        IDLE : begin
               if(d_in==0) begin
                  nxt_state <= IDLE;
                end

                else begin
                  nxt_state <= REM1;
                end

            d_out <= 1'b0;
            remainder <=3'd0;
            end

        REM1 : begin
               if(d_in==0) begin
                  nxt_state <= REM2;
                end

                else begin
                  nxt_state <= REM3;
                end

            d_out <= 1'b0;
            remainder <= 3'd1;
            end

        REM2 : begin
               if(d_in==0) begin
                  nxt_state <= REM4;
                end

                else begin
                  nxt_state <= REM0;
                end

            d_out <= 1'b0;
            remainder <= 3'd2;
            end
  
        REM3 : begin
               if(d_in==0) begin
                  nxt_state <= REM1;
                end

                else begin
                  nxt_state <= REM2;
                end

            d_out <= 1'b0;
            remainder <= 3'd3;
            end
  

        REM4 : begin
               if(d_in==0) begin
                  nxt_state <= REM3;
                end

                else begin
                  nxt_state <= REM4;
                end

            d_out <= 1'b0;
            remainder <= 3'd4;
            end
            

        REM0 : begin
               if(d_in==0) begin
                  nxt_state <= REM0;
                end

                else begin
                  nxt_state <= REM1;
                end

            d_out <= 1'b1;              //output is high
            remainder <= 3'd0;
            end
       endcase
       end
endmodule
//COLLEGE OF VLSI