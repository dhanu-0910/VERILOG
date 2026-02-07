module mux_2to1(input [1:0]d,input s,output y);
assign y=s?d[1]:d[0];
endmodule
module mux_4to1(input [3:0]d, input [1:0]s, output y);
wire y0,y1;
mux_2to1 m0(d[1:0],s[1],y0);
mux_2to1 m1(d[3:2],s[1],y1);
mux_2to1 m2({y1,y0},s[0],y);
endmodule
