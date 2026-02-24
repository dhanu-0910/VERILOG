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
