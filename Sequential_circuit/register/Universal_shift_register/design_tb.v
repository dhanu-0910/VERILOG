module universal_shift_register #(parameter n=4)(input [n-1:0]d,input clk,input [1:0]s,input rst,input si,output reg[n-1:0]q);
  always@(posedge clk) begin
    if(rst)
      q<=0;
    else begin
      case(s)
        2'b00: q<=q;
        2'b01: q<={si,q[n-1:1]};
        2'b10: q<={q[n-2:0],si};
        2'b11: q<=d;
      endcase
    end
  end
endmodule
//Testbench
module universal_shift_register_tb;
  parameter n=4;
  reg [n-1:0]d;
  reg clk,rst,si;
  reg [1:0]s;
  wire [n-1:0]q;
  universal_shift_register #(n)dut(.*);
  initial begin
    $dumpfile("out_universal_shift_register.vcd");
    $dumpvars(0,universal_shift_register_tb);
    $monitor("time=%0t | clk=%b | rst=%b | d=%b | s=%2b |  q=%b",$time,clk,rst,d,s,q);
  end
  always #5 clk=~clk;
  initial begin
    clk=0;rst = 1; d = 0;si=1;
    #10 rst = 0; s=2'b00; d = 4'b1010;
    #10 s=2'b01; d = 4'b1100;
    #50 s=2'b10; si=0;d = 4'b1011;
    #50 rst = 1;
    #10 s=2'b11; rst = 0; d = 4'b0011;
    #20 $finish;
  end
  
endmodule
              
