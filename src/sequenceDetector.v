module sequenceDetector (
    input clk,
    input reset,
    input din,
    output reg detected
);

    // State encoding
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;

    reg [2:0] currentState, nextState;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            currentState <= S0;
        else
            currentState <= nextState;
    end

    // Next state logic
    always @(*) begin
        case (currentState)
            S0: nextState = din ? S1 : S0;
            S1: nextState = din ? S1 : S2;
            S2: nextState = din ? S1 : S3;
            S3: nextState = din ? S4 : S0;
            S4: nextState = din ? S1 : S5;
            S5: nextState = din ? S1 : S3; // Allow overlaps
            default: nextState = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        if (currentState == S5)
            detected = 1;
        else
            detected = 0;
    end

endmodule
