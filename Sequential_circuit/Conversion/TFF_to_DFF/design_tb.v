//TFF
module tff(input t,clk,output reg q);
  initial q=0;
  always@(posedge clk) begin
    if(t)
      q<=~q;
    else
      q<=q;
  end
endmodule
//SRFF
module dff(input d, clk, output q);
  wire t;
  wire q_int;
  assign t = d^q_int;
  tff dut(.t(t), .clk(clk), .q(q_int));
  assign q=q_int;
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
    d = 0;#10;
    d = 1;#10;
    d = 0;#10;
    d = 1;#10;
    d = 0;#10;
    d = 1;#10;
    
  $finish;
  end
endmodule
