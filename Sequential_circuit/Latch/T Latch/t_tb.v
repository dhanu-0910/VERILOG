module tlatch_tb;
reg t,clk;
wire q;
tlatch dut(.*);
initial begin
    $dumpfile("out_tlatch.vcd");
    $dumpvars(0,tlatch_tb);
    $monitor("time=%0t clk=%b | t=%b | q=%b ",$time,clk,t,q);
end
initial begin
    clk=1;
    t=0;#10;
    t=1;#10;
    t=0;#10;
    t=1;#10;

    $finish;
end
endmodule
