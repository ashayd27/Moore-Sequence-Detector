// Description: Testbench for sequenceDetector module

`timescale 1ns/1ps

module sequenceDetector_tb;

    logic clk;
    logic reset;
    logic inBit;
    logic detected;
  
    sequenceDetector uut (
        .clk(clk),
        .reset(reset),
        .inBit(inBit),
        .detected(detected)
    );

    initial clk = 0;
    always #5 clk = ~clk; // 10 ns clock period

    initial begin
        $dumpfile("waves/waveform.vcd");
        $dumpvars(0, sequenceDetector_tb);

        reset = 1;
        inBit = 0;
        #10;

        reset = 0;

        // Input sequence: 0010010010 (should detect twice)
        sendBit(0); sendBit(0); sendBit(1); sendBit(0); sendBit(0);
        sendBit(1); sendBit(0); sendBit(0); sendBit(1); sendBit(0);

        #50;
        $finish;
    end

    task sendBit(input logic bitVal);
        begin
            inBit = bitVal;
            #10;
        end
    endtask

endmodule
