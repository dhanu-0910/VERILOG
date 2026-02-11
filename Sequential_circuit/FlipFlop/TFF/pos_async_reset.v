module tff(input t,clk,rst,output reg q);
always @(posedge clk or posedge rst) begin
    if(rst)
        q<=1'b0;
    else
        q<=~t;
end
endmodule
