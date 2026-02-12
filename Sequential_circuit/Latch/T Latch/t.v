module tlatch (input t,clk, output reg q);
always @(clk or t ) begin
    if(clk) begin
        if(t)
            q<=~q;
        else
            q<=q;
    end
end
endmodule
