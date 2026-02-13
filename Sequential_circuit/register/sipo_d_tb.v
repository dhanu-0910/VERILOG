module sipo (input clk,rst,input si,output reg [3:0]po);
always @(posedge clk) begin
  if(rst)begin
    po<=4'b0000;
  end
  else begin
    po <= {si,po[3:1]};
  end
end
endmodule

//Testbench
module sipo_tb;
reg clk,si,rst;
wire [3:0]po;
sipo dut(.*);
initial begin
  $dumpfile("out_sipo.vcd");
  $dumpvars(0,sipo_tb);
end
initial begin
  $monitor("t=%0t|si=%b clk=%b rst=%b|po=%b",$time,si,clk,rst,po);
  clk=0;
  rst=1;
  si=1'b0;#20;
  rst=0;
  si=1'b1;#20;
  si=1'b0;#20;
  si=1'b0;#20;
  si=1'b1;#100;
  $finish;
end
always #10 clk=~clk;
  
endmodule
