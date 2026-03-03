module full_adder(input a,b,cin,output sum,cout);
  assign sum=a^b^cin;
  assign cout=(a&b)|(b&cin)|(a&cin);
endmodule

module rca(input [3:0]a,input [3:0]b,input cin,output [3:0]sum,output cout);
  wire[4:0]c;
  assign c[0]=cin;
  genvar i;
  generate
    for(i=0;i<4;i=i+1)begin:fa
      full_adder fi(.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum[i]),.cout(c[i+1]));
    end
  endgenerate
  assign cout=c[4];
endmodule
//Testbench
module rca_tb;
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  rca dut(.*);
  initial begin
    $dumpfile("out_rca.vcd");
    $dumpvars(0,rca_tb);
    $monitor("a=%b b=%b c=%b sum=%b cout=%b",a,b,cin,sum,cout);
  end
  initial begin
    a=4'b0011;b=4'b1010;cin=0;#10;
    a=4'b1011;b=4'b1010;cin=1;#10;
    a=4'b1011;b=4'b1010;cin=0;#10;
    $finish;
  end
endmodule

