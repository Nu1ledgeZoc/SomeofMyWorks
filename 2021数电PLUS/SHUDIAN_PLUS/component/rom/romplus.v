module romplus (
    mode,
    clk,
    otp
);
    input [1:0]mode,clk;
    output reg[7:0] otp;
    always @(mode) begin
        
    end
endmodule