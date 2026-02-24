module d_master_slave (input d,clk,output reg q);
  reg qm;
  always @(posedge clk) begin
    qm<=d;
  end
  always @(negedge clk) begin
    q<=qm;
  end
endmodule
