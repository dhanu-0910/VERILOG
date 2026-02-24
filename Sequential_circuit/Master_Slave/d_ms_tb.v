module d_master_slave_tb;
  reg d,clk;
  wire q;
  d_master_slave dut(.*);
  initial begin
    $dumpfile("out_d_master_slave.vcd");
    $dumpvars(0,d_master_slave_tb);
    $monitor("time=%0t clk=%b d=%b q=%b",$time,clk,d,q);
  end
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    d=0;#15;
    d=1;#15;
    d=0;#15;
    d=1;#15;
    $finish;
  end
endmodule
    
