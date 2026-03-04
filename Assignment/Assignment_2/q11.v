module tb;
reg [2:0]a;
reg [2:0]x;
initial begin
a = 3'd4;
x = ^a;
$monitor("x=%b",x);
end
endmodule
//output
x=001
