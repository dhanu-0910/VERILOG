module fa(input a,b,cin,output s,cout);
  wire p,d0,d1;
  xor(p,a,b);
  xor(s,p,cin);
  and(d0,a,b);
  and(d1,p,cin);
  or(cout,d0,d1);
endmodule
//ALU
module alu(input [3:0]a,b,input [1:0]s,output [7:0]y);
  wire [3:0]and_gate;
  wire [3:0]or_gate;
  wire [3:0]sum;
  wire [3:0]sub;
  wire c1,c2,c3;
  wire b1,b2,b3;
  wire cout,bout;
  
  and a0(and_gate[0],a[0],b[0]);
  and a1(and_gate[1],a[1],b[1]);
  and a2(and_gate[2],a[2],b[2]);
  and a3(and_gate[3],a[3],b[3]);
  
  or o0(or_gate[0],a[0],b[0]);
  or o1(or_gate[1],a[1],b[1]);
  or o2(or_gate[2],a[2],b[2]);
  or o3(or_gate[3],a[3],b[3]);
  
  fa f1(a[0],b[0],1'b0,sum[0],c1);
  fa f2(a[1],b[1],c1,sum[1],c2);
  fa f3(a[2],b[2],c2,sum[2],c3);
  fa f4(a[3],b[3],c3,sum[3],cout);
  
  fa fs1(a[0],~b[0],1'b1,sub[0],b1);
  fa fs2(a[1],~b[1],b1,sub[1],b2);
  fa fs3(a[2],~b[2],b2,sub[2],b3);
  fa fs4(a[3],~b[3],b3,sub[3],bout);
  
  assign y=(s==2'b00)?and_gate:(s==2'b01)?or_gate:(s==2'b10)?{3'b000,cout,sum}:(s==2'b11)?{{4{sub[3]}},sub}:8'b0;
endmodule
//Testbench  
module alu_tb;
  reg [3:0]a,b;
  reg [1:0]s;
  wire [7:0]y;
  alu dut(.*);
  initial begin
    $dumpfile("out_alu.vcd");
    $dumpvars(0,alu_tb);
    $monitor("time=%0t a=%b b=%b y=%b",$time,a,b,y);
  end
  initial begin
    a=4'b1110;b=4'b1010;
    s=2'b00;#10;
    s=2'b01;#10;
    s=2'b10;#10;
    s=2'b11;#10;
    $finish;
  end
endmodule
