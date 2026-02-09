module comparator_tb;
parameter n=4;
reg [n-1:0]a;
reg [n-1:0]b;
wire agb,alb,aeb;
comparator #(n) dut(.*);
initial begin
    $dumpfile("out_comparator.vcd");
    $dumpvars(0,comparator_tb);
    $monitor("a=%b b=%b | agb=%b alb=%b aeb=%b",a,b,agb,alb,aeb);
end
initial begin
    a=4'b1000;b=4'b1010;#10;
    a=4'b1000;b=4'b1110;#10;
    a=4'b0000;b=4'b0010;#10;
    a=4'b1111;b=4'b1111;#10;
    a=4'b0100;b=4'b1010;#10;
    a=4'b0000;b=4'b0000;#10;
    $finish;
end
endmodule
