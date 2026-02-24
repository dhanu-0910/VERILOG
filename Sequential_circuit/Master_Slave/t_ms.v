module t_master_slave (input t,clk,rst,output reg q);
  reg qm;
  always @(posedge clk or posedge rst) begin
    if(rst)
      qm<=0;
    else if(t)
      qm<=~qm;
    else
      qm<=qm;
  end
  always @(negedge clk or posedge rst) begin
    if(rst)
      q<=0;
    else
      q<=qm;
  end
endmodule
//Another method
module t_latch (input t,clk,output reg q);
  initial q=0;
  always @(*)begin
    if(clk) begin
      if(t)
        q=~q;
      else
        q=q;
    end
  end
endmodule

module t_master_slave(input t,clk,output qm,qs);
  t_latch t1(.t(t),.clk(clk),.q(qm));
  t_latch t2(.t(qm),.clk(~clk),.q(qs));
endmodule
