//DFF
module dff(input d,clk,output reg q);
  initial q=0;
  always@(posedge clk) begin
    q<=d;
  end
endmodule
//TFF
module tff(input t,clk,output q);
  wire d;
  wire 
  assign d=t^q;
  dff dut(.d(d),.clk(clk),.q(q));
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
