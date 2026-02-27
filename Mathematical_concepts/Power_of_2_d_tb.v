module power_of_2 (input [7:0]n,output reg y);
  always @(*) begin
    if (n != 0 && (n & (n - 1)) == 0)
      y = 1; 
    else
      y = 0;   
  end
endmodule
//Testbench
module power_of_2_tb;
  reg [7:0]n;
  wire y;
  power_of_2 dut(.*);
  initial begin
    $monitor("time=%0t n=%b y=%d",$time,n,y);
    n=8'b01000000;#10;
    n=8'b11111111;#10;
    n=8'b00000000;#10;
    n=8'b00001000;#10;
    n=8'b10000000;#10;
    $finish;
  end
endmodule
