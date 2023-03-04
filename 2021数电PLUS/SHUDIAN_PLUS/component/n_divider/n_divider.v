//将时钟分频为2^(1~9)
module n_divider (
    input [3:0] n,
    input clk,
    output reg opt
);

    reg [9:0] div;
     reg [8:0] pulse;
   
    always @(*) begin
        case(n)
        
        4'd1:   div=10'd2;
        4'd2:   div=10'd4;
        4'd3:   div=10'd8;
        4'd4:   div=10'd16;
        4'd5:   div=10'd32;
        4'd6:   div=10'd64;
        4'd7:   div=10'd128;
        4'd8:   div=10'd256;
        4'd9:   div=10'd512;
        default: div=10'd2;
        endcase
        pulse=div/2;
    end
   
    reg [8:0] count=0;
    always @(posedge clk) begin
        if (count==div-1) begin
            count<=0;
        end
        else begin
            count<=count+1'b1;
        end

        if ((count >= 0) && (count<pulse)) 
            opt<=1;
        
        else opt<=0;
    end
endmodule