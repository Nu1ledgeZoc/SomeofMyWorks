`timescale 1us/1ps
module test_tb;
reg btn1;
wire [3:0] q;
test t1(btn1,q);
initial begin
btn1=0;
repeat(18)
 #5 btn1=~btn1;
 repeat(18)
  #5 btn1=~btn1;
  #20 $stop;
end


endmodule