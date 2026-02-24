module jk_master_slave_tb;
  reg j,k,clk;
  wire qm,qs;
  jk_master_slave dut(.*);
  initial begin
    $dumpfile("out_jk_master_slave.vcd");
    $dumpvars(0,jk_master_slave_tb);
    $monitor("time=%0t clk=%b j=%b k=%b qm=%b qs=%b",$time,clk,j,k,qm,qs);
  end
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    j=0;k=1;#20;
    j=1;k=0;#20;
    j=0;k=0;#20;
    j=1;k=1;#30;
    $finish;
  end
endmodule
    
