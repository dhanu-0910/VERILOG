module half_adder(input a,b,output s,cout);
assign s=a^b;
assign cout=a&b;
endmodule
module full_adder(input a,b,c,output s,cout);
wire s1,c1,c2;
half_adder h0(.a(a),.b(b),.s(s1),.cout(c1));
half_adder h1(.a(s1),.b(c),.s(s),.cout(c2));
assign cout=c1|c2;
endmodule
