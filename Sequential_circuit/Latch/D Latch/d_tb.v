module dlatch_tb;
reg d,clk;
wire q;
dlatch dut(.*);
initial begin
    $dumpfile("out_dlatch.vcd");
    $dumpvars(0,dlatch_tb);
    $monitor("time=%0t clk=%b | d=%b | q=%b ",$time,clk,d,q);
end
initial begin
    clk=1;
    d=0;#10;
    d=1;#10;
    d=0;#10;
    d=1;#10;

    $finish;
end
endmodule
