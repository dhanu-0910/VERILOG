module pipo #(parameter n=4)(input clk,rst,input [n-1:0]pi,output reg [n-1:0]po);
always @(posedge clk) begin
  if(rst)begin
    po<={n{1'b0}};
  end
  else begin
    po <= pi;
  end
end
endmodule

//Testbench
module pipo_tb;
parameter n=4;
reg clk,rst;
reg [n-1:0]pi;
wire [n-1:0]po;
pipo #(n)dut(.*);
initial begin
  $dumpfile("out_pipo.vcd");
  $dumpvars(0,pipo_tb);
end
initial begin
  $monitor("t=%0t|pi=%b clk=%b rst=%b|po=%b",$time,pi,clk,rst,po);
  clk=1;
  rst=1;pi=4'b1100;#10;
  rst=0;
  pi=4'b1100;#10;
  pi=4'b0011;#10;
  $finish;
end
always #5 clk=~clk;
  
endmodule
