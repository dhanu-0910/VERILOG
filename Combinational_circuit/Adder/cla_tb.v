module cla_tb;
parameter n=4;
reg [n-1:0]a;
reg [n-1:0]b;
reg cin;
wire [n-1:0]sum;
wire cout;
cla #(n)dut(.*);
initial begin
    $dumpfile("out_cla.vcd");
    $dumpvars(0,cla_tb);
    $monitor("a=%b b=%b cin=%b | sum=%b cout=%b",a,b,cin,sum,cout);
end
initial begin
    a=4'b1010;b=4'b1010;cin=0;#10;
    a=4'b1010;b=4'b0010;cin=0;#10;
end
endmodule
