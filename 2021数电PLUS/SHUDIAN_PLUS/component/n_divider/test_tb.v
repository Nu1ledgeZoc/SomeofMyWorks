`timescale 1us/1ps
module test_tb;
    reg clk;
    reg [3:0] n;
    wire opt;
    test t1(clk,n,opt);
    initial begin
        n=1;
        #10000
        n=3;
        #10000
        $stop;
    end
    initial begin
        clk=0;
        forever begin
        #5 clk=~clk;
        end
    end
endmodule