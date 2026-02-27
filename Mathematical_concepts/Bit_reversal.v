module reverse_bits #(parameter N=8)(input  [N-1:0]d,output reg [N-1:0] q);
integer i;
always @(*) begin
    for (i=0;i<N;i=i+1)
      q[i] = d[N-1-i];
end
endmodule
//Testbench
module reverse_bits_tb;
  parameter N=8;
  reg [N-1:0]d;
  wire [N-1:0]q;
  reverse_bits #(N) dut(.*);
  initial begin
    $monitor("d=%b q=%b",d,q);
    d=8'b01010101;#10;
    d=8'b00001111;#10;
  end
endmodule
