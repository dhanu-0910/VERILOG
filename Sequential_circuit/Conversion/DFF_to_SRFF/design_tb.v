//DFF
module dff(input d,clk,output reg q);
  initial q=0;
  always@(posedge clk) begin
    q<=d;
  end
endmodule
//SRFF
module srff(input s, r, clk, output q);
  wire d;
  wire q_int;
  assign d=(s&~r)?1'b1:(~s&r)?1'b0:(s&r)?1'bx:q_int;
  dff dut(.d(d), .clk(clk), .q(q_int));
  assign q=q_int;
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
    s = 0;r=0; #10;
    s = 1;r=1; #10;
    s = 0;r=1; #10;
    s = 1;r=0; #10;
    s = 0;r=0; #10;
    s = 1;r=1; #10;
    
  $finish;
  end
endmodule
