module dlatch (input d,clk, output reg q);
always @(clk or d ) begin
    if(clk) begin
        q=d;
    end
end
endmodule
