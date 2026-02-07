module d_to_bcd_encoder_tb;
reg d0,d1,d2,d3,d4,d5,d6,d7,d8,d9;
wire b0,b1,b2,b3;
d_to_bcd_encoder dut(.*);
initial begin
    $dumpfile("out_d_to_bcd_encoder");
    $dumpvars(0,d_to_bcd_encoder_tb);
    $monitor("BCD=%b%b%b%b",b3,b2,b1,b0);
end
initial begin
    d0=0;d1=0;d2=0;d3=0;d4=0;d5=0;d6=0;d7=0;d8=0;d9=0;
    d0=1;#10;d0=0;
    d1=1;#10;d1=0;
    d2=1;#10;d2=0;
    d3=1;#10;d3=0;
    d4=1;#10;d4=0;
    d5=1;#10;d5=0;
    d6=1;#10;d6=0;
    d7=1;#10;d7=0;
    d8=1;#10;d8=0;
    d9=1;#10;
    $finish;
end
endmodule
