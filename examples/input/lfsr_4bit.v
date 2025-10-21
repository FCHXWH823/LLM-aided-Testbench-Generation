module lfsr_4bit (
    input wire clk,
    input wire reset_n,
    input wire en,
    output reg [3:0] lfsr_out
);
    wire feedback;
    
    // Feedback from taps at positions 4 and 1 (polynomial x^4 + x + 1)
    // This creates a maximal-length LFSR sequence
    assign feedback = lfsr_out[3] ^ lfsr_out[0];
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            lfsr_out <= 4'b1000;  // Seed value (non-zero)
        end else if (en) begin
            lfsr_out <= {feedback, lfsr_out[3:1]};
        end
    end
endmodule
