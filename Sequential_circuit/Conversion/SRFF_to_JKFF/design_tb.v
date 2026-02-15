//SRFF
module srff(input s,r,clk,output reg q);
  initial q=0;
  always@(posedge clk) begin
    if(s==0 && r==0)
      q<=q;
    else if(s==0 && r==1)
      q<=0;
    else if(s==1 && r==0)
      q<=1;
    else if(s==1 && r==1)
      q<=1'bx;
  end
endmodule
//JKFF
module jkff(input j,k,clk,output q);
  wire s,r;
  wire q_int;
  assign s=(~q_int & j);
  assign r= (q_int & k);
  srff dut(.s(s),.r(r),.clk(clk),.q(q_int));
  assign q=q_int;
endmodule
//Testbench
module jkff_tb;
  reg j,k,clk;
  wire q;
  jkff dut(.*);
  initial begin
    $dumpfile("out_jkff.vcd");
    $dumpvars(0,jkff_tb);
    $monitor("time=%0t  | clk=%b | j=%b | k=%b | q=%b",$time,clk,j,k,q);
  end
  always #5 clk=~clk;
  initial begin
    clk = 0;
    j = 0;k = 0; #10;
    j = 1;k = 0; #10;
    j = 0;k = 1; #10;
    j = 1;k = 1; #10;
    j = 1;k = 1; #10;
  $finish;
  end
endmodule
    
      
    
