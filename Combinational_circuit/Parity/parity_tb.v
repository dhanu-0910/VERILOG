module parity_tb;
parameter n=4;
reg [n-1:0]d;
wire p_odd,p_even;
parity #(n) dut(.*);
initial begin
    $dumpfile("out_parity.vcd");
    $dumpvars(0,parity_tb);
    $monitor("d=%b p_odd=%b p_even=%b",d,p_odd,p_even);
end
initial begin
    d=4'b1010;#10;
    d=4'b1110;#10;
    d=4'b0001;#10;
    d=4'b0011;#10;
    $finish;
end
endmodule
