module fsm_mod_n #(parameter n=4)(input clk,rst,output reg [n-1:0]y);
  reg [n-1:0]s;
  always @(posedge clk or posedge rst) begin
    if(rst)
      s<=0;
    else if(s==n-1)
      s<=0;
    else
      s<=s+1;
  end
  always @(*) begin
    y<=s;
  end
endmodule
//Testbench
module fsm_mod_n_tb;
  parameter n=4;
  reg clk,rst;
  wire [n-1:0]y;
  fsm_mod_n #(n) dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("time=%0t clk=%b rst=%b y=%b",$time,clk,rst,y);
    clk=0;rst=1;#10
    rst=0;#60;$finish;
  end
endmodule
