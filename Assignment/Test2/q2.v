/*Implement a 4-bit shift register that shifts a pattern across 4 LEDs.
Requirements:
Input: clk, rst, shift_in
Output: led[3:0]
Shift every 0.5 seconds*/
module shift(input clk,input rst,input sin,output reg [3:0]led);
  parameter max_count=25000000;
  reg [24:0]count;
  wire tick;
  always @(posedge clk) begin
    if(rst) 
      count<=0;
    else if(count==max_count-1)
      count<=0;
    else
       count<=count+1;
  end
  assign tick=(count==max_count-1);
  always @(posedge clk)begin
    if(rst)
      led<=0;
    else if(tick)
      led<={led[2:0],sin};
  end      
endmodule
//Tb
module shift_tb; 
  reg clk;
  reg rst;
  reg sin;
  wire [3:0]led;
  shift #(.max_count(5)) dut (.clk(clk),.rst(rst),.sin(sin),.led(led));
  always #10 clk = ~clk;
  initial begin
    $dumpfile("shift.vcd");
    $dumpvars(0,shift_tb);
    $monitor("Time=%0t | clk=%0d | rst=%b | sin=%0d | led=%b", $time, clk, rst, sin, led);
   end
  initial begin
    clk = 0;
    rst = 1;
    sin=0;
    #30;
    rst = 0;
    #10 sin = 1;
    #20 sin = 0;
    #20 sin = 1;
    #20 sin = 1;
    #20 sin = 0;
    #1000;
    $finish;
   end
endmodule
      
