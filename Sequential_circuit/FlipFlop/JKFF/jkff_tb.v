module jkff_tb;
reg j,k,clk,rst;
wire q;
jkff dut (.*);
initial begin
    $dumpfile("out_jk_ff.vcd");
    $dumpvars(1,jkff_tb);
    $monitor("time=%0t clk= %B rst=%B |J=%B K=%B |Q= %B",$time,clk,rst,j,k,q);
end 
initial begin
    clk=1;
    forever #5 clk=~clk;
end
initial begin
    clk=0;rst=1;j=0;k=1;
    #15 rst=0; 
    #11 j=1;k=0;
    #15 j=0;k=0;
    #4 rst=1;j=0;k=1;
    #6 rst=0; 
    #15 j=1;k=1;
    #10 j=0;k=1;
    #20 rst=1;
    #20 $finish;
end
endmodule  
