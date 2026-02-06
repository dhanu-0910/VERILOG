module g_to_b_tb;
parameter n = 6;
reg  [n-1:0] g;
wire [n-1:0] b;
g_to_b #(n) dut (.g(g), .b(b));
initial begin
    $dumpfile("out_g_to_b.vcd");
    $dumpvars(0,g_to_b_tb);
end
initial begin
    $monitor("g=%b -> b=%b", g, b);
    g = 0;   #10;
    g = 1;   #10;
    g = 3;   #10;
    g = 7;   #10;
    g = 15;  #10;
    g = 32;  #10;
    $finish;
end
endmodule
