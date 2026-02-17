module tff(input t,clk,rst,output reg q);
  always @(posedge clk or posedge rst) begin
    if(rst)
      q<=1'b0;
    else if(t)
      q<=~q;
    else
      q<=q;
  end
endmodule
//async
module up_counter #(parameter n=4)(input clk,rst,mode,output [n-1:0]q);
  genvar i;
  generate
    for(i=0;i<n;i=i+1) begin:ripple
      if(i==0)
        tff t0(1'b1,clk,rst,q[i]);
      else begin
        wire s_clk;
        assign s_clk=mode?q[i-1]:~q[i-1];
      
        tff ti(1'b1,s_clk,rst,q[i]);
      end
    end
  endgenerate
endmodule
//Testbench
module up_counter_tb;
  parameter n=4;
  reg clk,rst,mode;
  wire [n-1:0]q;
  up_counter #(n)dut(.*);
  initial begin
    $dumpfile("up_counter.vc");
    $dumpvars(0,up_counter_tb);
    $monitor("time=%0t clk=%b rst=%b m=%b q=%b",$time,clk,rst,mode,q);
  end
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=1;
    mode=1;#10;
    rst=0;#150;
    rst=1;
    mode=0;#10;
    rst=0;#150;
    $finish;
  end
endmodule
    
