module priority_encoder_tb;
reg [3:0]d;
wire [1:0]y;
wire valid;
priority_encoder dut(.*);
initial begin
    $dumpfile("out_priority_encoder.vcd");
    $dumpvars(0,priority_encoder_tb);
    $monitor("d=%b y=%b valid=%b",d,y,valid);
end
initial begin
    d=4'b0010;#10;
    d=4'b1100;#10;
    d=4'b0100;#10;
    d=4'b0010;#10;
    d=4'b0001;#10;
    d=4'b0101;#10;
    d=4'b0000;#10;
    $finish;
end
endmodule
