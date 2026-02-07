module ripple_adder_tb;
reg [3:0]a;
reg [3:0]b;
reg cin;
wire [3:0]sum;
wire cout;
ripple_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin
    $dumpfile("out_ripple_adder.vcd");
    $dumpvars(0,ripple_adder_tb);
end
initial begin
    $monitor("a=%b b=%b | sum=%b cout=%b",a,b,sum,cout);
    a=4'b1011;b=4'b1011;cin=0;#10;
    a=4'b0011;b=4'b0011;cin=1;
    $finish;
end
endmodule
