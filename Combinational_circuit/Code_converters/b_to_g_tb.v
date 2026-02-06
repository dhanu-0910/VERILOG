module b_to_g_tb;
parameter N = 6;
reg  [N-1:0] b;
wire [N-1:0] g;
b_to_g #(N) dut (.b(b), .g(g));
initial begin
    $dumpfile("out_b_to_g.vcd");
    $dumpvars(0,b_to_g_tb);
end
initial begin
    $monitor("b=%b -> g=%b", b, g);
    b = 0;   #10;
    b = 1;   #10;
    b = 3;   #10;
    b = 7;   #10;
    b = 15;  #10;
    b = 32;  #10;
    $finish;
end
endmodule
