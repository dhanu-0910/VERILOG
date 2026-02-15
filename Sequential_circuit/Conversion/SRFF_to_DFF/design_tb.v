//SRFF
module srff(input s,r,clk,output reg q);
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
//DFF
module dff(input d,clk,output reg q);
  wire s,r;
  assign s=d;
  assign r=~d;
  srff dut(.s(s),.r(r),.clk(clk),.q(q));
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
  $finish;
  end
endmodule
    
      
    
