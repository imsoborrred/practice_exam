`timescale 1ns / 1ps

module overflow_tb;

    // Testbench signals
    logic [7:0] count;
    logic clk;
    logic reset;
    logic oveerflow;

    // Instantiate the DUT (Device Under Test)
    overflow uut (
        .count(count),
        .clk(clk),
        .reset(reset),
        .oveerflow(oveerflow)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // Generate a clock with a period of 10ns

    // Test stimulus
    initial begin
        // Initialize signals
        count = 8'b0;
        reset = 1'b1;

        // Reset the flip-flop
        #10 reset = 1'b0;
        #10 reset = 1'b1;

        // Test case 1: No overflow
        count = 8'b11111111; // MSB is 0
        #10;
        if (oveerflow !== 1'b0) $display("Test Case 1 Failed: No overflow expected.");

        // Test case 2: Overflow condition
        count = 8'b11111111; // MSB is 1
        #10;
        if (oveerflow !== 1'b1) $display("Test Case 2 Failed: Overflow expected.");

        // Test case 3: Toggle MSB back to 0
        count = 8'b01111111;
        #10;
        if (oveerflow !== 1'b0) $display("Test Case 3 Failed: No overflow expected.");

        // Test case 4: Apply reset during operation
        count = 8'b10000000; // MSB is 1
        #10 reset = 1'b0;
        #10;
        if (oveerflow !== 1'b0) $display("Test Case 4 Failed: Overflow should be cleared after reset.");
        reset = 1'b1;

        // End simulation
        #20 $finish;
    end

    // Monitor signals for debugging
    initial begin
        $monitor("Time: %0dns | count: %b | clk: %b | reset: %b | oveerflow: %b", 
                  $time, count, clk, reset, oveerflow);
    end

endmodule
