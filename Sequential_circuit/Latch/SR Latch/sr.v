module srlatch (input s,input r,input clk,output reg q);
always @(clk or s or r or q) begin
if (s==1 && r==0) begin
    q=1;   
end
else if (s==0 && r==1) begin
    q=0;     
end
else if (s==0 && r==0) begin
    q=q;
end
else begin
    q=1'bx;
end
end
endmodule
