module add_sub #(parameter n=1)(input [n-1:0]a,input [n-1:0]b,input m,output [n-1:0]s,output cout);
wire [n-1:0]b_mod;
wire [n:0]result;
assign b_mod=b ^ {n{m}};
assign result=a+b_mod+m;
assign s=result[n-1:0];
assign cout=result[n];
endmodule
