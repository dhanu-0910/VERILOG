module ram_tb;

reg [7:0] data;
reg [3:0] addr;
reg clk;
reg w_e;
wire [7:0] dout;

ram dut(data,addr,clk,w_e,dout);

always #5 clk = ~clk;

initial begin
clk = 1;
w_e = 1;

addr = 4'd0; data = 8'hAA; #10;
addr = 4'd1; data = 8'hBB; #10;
addr = 4'd2; data = 8'hCC; #10;

w_e = 0;

addr = 4'd0; #10;
addr = 4'd1; #10;
addr = 4'd2; #10;

#10 $finish;
end

initial begin
  $monitor("time=%0t clk=%b addr=%d data=%h dout=%h w_e=%b",$time,clk, addr, data, dout, w_e);
end

endmodule
