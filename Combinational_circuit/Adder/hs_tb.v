module half_sub_tb;
reg a,b;
wire d,bout;
half_sub DUT(.a(a),.b(b),.d(d),.bout(bout));
initial begin
$dumpfile("out_half_sub.vcd");
$dumpvars(0,half_sub_tb);
$monitor("time=%0t| a=%b b=%b | d=%b bout=%b",$time,a,b,d,bout);
end
initial begin
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
end
endmodule
