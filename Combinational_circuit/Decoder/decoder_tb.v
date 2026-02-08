module decoder_tb;
reg [2:0]d;
wire [7:0]y;
decoder dut(.*);
initial begin
    $dumpfile("out_decoder.vcd");
    $dumpvars(0,decoder_tb);
    $monitor("d=%b y=%b",d,y);
end
initial begin
    d = 3'b000; #10;
    d = 3'b001; #10;
    d = 3'b010; #10;
    d = 3'b011; #10;
    d = 3'b100; #10;
    d = 3'b101; #10;
    d = 3'b110; #10;
    d = 3'b111; #10;
end
endmodule
