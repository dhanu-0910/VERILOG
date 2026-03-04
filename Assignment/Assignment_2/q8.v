module tb;
reg[13*8:1]s;
initial
begin
s = "hello world";
$display("Value of s= %s",s[104:65]);
end
endmodule
//Output
Value of s= hel
