module counter_4 (
    btn,
    otp,

);
    input btn;
    output reg[1:0] otp;
    initial begin
        otp=2'b00;
    end
    always @(posedge btn) begin
        otp<=(otp+1'b1)%4;
    end
endmodule