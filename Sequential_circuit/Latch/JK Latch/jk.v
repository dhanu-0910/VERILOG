module jklatch (input j,k,clk, output reg q);
always @(clk or j or k ) begin
    if(clk) begin
        if(j & k)
            q=~q;
        else if(~j & k)
            q=1'b0;
        else if(j & ~k)
            q=1'b1;
        else if(~j & ~k)
            q=q;
    end
end
endmodule
