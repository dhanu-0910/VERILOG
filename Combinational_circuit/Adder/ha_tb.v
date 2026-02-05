module half_adder_tb;
reg a,b;
wire s,c;
half_adder DUT(.a(a),.b(b),.s(s),.c(c));
initial begin
a=0;b=0; #10;
a=0;b=1; #10;
a=1;b=0; #10;
a=1;b=1; #10;
$finish;
end
initial begin
        $dumpfile("out_half_adder.vcd");
        $dumpvars(0,half_adder_tb);
$monitor("a=%b b=%b | s=%b c=%b", a,b,s,c);
end
endmodule
