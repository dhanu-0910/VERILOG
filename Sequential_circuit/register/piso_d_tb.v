module piso #(parameter n=4)(input clk,rst,load,input [n-1:0]pi,output reg so);
reg [n-1:0]q;
always @(posedge clk) begin
  if(rst)begin
    q<={n{1'b0}};
    so<=1'b0;
  end
  else if(load)begin
    q<=pi;
  end
  else begin
    so<=q[n-1];
    q<=q<<1;
  end
end
endmodule

//Testbench
module piso_tb;
parameter n=4;
reg clk,rst,load;
reg [n-1:0]pi;
wire so;
piso #(n)dut(.*);
initial begin
  $dumpfile("out_piso.vcd");
  $dumpvars(0,piso_tb);
end
initial begin
  $monitor("t=%0t|pi=%b clk=%b rst=%b|so=%b",$time,pi,clk,rst,so);
  clk = 0;
  rst = 1;
  load = 0;
  pi = 4'b0000;#10 
  rst = 0;#5  
  load = 1;
  pi = 4'b1100;#10 
  load = 0;#50 
  $finish;
end
always #5 clk=~clk;
  
endmodule
