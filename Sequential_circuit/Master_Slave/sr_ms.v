module sr_latch (input  s, r, clk,output reg q);
always @(*) begin
  if (clk) begin
        if (s & ~r) 
          q = 1'b1;
        else if (~s & r) 
          q = 1'b0;
        else if (~s & ~r) 
          q = q; 
    	else  if(s & r)         
           q = 1'bx; 
    	else
          q=1'bx;
  end 
end
endmodule
module sr_master_slave(input s,r,clk,output qm,qs);
  sr_latch sr1(.s(s),.r(r),.clk(clk),.q(qm));
  sr_latch sr2(.s(qm),.r(~qm),.clk(~clk),.q(qs));
endmodule
