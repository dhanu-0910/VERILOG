module tff_tb;
reg t,clk,rst;
wire q;
tff dut(.*);
initial begin
    $dumpfile("out_tff.vcd");
    $dumpvars(0,tff_tb);
    $monitor("time=%0t clk=%b rst=%b | t=%b | q=%b ",$time,clk,rst,t,q);
end
initial begin
    clk=1;
    forever #5 clk=~clk;
end
initial begin
    rst=1;
    t=0;#10;
    t=1;#10;
    rst=0;
    t=1;#10;
    t=0;#10;
    rst=1;
    t=1;#10;
    rst=1;
    t=1;#5;
    rst=0;#10
    t=0;#10;
    t=1;#10;
    $finish;
end
endmodule
    
