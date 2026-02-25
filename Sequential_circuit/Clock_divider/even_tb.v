module cd_tb;
  parameter n=4;
  reg clk,rst;
  wire clk_out;
  cd #(n)dut(.*);
  initial begin
    $dumpfile("out_cd.vcd");
    $dumpvars(0,cd_tb);
    $monitor("time=%0t clk=%b rst=%b  clk_out=%b",$time,clk,rst,clk_out);
  end
  always #5 clk=~clk;
  initial begin
    clk=1;rst=1;#10;
    rst=0;#150;
    $finish;
  end
endmodule
  
