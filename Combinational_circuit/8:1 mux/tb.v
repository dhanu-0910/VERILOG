module mux_8to1_tb;
reg [7:0]d;
reg [2:0]s;
wire y;
mux_8to1 dut(.d(d),.s(s),.y(y));
initial begin 
    $dumpfile("out_mux_8to1.vcd");
    $dumpvars(0,mux_8to1_tb);
    $monitor("time=%0t | d=%b s=%b | y=%b ",$time,d,s,y);
end
initial begin
    d=8'b10100000;
    s=3'b000;#10;
    s=3'b001;#10;
    s=3'b010;#10;
    s=3'b011;#10;
    s=3'b100;#10;
    s=3'b101;#10;
    s=3'b110;#10;
    s=3'b111;#10;
    $finish;
end
endmodule
