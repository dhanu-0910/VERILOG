module srlatch_tb;
reg s,r;
wire q,qbar;
srlatch dut(.*);
initial begin
    $dumpfile("out_srlatch.vcd");
    $dumpvars(0,srlatch_tb);
    $monitor("time=%0t | s=%b r=%b | q=%b qbar=%b",$time,s,r,q,qbar);
end
initial begin
    s=0;r=0;#10;
    s=0;r=1;#10;
    s=1;r=0;#10;
    s=1;r=1;#10;
    $finish;
end
endmodule
