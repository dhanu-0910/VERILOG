module ha(input a,b,output s,cout);
  assign s=a^b;
  assign cout=a&b;
endmodule

module fa(input a,b,cin,output sum,cout);
  wire s0,c,c1;
  ha f1(a,b,s0,c);
  ha f2(s0,cin,sum,c1);
  assign cout=c|c1;
endmodule
  //Testbench                          
  module fa_tb;
reg a,b,cin;
wire sum,cout;
  fa DUT(.*);
initial begin
  $dumpfile("out_fa.vcd");
  $dumpvars(0,fa_tb);
  $monitor("time=%0t  | a=%b b=%b cin=%b | sum=%b cout=%b",$time,a,b,cin,sum,cout);
end
initial begin
a=0;b=0;cin=0;#10;
a=0;b=0;cin=1;#10;
a=0;b=1;cin=0;#10;
a=0;b=1;cin=1;#10;
a=1;b=0;cin=0;#10;
a=1;b=0;cin=1;#10;
a=1;b=1;cin=0;#10;
a=1;b=1;cin=1;#10;
$finish;
end
endmodule
