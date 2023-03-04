//btn1周期增加，显示几表示    基频/2^n
//共1+九档频率 0默认为20分频
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