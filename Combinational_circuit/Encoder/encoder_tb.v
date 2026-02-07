module encoder_tb;
reg [7:0]d;
wire [3:0]y;
encoder dut(.*);
initial begin
    $dumpfile("out_encoder.vcd");
    $dumpvars(0,encoder_tb);
    $monitor("d=%b | y=%b", d, y);
end
initial begin
    d = 8'b00000001; #10;
    d = 8'b00000010; #10;
    d = 8'b00000100; #10;
    d = 8'b00001000; #10;
    d = 8'b00010000; #10;
    d = 8'b00100000; #10;
    d = 8'b01000000; #10;
    d = 8'b10000000; #10;
    $finish;
end
endmodule
