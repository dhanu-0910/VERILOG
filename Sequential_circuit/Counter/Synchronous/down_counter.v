module up_counter #(parameter n=4)(input clk,rst,output reg [n-1:0]q);
  always @(posedge clk) begin
    if(rst)
      q<=0;
    else 
      q<=q-1;
  end
endmodule
//Testbench
module up_counter_tb;
  parameter n=4;
  reg clk,rst;
  wire [n-1:0]q;
  up_counter #(n)dut(.*);
  initial begin
    $monitor("clk=%b rst=%b q=%b",clk,rst,q);
  end
  
  always #5 clk=~clk;
  initial begin
    clk=1;
    rst=1;#10;
    rst=0;#150;
     $dumpfile("ab.vcd");
    $dumpvars(0,up_counter_tb);
  #500  $finish;
  end
endmodule
  
