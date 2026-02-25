module f_2_tb();
  reg clk,rst;
  wire clk_out;
  f_2 dut(.*);
  initial begin
    $dumpfile("out_f_2.vcd");
    $dumpvars(0,f_2_tb);
    $monitor("time=%0t clk=%b rst=%b clk_out=%b",$time,clk,rst,clk_out);
  end
  always #5 clk=~clk;
  initial begin
    clk=1;rst=1;#10;
    rst=0;#50;
    $finish;
  end
endmodule
