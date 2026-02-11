module jklatch_tb;
reg j,k,clk;
wire q;
jklatch dut(.*);
initial begin
    $dumpfile("out_jklatch.vcd");
    $dumpvars(0,jklatch_tb);
    $monitor("time=%0t clk=%b | j=%b k=%b | q=%b ",$time,clk,j,k,q);
end
initial begin
    clk=1;
    j=0;k=0;#10;
    j=0;k=1;#10;
    j=0;k=0;#10;
    j=1;k=0;#10;
    j=1;k=1;#10;
    $finish;
end
endmodule
