module tff(input t,clk,rst,output reg q);
  always @(negedge clk or posedge rst) begin
    if(rst)
      q<=1'b0;
    else if(t)
      q<=~q;
    else
      q<=q;
  end
endmodule
//async
module up_counter #(parameter n=4)(input clk,rst,output [n-1:0]q);
  genvar i;
  generate
    for(i=0;i<n;i=i+1) begin:ripple
      if(i==0)
        tff t0(1'b1,clk,rst,q[i]);
      else
        tff ti(1'b1,q[i-1],rst,q[i]);
    end
  endgenerate
endmodule
//Testbench
module up_counter_tb;
  parameter n=4;
  reg clk,rst;
  wire [n-1:0]q;
  up_counter #(n)dut(.*);
  initial begin
    $dumpfile("up_counter.vc");
    $dumpvars(0,up_counter_tb);
    $monitor("clk=%b rst=%b q=%b",clk,rst,q);
  end
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=1;#10;
    rst=0;#150;
    $finish;
  end
endmodule
    
