`timescale 1ns / 1ps


module odd_numbers(
      input logic [7:0] data,
    input logic clk,
    input logic reset,
    input logic en, // enable
    output logic oddnumber               // output
    );
    logic [7:0] q ;
 register r1(
 .data(data),
 .clk(clk),
 .reset(reset),
 .en(en),
  .q(q) 
  );    

//assign oddnumber = q[7] ^ q[6] ^q[5] ^ q[4]^ q[3] ^ q[2]^q[1] ^ q[0] ;
  assign oddnumber = ^q ;
endmodule
