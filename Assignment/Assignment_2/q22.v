module tb;
reg [3:0] x;
initial begin
x = 4'b0011;
fork
#5 x = x + 1;
#10 x = x + 2;
$monitor("x=%b",x);
join
end
endmodule
//endmodule
x=0011
x=0100
x=0110
