module tb;
reg [3:0]a;
reg [6:0]b;
initial begin
a=4'd10;
b={a,1'd1};
$monitor("b=%b",b);
end
endmodule
//output
x=0010101
