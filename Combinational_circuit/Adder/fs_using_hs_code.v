module half_sub(input a,b,output d,bout);
assign d=a^b;
assign bout=(~a)&b;
endmodule
module full_sub(input a,b,c,output d,bout);
wire d1,b1,b2;
half_sub h0(.a(a),.b(b),.d(d1),.bout(b1));
half_sub h1(.a(d1),.b(c),.d(d),.bout(b2));
assign bout=b1|b2;
endmodule
