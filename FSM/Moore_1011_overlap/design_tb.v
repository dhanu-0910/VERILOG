module moore_1011(input clk,rst,x,output reg y);
  reg [2:0]s,ns;
  parameter s0=3'b000,
  			s1=3'b001,
  			s2=3'b010,
  			s3=3'b011,
  			s4=3'b100;
  always @(posedge clk or posedge rst) begin
    if(rst)
      s<=s0;
    else
      s<=ns;
  end
  always @(*)begin
    case(s)
      s0:begin
        if(x)
          ns=s1;
        else
          ns=s0;
      end
      s1:begin
        if(x)
          ns=s1;
        else
          ns=s2;
      end
      s2:begin
        if(x)
          ns=s3;
        else
          ns=s0;
      end
      s3:begin
        if(x) 
          ns=s4;
        else
          ns=s2;
      end
      s4:begin
        if(x)
          ns=s1;
        else
          ns=s2; 
      end
      default: ns=s0;
    endcase
  end
  always @(posedge clk or posedge rst) begin
    if(rst)
      y<=0;
    else
      y<=(s==s3 && x);
  end
endmodule

//Testbench
module moore_1011_tb;
  reg clk,rst,x;
  wire y;
  moore_1011 dut(.*);
  initial begin
    $dumpfile("out_moore_1011.vcd");
    $dumpvars(0,moore_1011_tb);
    $monitor("time=%0t | rst=%b | clk=%b | x=%b | y=%b",$time,rst,clk,x,y);
  end
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=1;#10;
    rst=0;
    x=1; #10;
    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=1; #10;   
    x=0; #10;
    x=1; #10;
    x=1; #10;   
	$finish;
  end
endmodule
