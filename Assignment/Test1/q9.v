module moore(input clk,rst,x,output reg y);
  localparam s0=3'b000,
             s1=3'b001,
             s2=3'b010,
             s3=3'b011,
             s4=3'b100,
             s5=3'b101;
  reg [2:0]state,nxt_state;
  always @(posedge  clk or posedge rst) begin
    if(rst)
      state<=1'b0;
    else
      state<=nxt_state;
  end
  always @(*) begin
    case(state)
      s0:begin
        if(x)
          nxt_state<=s1;
        else
          nxt_state<=s0;
      end
      s1:begin
        if(x)
          nxt_state<=s1;
        else
          nxt_state<=s2;  
      end
      s2:begin
        if(x)
          nxt_state<=s3;
        else
          nxt_state<=s0;
      end
      s3:begin
        if(x)
          nxt_state<=s4;
        else
          nxt_state<=s2;
      end
      s4:begin
        if(x)
          nxt_state<=s1;
        else
          nxt_state<=s5;
      end
      s5:begin
        if(x)
          nxt_state<=s3;
        else
          nxt_state<=s0;
      end
      default:nxt_state<=s0;
    endcase
  end
  always @(posedge clk or posedge rst) begin
    if(state==s4 && ~x)
      y=1;
    else
      y=0;
  end
endmodule
//Testbench
module moore_tb;
  reg clk,rst,x;
  wire y;
  moore dut(.*);
  initial begin
    $dumpfile("out_moore.vcd");
    $dumpvars(0,moore_tb);
    $monitor("time=%0t x=%b clk=%b rst=%b y=%b",$time,x,clk,rst,y);
  end
  initial begin
    forever #5 clk=~clk;
  end
  initial begin
    clk=0;rst=1;x=1'b1;#10;
    rst=0;
    x=1'b1;#10;
    x=1'b0;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b0;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b0;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b0;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b0;#30;
       
    $finish;
  end
endmodule
