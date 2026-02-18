module tables(input [9:0]a,input clk,rst,output reg [9:0]b);
  reg [3:0]i;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      i<=1;
      b<=0;
    end
    else begin
      b<=a*i;
      i<=i+1;
    end
  end
 endmodule
//Testbench
module tables_tb;
reg clk,rst;
reg [9:0]a;
wire [9:0]b;
tables dut(.*);
initial begin
  $dumpfile("out_tables.vcd");
  $dumpvars(0,tables_tb);
  $monitor("time=%0t a=%d b=%d",$time,a,b);
end
always #5 clk=~clk;
initial begin
    clk=1;
	rst=1;#10;
	rst=0;a=2;#100;
	$finish;
end
endmodule
