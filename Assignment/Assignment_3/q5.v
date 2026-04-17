module mul_div #(parameter n=4) (input x,input [n-1:0]a,b,output reg [2*n-1:0]out);
  integer i;
  always @(*)begin
    if(x)
      out=mul(a,b);
    else
      out=div(a,b);
  end
  
  function [2*n-1:0]mul;
    input [n-1:0]a,b;
    mul=a*b;
  endfunction
  
  function [2*n-1:0]div;
    input [n-1:0]a,b;
    div=a/b;
  endfunction
  
endmodule
//Tb
module mul_div_tb #(parameter n=8);
  reg x;
  reg [n-1:0]a,b;
  wire [2*n-1:0]out;
  integer i;
  mul_div #(8)dut(.*);
  initial begin
    $dumpfile("mul_div.vcd");
    $dumpvars(0,mul_div_tb);
  end
  initial begin
    $monitor("time=%0t x=%0d a=%0d b=%0d out=%0d",$time,x,a,b,out);
    x=1;a=10;b=20;#10;
    a=205;b=5;#10;
    a=23;b=3;#10;
    a=45;b=9;#10;
    
    x=0;a=10;b=20;#10;
    a=205;b=5;#10;
    a=23;b=3;#10;
    a=45;b=9;#10;
   
    #10;$finish;
  end
endmodule
      
