`timescale 1ns / 1ps

module tb_three_bit;

// Inputs
reg [2:0] a;
reg [2:0] b;

// Outputs
wire [5:0] y;

// Instantiate the Unit Under Test (UUT)
three_bit_multiplier uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    // Initialize inputs
    a = 0;
    b = 0;

    // Apply test cases
    #10 a = 3'b000; b = 3'b000; // Test case: 0 * 0
    #10 a = 3'b001; b = 3'b001; // Test case: 1 * 1
    #10 a = 3'b011; b = 3'b010; // Test case: 3 * 2
    #10 a = 3'b111; b = 3'b011; // Test case: 7 * 3
    #10 a = 3'b101; b = 3'b100; // Test case: 5 * 4
    #10 a = 3'b110; b = 3'b110; // Test case: 6 * 6
    #10 a = 3'b111; b = 3'b111; // Test case: 7 * 7

    // Finish simulation
    #10 $finish;
end

// Monitor changes
initial begin
    $monitor("Time = %0d ns | a = %b | b = %b | y = %b (%0d)",
             $time, a, b, y, y);
end

endmodule
