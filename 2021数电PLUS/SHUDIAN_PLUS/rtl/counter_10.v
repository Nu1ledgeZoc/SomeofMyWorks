//btn1�������ӣ���ʾ����ʾ    ��Ƶ/2^n
//��1+�ŵ�Ƶ�� 0Ĭ��Ϊ20��Ƶ
module counter_10 (
    btn1,q
);
    input   btn1;
    output reg[3:0] q;
    initial begin
        q=4'h0;
    end
   
    always @(posedge btn1) begin
       
            if(q==9) q= (4'h0);
            else
            q=(q+1'b1);  
        
       
    end
    
endmodule