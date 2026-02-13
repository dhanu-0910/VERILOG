module siso (input clk,rst,input si,output reg so);
reg [3:0] q;
always @(posedge clk) begin
  if(rst)begin
    q<=4'b0000;
    so<=1'b0;
  end
  else begin
    q <= {si,q[3:1]};
    so <= q[0];
  end
end
endmodule

// Code your testbench here
// or browse Examples
module siso_tb;
  reg clk,si,rst;
  wire so;
  siso dut(.*);
  initial begin
    $monitor("t=%0t|si=%b clk=%b rst=%b|so=%b",$time,si,clk,rst,so);
    clk=0;
    rst=1;
    si=1'b0;#10;
    rst=0;
    si=1'b1;#10;
    si=1'b0;#10;
    si=1'b0;#10;
    si=1'b1;#10;
  end
  always #5 clk=~clk;
  initial begin
    $dumpfile("out_siso.vcd");
    $dumpvars(0,siso_tb);
    #100 $finish;
  end
endmodule
