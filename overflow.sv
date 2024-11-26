`timescale 1ns / 1ps
module overflow(
input logic [7:0] count,
input logic clk,
input logic reset,
output logic oveerflow

    );
    logic q;
    
flip_flop ff(
.clk(clk),       
.reset(reset),       
.d(count[7]),        
.q(q)
);   
assign oveerflow = q & ~count[7];

endmodule

