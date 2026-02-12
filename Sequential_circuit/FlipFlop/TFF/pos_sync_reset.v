module tff(input t,clk,rst,output reg q);
always @(posedge clk) begin
    if(rst)
        q<=1'b0;
    else begin
        case(t)
            0:q<=q;
            1:q<=~q;
        endcase
    end
end
endmodule
