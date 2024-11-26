`timescale 1ns / 1ps

module three_bit_multiplier(
input logic [2:0] a,
input logic [2:0] b,
output logic [5:0] y
    );
    
assign y = a * b ;    
    
endmodule
