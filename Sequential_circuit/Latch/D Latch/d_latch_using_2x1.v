module mux(input d,en,output reg y);
  always @(*) begin
    if(en)
      y=d;
  end
endmodule
//Testbench
module mux_tb;
  reg d;
  reg en;
  wire y;
  mux dut(.*);
  initial begin
    $dumpfile("out_mux.vcd");
    $dumpvars(0,mux_tb);
  end
  initial begin
    $monitor("d=%b en=%b y=%b",en,d,y);
    d=0;#10;
    en=0;#10;
    en=1;#10;
    d=1;#10;
    en=0;d=0;#10;
    en=1;#10;
    $finish;
  end
endmodule
  
