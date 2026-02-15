//JKFF
module jkff(input j,k,clk,output reg q);
  initial q=0;
  always@(posedge clk) begin
    if(j==0 && k==0)
      q<=q;
    else if(j==0 && k==1)
      q<=0;
    else if(j==1 && k==0)
      q<=1;
    else if(j==1 && k==1)
      q<=~q;
  end
endmodule
//SRFF
module srff(input s,r,clk,output reg q);
  wire j,k;
  wire q_int;
  assign j=s;
  assign k= r;
  jkff dut(.j(j),.k(k),.clk(clk),.q(q_int));
  always @(*) begin
    if (s & r)
      q = 1'bx;  
    else
      q = q_int;
  end
endmodule
//Testbench
module srff_tb;
  reg s,r,clk;
  wire q;
  srff dut(.*);
  initial begin
    $dumpfile("out_srff.vcd");
    $dumpvars(0,srff_tb);
    $monitor("time=%0t  | clk=%b | s=%b | r=%b | q=%b",$time,clk,s,r,q);
  end
  always #5 clk=~clk;
  initial begin
    clk = 0;
    s = 0;r = 0; #10;
    s = 1;r = 0; #10;
    s = 0;r = 1; #10;
    s = 1;r = 1; #10;
    s = 1;r = 0; #10;
  $finish;
  end
endmodule
