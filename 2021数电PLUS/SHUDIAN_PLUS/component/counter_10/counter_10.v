//btn1周期增加，显示几表示    基频/2^n
//共九档频率
module counter_10 (
    btn1,q
);
    input   btn1;
    output reg[3:0] q;
    initial begin
        q=4'h1;
    end
    //btn1和btn2不能同时按下
    always @(posedge btn1) begin
       
            if(q==9) q= (4'h1);
            else
            q=(q+1'b1);  
        
       
    end
    
endmodule