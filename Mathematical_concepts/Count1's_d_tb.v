module count1(input [7:0]a,output reg[3:0]y);
  integer i;
  always @(*) begin
    y = 0;
    for (i = 0; i < 8; i = i + 1)
      y = y + a[i];
  end
endmodule
//Testbench
module count1_tb;
  reg [7:0]a;
  wire [3:0]y;
  count1 dut(.*);
  initial begin
    $monitor("time=%0t a=%b y=%d",$time,a,y);
    a=8'b01010101;#10;
    a=8'b11111111;#10;
    a=8'b00000000;#10;
    $finish;
  end
endmodule
