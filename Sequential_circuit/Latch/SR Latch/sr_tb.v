module srlatch_tb;
reg s,r,clk;
wire q;
srlatch dut(.*);
initial begin
    $dumpfile("out_srlatch.vcd");
    $dumpvars(0,srlatch_tb);
    $monitor("time=%0t clk=%b | s=%b r=%b | q=%b",$time,clk,s,r,q);
end
initial begin
    clk=1;
    s=0;r=1;#10;
    s=0;r=0;#10;
    s=0;r=1;#10;
    s=1;r=0;#10;
    s=1;r=1;#10;
    $finish;
end
endmodule
