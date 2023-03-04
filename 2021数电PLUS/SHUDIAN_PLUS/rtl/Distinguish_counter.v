//`timescale 1ns/1ps
//cmp1_sig����ѹ�Ƚ�������źţ�����Urefʱ����Ϊ�߼�һ��Uref����Ϊ200~201����
//clk     ������ʱ�ӣ�ÿ����һ�����������أ���������һ��,1MHz
//set     ����λ�źţ���1000���Ƽ������Ľ�λ���������ϣ�ʹ��ÿ�����ڶ����Զ�ȡ���ж�
//sel_sig �����ݼ����Ķ��������ѡ���źţ�0001Ϊ���ң�0010Ϊiso��0100Ϊsquare��1000Ϊjag
module Distinguish_counter (
    input wire cmp1_sig,
    input wire clk,
    input wire set,
    output reg [3:0] sel_sig
);
integer i=0;



always @(posedge clk) begin
        if(!set)
        i=i+1;
        else 
        i=0;
end
    
always @(posedge cmp1_sig) begin
    if (i<=40) begin
        sel_sig=4'b0001;
        //$display("1 i=%d",i);
    end else begin
        if (i>=220 && i<=270) begin
            sel_sig=4'b0010;
            //$display("2 i=%d",i);
        end else begin
            if (i>=410 && i<=465) begin
                sel_sig=4'b1000;
                //$display("3 i=%d",i);
            end else begin
                if (i>=485 && i<=520) begin
                    sel_sig=4'b0100;
                    //$display("4 i=%d",i);
                end
            end
        end
    end
    //$display("i=%d",i);
end   
    
endmodule