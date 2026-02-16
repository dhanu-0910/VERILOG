module shift_register #(parameter n=4)(input [n-1:0]d,input clk,input rst,output reg [n-1:0]q);
  always@(posedge clk) begin
    if(rst)
      q<=0;
    else
      q<=d;
  end
endmodule
//Testbench
module shift_register_tb;
  parameter n=4;
  reg [n-1:0]d;
  reg clk,rst;
  wire [n-1:0]q;
  shift_register #(n)dut(.*);
  initial begin
    $dumpfile("out_shift_register.vcd");
    $dumpvars(0,shift_register_tb);
    $monitor("time=%0t | clk=%b | rst=%b | d=%b | q=%b",$time,clk,rst,d,q);
  end
  always #5 clk=~clk;
  initial begin
    clk=1;rst = 1; d = 0;
    #10 rst = 0; d = 4'b1010;
    #10 d = 4'b1100;
    #10 d = 4'b1111;
    #10 rst = 1;
    #10 rst = 0; d = 4'b0011;
    #20 $finish;
  end
  
endmodule
              
