`timescale 1ns / 1ps

module eight_bit_adder(
    input [7:0] a,        
    input [7:0] b,       
    input cin,            
    output [7:0] sum,     
    output cout           
    );

    
    wire c_out_low;

    //first 4-bit 
    four_bit_adder adder_low (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c_out_low)
    );

    // second 4-bit
    four_bit_adder adder_high (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c_out_low),
        .sum(sum[7:4]),
        .cout(cout)
    );

endmodule
