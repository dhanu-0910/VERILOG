module tb;
reg [2:0] a, b;
reg y;
initial begin
a= 3'd5;
b= 3'b111;
y = a&&b;
$monitor("y=%b",y);
end
endmodule
//Output
y=1
