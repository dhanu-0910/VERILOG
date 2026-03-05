module tb;
reg [3:0]a= 4'b0100;
reg [3:0]b;
initial begin
b = a+1'bx;
$monitor("b=%b",b);
end
endmodule
//output
b=xxxx
