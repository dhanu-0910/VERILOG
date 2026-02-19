module mux(input [7:0]d,input [3:0]s,output reg y);
  always @(*) begin
    for(int i=0;i<8;i=i+1) begin
      if(i==s)
        y=d[i];
    end
  end
endmodule
//Testbench
module mux_tb;
  reg [7:0]d;
  reg [3:0]s;
  wire y;
  mux dut(.*);
  initial begin
    $dumpfile("out_mux.vcd");
    $dumpvars(0,mux_tb);
  end
  initial begin
    $monitor("s=%b d=%b y=%b",s,d,y);
    d=8'b001001;#10;
     s=3'b000;#10;
     s=3'b001;#10;
     s=3'b010;#10;
     s=3'b011;#10;
     s=3'b100;#10;
     s=3'b101;#10;
     s=3'b110;#10;
     s=3'b111;#10;
    $finish;
  end
endmodule
  
