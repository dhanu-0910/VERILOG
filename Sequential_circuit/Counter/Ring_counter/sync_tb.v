module ring_counter #(parameter n=4)(input clk,rst,output reg[n-1:0]q);
  always @(posedge clk or posedge rst) begin
    if(rst)
      q<=4'b0001;
    else
      q<={q[n-2:0],q[n-1]};
  end
endmodule
//Testbench
module ring_counter_tb;
  parameter n=4;
  reg clk,rst;
  wire [n-1:0]q;
  ring_counter #(n) dut(.*);
  initial begin
    $dumpfile("out_ring_counter.vcd");
    $dumpvars(0,ring_counter_tb);
    $monitor("time=%0t clk=%b rst=%b q=%b",$time,clk,rst,q);
  end
  always #5 clk=~clk;
  initial begin
    clk=0;rst=1;#10;
    rst=0;#100;
    $finish;
  end
endmodule
