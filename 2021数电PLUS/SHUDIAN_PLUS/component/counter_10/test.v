module test (
    btn1,q
);
input wire btn1;
output wire [3:0] q;
counter_10 t(btn1,q);
    
endmodule