`timescale 1ns / 1ps
module flip_flop(
    input logic clk,       
    input logic reset,       
    input logic [7:0]d,        
    output logic [7:0]q         
);

    always_ff @(posedge clk or negedge  reset) begin
        if (!reset) begin
            q <= 0;        
        end else begin
            q <= d;        
        end
    end

endmodule 