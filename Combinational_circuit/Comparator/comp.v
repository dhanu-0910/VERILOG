module comparator #(parameter n=1)(input [n-1:0]a,input [n-1:0]b,output agb,alb,aeb);
assign agb=(a>b);
assign alb=(a<b);
assign aeb=(a==b);
endmodule
