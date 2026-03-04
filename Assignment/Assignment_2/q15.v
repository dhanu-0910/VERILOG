module tb;
reg [3:0]a= 4'b110x;
initial begin
if (a!==4'b1100)begin 
  $monitor("B1");
end
else begin 
  $monitor("B2");
end
end
endmodule
//output
B1
