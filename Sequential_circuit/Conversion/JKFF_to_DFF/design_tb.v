//JKFF
module jkff(input j,k,clk,output reg q);
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
module dff(input d,clk,output q);
  wire j,k;
  assign j=d;
  assign k=~d;
  jkff dut(.j(j),.k(k),.clk(clk),.q(q));
endmodule
//Testbench
module dff_tb;
  reg d,clk;
  wire q;
  dff dut(.*);
  initial begin
    $dumpfile("out_dff.vcd");
    $dumpvars(0,dff_tb);
    $monitor("time=%0t  | clk=%b | d=%b | q=%b",$time,clk,d,q);
  end
  always #5 clk=~clk;
  initial begin
    clk = 0;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 1; #10;
  $finish;
  end
endmodule
