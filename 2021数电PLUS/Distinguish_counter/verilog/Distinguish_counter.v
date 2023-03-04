//`timescale 1ns/1ps
//cmp1_sig：电压比较器输出信号，超过Uref时，置为逻辑一，Uref编码为200~201左右
//clk     ：采样时钟，每遇到一次它的上升沿，计数自增一次,1MHz
//set     ：置位信号，从1000进制计数器的进位端引出接上，使得每个周期都可以读取并判断
//sel_sig ：根据计数的多少输出的选择信号，0001为正弦，0010为iso，0100为square，1000为jag
module Distinguish_counter (
    input wire cmp1_sig,
    input wire clk,
    input wire set,
    output reg [3:0] sel_sig
);
integer i=0;

initial sel_sig=4'b0000;

always @(posedge clk) begin
        if(!set)
        i=i+1;
        else 
        i=0;
end
    
always @(posedge cmp1_sig) begin
    if (i<=120) begin
        sel_sig=4'b0001;
        $display("1 i=%d",i);
    end else begin
        if (i>=380 && i<=420) begin
            sel_sig=4'b0010;
            $display("2 i=%d",i);
        end else begin
            if (i>=490 && i<=510) begin
                sel_sig=4'b0100;
                $display("3 i=%d",i);
            end else begin
                if (i>=690 && i<=720) begin
                    sel_sig=4'b1000;
                    $display("4 i=%d",i);
                end
            end
        end
    end
    //$display("i=%d",i);
end   
    
endmodule