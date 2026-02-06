module bcd_to_excess_tb;
parameter n=3;
reg [4*n-1:0]bcd;
wire [4*n-1:0]excess;
bcd_to_excess #(n) dut(.bcd(bcd),.excess(excess));
initial begin
    $dumpfile("out_bcd_to_excess.vcd");
    $dumpvars(0,bcd_to_excess_tb);
end
initial begin
    $monitor("bcd=%b excess=%b",bcd,excess);
    bcd=12'b001101100011;#10;
    bcd=12'b100100001001;#10;
    $finish;
end
endmodule
