module demux_1x8_tb;
reg in;
reg [2:0]sel;
wire y0,y1,y2,y3,y4,y5,y6,y7;
demux_1x8 dut (.in(in),.sel(sel),.y0(y0),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7));
initial begin
    $dumpfile("out_demux_1x8.vcd");
    $dumpvars(0,demux_1x8_tb);
end
initial begin
    $monitor("in=%b | sel=%b | y0=%b y1=%b y2=%b y3=%b y4=%b y5=%b y6=%b y7=%b",in,sel,y0,y1,y2,y3,y4,y5,y6,y7);
    in=0;
    sel=3'b000; #10;
    sel=3'b001; #10;
    sel=3'b010; #10;
    sel=3'b011; #10;
    sel=3'b100; #10;
    sel=3'b101; #10;
    sel=3'b110; #10;
    sel=3'b111; #10;
        
    in=1;
    sel=3'b000; #10;
    sel=3'b001; #10;
    sel=3'b010; #10;
    sel=3'b011; #10;
    sel=3'b100; #10;
    sel=3'b101; #10;
    sel=3'b110; #10;
    sel=3'b111; #10;
    $finish;
end
endmodule
