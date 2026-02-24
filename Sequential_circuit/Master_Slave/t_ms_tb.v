module t_master_slave_tb;
  reg t,clk,rst;
  wire q;
  t_master_slave dut(.*);
  initial begin
    $dumpfile("out_t_master_slave.vcd");
    $dumpvars(0,t_master_slave_tb);
    $monitor("time=%0t clk=%b rst=%b t=%b q=%b",$time,clk,rst,t,q);
  end
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;#10;
    rst=0;
    t=0;#15;
    t=1;#15;
    t=0;#15;
    t=1;#15;
    $finish;
  end
endmodule
    
