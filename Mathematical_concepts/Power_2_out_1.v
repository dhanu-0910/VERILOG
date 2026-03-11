module inte #(parameter n=4)(input [n-1:0]m,output reg r);
 real  temp, i;
   
  always @(*) begin
     temp = m;
    for(i=temp;temp>2;i--) begin
   temp=temp/2;
   
   
  end
    if(temp==2)
    r=1;
  else 
    r=0;
  
  end
endmodule
//Testbench
module tb;
  parameter n=4;
  reg [n-1:0]m;
  wire r;
  inte #(n)dut(.*);
  initial begin
    m=4'b0100;
    $monitor("a=%b r=%b",m,r);
  end
endmodule
