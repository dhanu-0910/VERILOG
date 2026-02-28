module alu_tb;
  reg [3:0]a,b;
  reg clk,rst;
  reg [3:0]sel;
  wire [7:0]y;
  alu dut(.*);
  integer i;
  initial begin
    $dumpfile("out_alu.vcd");
    $dumpvars(0,alu_tb);
    $monitor("time=%0t clk=%b rst=%b a=%b b=%b sel=%b y=%b",$time,clk,rst,a,b,sel,y);
  end
  always #5clk=~clk;
  initial begin 
    clk=0;rst=0;a=4'b0111;b=4'b1110;
    for(i=0;i<16;i++) begin
      #10;sel=i;
    end
    
    #10;$finish;
  end
endmodule
