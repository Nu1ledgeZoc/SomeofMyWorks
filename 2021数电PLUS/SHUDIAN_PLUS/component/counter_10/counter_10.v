//btn1�������ӣ���ʾ����ʾ    ��Ƶ/2^n
//���ŵ�Ƶ��
module counter_10 (
    btn1,q
);
    input   btn1;
    output reg[3:0] q;
    initial begin
        q=4'h1;
    end
    //btn1��btn2����ͬʱ����
    always @(posedge btn1) begin
       
            if(q==9) q= (4'h1);
            else
            q=(q+1'b1);  
        
       
    end
    
endmodule