module counter_3bit (
    input wire clk,
    input wire reset_n,
    input wire en,
    output reg [2:0] count
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= 3'b000;
        end else if (en) begin
            count <= count + 1;
        end
    end
endmodule
