/*Write a Verilog module that blinks an LED at 1 Hz using a 50 MHz clock. The LED must
toggle every 0.5 seconds. Inputs are clk and rst, output is led.*/
module led(input clk,input rst,output reg led_clk);
  reg [24:0]count;
  always @(posedge clk) begin
    if(rst) begin
      led_clk<=0;
      count<=0;
    end
    else begin
      if(count==25000000-1)begin
        count<=0;
        led_clk<=~led_clk;
      end
      else
        count<=count+1;
    end
  end
endmodule
//Tb
module led_tb; 
  reg clk;
  reg rst;
  wire led_clk;
  led dut (.clk(clk),.rst(rst),.led_clk(led_clk));
  always #10 clk = ~clk;
  initial begin
    $dumpfile("led.vcd");
    $dumpvars(0,led_tb);
    $monitor("Time=%0t | rst=%b | led_clk=%b", $time, rst, led_clk);
   end
  initial begin
    clk = 0;
    rst = 1;
    #50;
    rst = 0;
    #1000;
    $finish;
   end
endmodule
