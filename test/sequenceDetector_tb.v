`timescale 1ns / 1ps

module sequenceDetector_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg in;
    wire detected;

    // Instantiate the DUT (Device Under Test)
    sequenceDetector uut (
        .clk(clk),
        .reset(reset),
        .din(in),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Logging for debugging
    task log_state(input integer timeVal);
        $display("T=%0t | Input=%b | Detected=%b", timeVal, in, detected);
    endtask

    // Test sequence
    initial begin
        // VCD Dump
        $dumpfile("waves/waveform.vcd");
        $dumpvars(0, sequenceDetector_tb);

        // Init
        clk = 0;
        reset = 1;
        in = 0;

        #10;
        reset = 0;

        // Test case 1: Simple sequence 10010
        #10; in = 1; log_state(30);
        #10; in = 0; log_state(40);
        #10; in = 0; log_state(50);
        #10; in = 1; log_state(60);
        #10; in = 0; log_state(70);  // Should detect here

        // Test case 2: No sequence
        #10; in = 1; log_state(80);
        #10; in = 1; log_state(90);
        #10; in = 0; log_state(100);
        #10; in = 1; log_state(110);
        #10; in = 1; log_state(120);

        // Test case 3: Overlapping sequences 0010010010
        #10; in = 0; log_state(130);
        #10; in = 0; log_state(140);
        #10; in = 1; log_state(150);
        #10; in = 0; log_state(160);
        #10; in = 0; log_state(170);
        #10; in = 1; log_state(180);
        #10; in = 0; log_state(190);  // First detection
        #10; in = 0; log_state(200);
        #10; in = 1; log_state(210);
        #10; in = 0; log_state(220);  // Second detection

        // Test case 4: Reset during sequence
        #10; in = 1; log_state(230);
        #10; in = 0; log_state(240);
        #10; in = 0; log_state(250);
        #10; reset = 1; log_state(260);
        #10; reset = 0; log_state(270);
        #10; in = 1; log_state(280);
        #10; in = 0; log_state(290);

        // Finish simulation
        #50;
        $finish;
    end

endmodule
