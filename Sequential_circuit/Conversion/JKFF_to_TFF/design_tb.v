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
//DFF
module tff(input t,clk,output q);
  wire j,k;
  assign j=t;
  assign k=t;
  jkff dut(.j(j),.k(k),.clk(clk),.q(q));
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
    t = 1; #10;
  $finish;
  end
endmodule
