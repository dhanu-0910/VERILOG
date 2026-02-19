module down_counter #(parameter n=4)(input clk,rst,output reg [n-1:0]q);
  always @(posedge clk) begin
    if(rst)
      q<=0;
    else 
      q<=q-1;
  end
endmodule
//Testbench
module down_counter_tb;
  parameter n=4;
  reg clk,rst;
  wire [n-1:0]q;
  down_counter #(n)dut(.*);
  initial begin
    $monitor("clk=%b rst=%b q=%b",clk,rst,q);
  end
  
  always #5 clk=~clk;
  initial begin
    clk=1;
    rst=1;#10;
    rst=0;#150;
    $dumpfile("out_down_counter.vcd");
    $dumpvars(0,down_counter_tb);
  #500  $finish;
  end
endmodule
  
