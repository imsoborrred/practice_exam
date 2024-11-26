`timescale 1ns / 1ps

module register(
    input logic [7:0] data,
    input logic clk,
    input logic reset,
    input logic en, // enable
    output logic [7:0] q // output
  );

  always @(posedge clk or negedge reset) begin
    if (!reset)
      q <= 0; 
    else if (en)
      q <= data;
  end

endmodule