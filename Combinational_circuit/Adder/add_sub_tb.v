module add_sub_tb;
parameter n=4;
reg [n-1:0]a;
reg [n-1:0]b;
reg m;
wire [n-1:0]s;
wire cout;
add_sub #(n) dut(.*);
initial begin
    $dumpfile("out_add_sub.vcd");
    $dumpvars(0,add_sub_tb);
    $monitor("a=%b b=%b m=%b | s=%b cout=%b",a,b,m,s,cout);
end
initial begin
    a=4'b1010;b=4'b1011;m=0;#10;
    a=4'b1010;b=4'b1011;m=1;#10;
    $finish;
end
endmodule
