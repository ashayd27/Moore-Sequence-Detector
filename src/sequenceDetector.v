module sequenceDetector (
    input logic clk,
    input logic reset,
    input logic inBit,
    output logic detected
);

    typedef enum logic [2:0] {
        s0, s1, s2, s3, s4
    } state_t;

    state_t currentState, nextState;

    always_comb begin
        nextState = currentState;
        detected = 0;

        case (currentState)
            s0: nextState = (inBit) ? s1 : s0;
            s1: nextState = (inBit) ? s1 : s2;
            s2: nextState = (inBit) ? s3 : s0;
            s3: nextState = (inBit) ? s1 : s4;
            s4: begin
                nextState = (inBit) ? s1 : s0;
                detected = (inBit == 0) ? 1 : 0;
            end
        endcase
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            currentState <= s0;
        else
            currentState <= nextState;
    end

endmodule
