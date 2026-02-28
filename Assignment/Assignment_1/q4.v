module mux4to1(input d0,d1,d2,d3,input s0,s1,output reg y);
  always @(*) begin
    case({s1,s0})
      2'b00:y=d0;
      2'b01:y=d1;
      2'b10:y=d2;
      2'b11:y=d3;
    endcase
  end
endmodule

module mux8to1(input d0,d1,d2,d3,d4,d5,d6,d7,input s0,s1,s2,output y);
  wire y0,y1;
  mux4to1 m1(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.s0(s0),.s1(s1),.y(y0));
  mux4to1 m2(.d0(d4),.d1(d5),.d2(d6),.d3(d7),.s0(s0),.s1(s1),.y(y1));
  mux4to1 m3(.d0(y0),.d1(y1),.d2(1'b0),.d3(1'b0),.s0(s2),.s1(1'b0),.y(y));
endmodule
//Testbench
module mux8to1_tb;
reg d0,d1,d2,d3,d4,d5,d6,d7;
reg s0,s1,s2;
wire y;
mux8to1 dut(.*);
initial begin 
    $dumpfile("out_mux8to1.vcd");
    $dumpvars(0,mux8to1_tb);
  $monitor("time=%0t | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b  | s2=%b s1=%b s0=%b y=%b",$time,d0,d1,d2,d3,d4,d5,d6,d7,s2,s1,s0,y);
end
initial begin
  d0=0;d1=1;d2=0;d3=1;d4=0;d5=1;d6=0;d7=1;
  s2=0;s1=0;s0=0;#10;
  s2=0;s1=0;s0=1;#10;
  s2=0;s1=1;s0=0;#10;
  s2=0;s1=1;s0=1;#10;
  s2=1;s1=0;s0=0;#10;
  s2=1;s1=0;s0=1;#10;
  s2=1;s1=1;s0=0;#10;
  s2=1;s1=1;s0=1;#10;
  $finish;
end
endmodule
