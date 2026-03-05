module test(output [32:0]b);
real a=14.5;
assign b = a;
initial $display("b=%b",b);
endmodule
//output
b=000000000000000000000000000001111
