//DFF
module dff(input d,clk,output reg q);
  initial q=0;
  always@(posedge clk) begin
    q<=d;
  end
endmodule
//JKFF
module jkff(input j, k, clk, output q);
  wire d;
  wire q_int;
  assign d = (j&~q_int)|(~k&q_int);
  dff dut(.d(d), .clk(clk), .q(q_int));
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
    j = 1;k = 1; #10;
    j = 0;k = 1; #10;
    j = 1;k = 0; #10;
    j = 0;k = 0; #10;
    j = 1;k = 1; #10;
    
  $finish;
  end
endmodule
