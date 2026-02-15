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
//JKFF
module jkff(input j, k, clk, output q);
  wire t;
  wire q_int;
  assign t = (j&~q_int)|(k&q_int);
  tff dut(.t(t), .clk(clk), .q(q_int));
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
