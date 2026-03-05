module test;
 int b;
initial
begin
b= -'d12/3;
  $display("b=%b",b);
end
  
endmodule
//output
b=01010101010101010101010101010001
