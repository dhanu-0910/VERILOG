module dff_tb;
reg d,clk,rst;
wire q;
dff dut(.*);
initial begin
    $dumpfile("out_dff.vcd");
    $dumpvars(0,dff_tb);
    $monitor("time=%0t clk=%b rst=%b | d=%b | q=%b ",$time,clk,rst,d,q);
end
initial begin
    clk=1;
    forever #5 clk=~clk;
end
initial begin
    rst=1;
    d=0;#10;
    d=1;#10;
    rst=0;
    d=1;#10;
    d=0;#10;
    $finish;
end
endmodule
    
