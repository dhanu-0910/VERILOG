module demux_2to1_tb;
reg a,s;
wire y0,y1;
demux_2to1 DUT(.a(a),.s(s),.y0(y0),.y1(y1));
initial begin
$dumpfile("out_demux_2to1.vcd");
$dumpvars(0,demux_2to1_tb);
$monitor("time=%0t | a=%b | s=%b | y0=%b y1=%b",$time,a,s,y0,y1);
end
initial begin
s=0;a=0;#10;
s=0;a=1;#10;
s=1;a=0;#10;
s=1;a=1;#10;
end
endmodule
