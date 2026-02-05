module full_sub_tb;
reg a,b,c;
wire d,bout;
full_sub DUT(.a(a),.b(b),.c(c),.d(d),.bout(bout));
initial begin
$dumpfile("out_full_sub.vcd");
$dumpvars(0,full_sub_tb);
$monitor("time=%0t | a=%b b=%b c=%b | d=%b bout=%b",$time,a,b,c,d,bout);
end
initial begin
a=0;b=0;c=0;#10;
a=0;b=0;c=1;#10;
a=0;b=1;c=0;#10;
a=0;b=1;c=1;#10;
a=1;b=0;c=0;#10;
a=1;b=0;c=1;#10;
a=1;b=1;c=0;#10;
a=1;b=1;c=1;#10;
end
endmodule
