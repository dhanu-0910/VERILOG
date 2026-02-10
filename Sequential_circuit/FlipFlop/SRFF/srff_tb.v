module srff_tb; 
reg s,r,clk,rst; 
wire q; 
srff dut(.*); 
initial begin 
    $dumpfile("out_srff.vcd"); 
    $dumpvars(0,srff_tb); 
    $monitor("time=%0t clk=%b rst=%b s=%b r=%b | q=%b",$time,clk,rst,s,r,q); 
end 
initial begin 
    clk=1; 
    forever #5 clk=~clk; 
end 
initial begin 
    
   clk=0;rst=0;s=0;r=1;
        #15 rst=1; 
        #11 s=1;r=0;
        #15 s=0;r=0;
        #4 rst=0;s=0;r=1;
        #6 rst=1; 
        #15 s=1;r=1;
        #10 s=1;r=0;
        #20 rst=0;
        #20 $finish;
    $finish; 
end 
endmodule
