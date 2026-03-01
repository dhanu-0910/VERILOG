module full_adder(input a,b,cin,output sum,cout);
  wire s1,c1,c2;
  xor (s1,a,b);      
  xor (sum,s1,cin);  
  and (c1,a,b);      
  and (c2,s1,cin);
  or  (cout,c1,c2);
endmodule

module rca_4bit(input [3:0]a,input [3:0]b,input cin,output [3:0]sum,output cout);
  wire c1, c2, c3;   
  full_adder fa0 (a[0],b[0],cin,sum[0],c1);
  full_adder fa1 (a[1],b[1],c1,sum[1],c2);
  full_adder fa2 (a[2],b[2],c2,sum[2],c3);
  full_adder fa3 (a[3],b[3],c3,sum[3],cout);
endmodule
//Testbench
module rca_4bit_tb;
  reg  [3:0] a, b;
  reg  cin;
  wire [3:0] sum;
  wire cout;
  rca_4bit dut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  initial begin
    $dumpfile("rca_4bit.vcd");
    $dumpvars(0, rca_4bit_tb);
    $monitor("time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b",$time, a, b, cin, sum, cout);
  end
  initial begin
    a = 4'b0000; b = 4'b0000; cin = 0; #10;
	a = 4'b0011; b = 4'b0101; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    a = 4'b1001; b = 4'b0110; cin = 1; #10;
    $finish;
  end
endmodule
