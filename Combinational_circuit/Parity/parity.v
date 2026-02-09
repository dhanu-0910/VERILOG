module parity #(parameter n=1)(input [n-1:0]d,output p_odd,p_even);
assign p_odd=^d;
assign p_even = ~(^d);
endmodule
