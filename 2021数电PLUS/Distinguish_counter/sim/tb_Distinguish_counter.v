`timescale 1ns/1ps
module tb_Distinguish_counter;
    
reg clk,cmp,set;
wire [3:0] sel;
Distinguish_counter u0(
        cmp,
        clk,
        set,
        sel
);
initial begin
    clk=1'b0;cmp=0;set=0;
forever begin
    #500 clk=~clk;
end
end

initial begin
    #4000_000 $stop;
end
initial begin
    #110000 cmp=1;#8 cmp=0;
end
initial begin
    #1390000 cmp=1;#8 cmp=0;    
end

initial begin
    #2499000 cmp=1;#8 cmp=0;
end

initial begin
    #3700000 cmp=1;#8 cmp=0;
end
initial begin
    #999000 set=1;#1000 set=0;
    #999000 set=1;#1000 set=0;
     #999000 set=1;#1000 set=0;
    #999000 set=1;#1000 set=0;
   
end
endmodule