`timescale 1us/1ps
module test_tb ;
reg clk;

reg [1:0] mode;
wire cout;
wire [7:0] o;
test t1(clk,mode,cout,o);
initial begin
    clk=0;
    forever begin
        #5 clk=~clk;
    end
end

initial begin
    mode=0;
    #20000
    mode=1;
    #20000
    mode=2;
    #20000
    mode=3;
    #20000
    $stop;
end
    
endmodule