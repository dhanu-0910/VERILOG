module mod_counter #(parameter n=4)(input clk,rst,output reg [n-1:0]q);
  always @(posedge clk) begin
    if(rst)
      q<=0;
    else begin
      if(q>=n-1)
      	q<=0;
      else
      	q=q+1'b1;
    end
  end
endmodule
//Testbench
module mod_counter_tb;
parameter n=4;
reg clk,rst;
wire [n-1:0]q;
mod_counter #(n) dut(.*);
initial begin
$dumpfile("out_mod_counter.vcd");
  $dumpvars(1,mod_counter_tb);
  $monitor("time=%0t clk=%b rst=%b q=%d",$time,clk,rst,q);
end
always #5 clk=~clk;
initial begin
        clk=1;
rst=1;#10;
rst=0;#200;
$finish;
end
endmodule
