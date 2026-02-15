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
module srff(input s, r, clk, output q);
  wire t;
  wire q_int;
  assign t = (s&~q_int)|(r&q_int);
  tff dut(.t(t), .clk(clk), .q(q_int));
  assign q=(s& r)?1'bx:q_int;
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
    s = 1;r = 1; #10;
    s = 0;r = 1; #10;
    s = 1;r = 0; #10;
    s = 0;r = 0; #10;
    s = 1;r = 1; #10;
    
  $finish;
  end
endmodule
