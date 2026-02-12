module tlatch (input t,clk, output reg q);
always @(clk or t ) begin
    if(clk) begin
        q=~q;
    end
end
endmodule
