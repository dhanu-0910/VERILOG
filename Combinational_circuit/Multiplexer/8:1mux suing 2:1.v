module mux_2to1(input [1:0]d,input s,output y);
assign y=s?d[1]:d[0];
endmodule

module mux_8to1(input [7:0]d,input [2:0]s,output y);
wire y0,y1,y2,y3,y4,y5;
mux_2to1 m0(d[1:0],s[0],y0);
mux_2to1 m1(d[3:2],s[0],y1);
mux_2to1 m2(d[5:4],s[0],y2);
mux_2to1 m3(d[7:6],s[0],y3);
mux_2to1 m4({y0,y1},s[1],y4);
mux_2to1 m5({y2,y3},s[1],y5);
mux_2to1 m6({y4,y5},s[2],y);
endmodule
