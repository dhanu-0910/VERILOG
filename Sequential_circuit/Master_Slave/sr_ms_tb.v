module sr_master_slave_tb;
  reg s,r,clk;
  wire qm,qs;
  sr_master_slave dut(.*);
  initial begin
    $dumpfile("out_sr_master_slave.vcd");
    $dumpvars(0,sr_master_slave_tb);
    $monitor("time=%0t clk=%b s=%b r=%b qm=%b qs=%b",$time,clk,s,r,qm,qs);
  end
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    s=0;r=1;#20;
    s=1;r=0;#20;
    s=0;r=0;#20;
    s=1;r=1;#30;
    $finish;
  end
endmodule
    
