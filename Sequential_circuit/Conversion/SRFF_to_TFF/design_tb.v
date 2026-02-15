//SRFF
module srff(input s,r,clk,output reg q);
  initial q = 0;
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
//TFF
module tff(input t,clk,output q);
  wire s,r;
  wire q_int;
  assign s=(~q_int & t);
  assign r= (q_int & t);
  srff dut(.s(s),.r(r),.clk(clk),.q(q_int));
  assign q=q_int;
endmodule
//Testbench
module tff_tb;
  reg t,clk;
  wire q;
  tff dut(.*);
  initial begin
    $dumpfile("out_tff.vcd");
    $dumpvars(0,tff_tb);
    $monitor("time=%0t  | clk=%b | t=%b | q=%b",$time,clk,t,q);
  end
  always #5 clk=~clk;
  initial begin
    clk = 0;
    t = 0; #10;
    t = 1; #10;
    t = 0; #10;
    t = 1; #10;
    t = 0; #10;
  $finish;
  end
endmodule
    
      
    
