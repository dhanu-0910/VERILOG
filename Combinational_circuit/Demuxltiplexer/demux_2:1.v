module demux_2to1(input a,s, output y0,y1);
assign y0=a&~s;
assign y1=a&s;
endmodule
