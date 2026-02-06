module demux_1to4(input d,input [1:0]s, output reg y0,y1,y2,y3);
always @(*)begin
    y0=0;
    y1=0;
    y2=0;
    y3=0;
    if(s==2'b00)
        y0=d;
    else if(s==2'b01)
        y1=d;
    else if(s==2'b10)
        y2=d;
    else
        y3=d;
end
endmodule
