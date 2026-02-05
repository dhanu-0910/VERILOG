module full_adder_tb;
reg a,b,c;
wire s,cout;
full_adder DUT(.a(a),.b(b),.c(c),.s(s),.cout(cout));
initial begin
$dumpfile("out_full_adder.vcd");
$dumpvars(0,full_adder_tb);
$monitor("time=%0t  | a=%b b=%b c=%b | s=%b cout=%b",$time,a,b,c,s,cout);
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
$finish;
end
endmodule
