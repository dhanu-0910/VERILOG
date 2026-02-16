module bidirectional_shift_register #(parameter n=4)(input clk,input s,input rst,input si,output reg[n-1:0]q);
  always@(posedge clk) begin
    if(rst)
      q<=0;
    else begin
      case(s)
        1'b1: q<={si,q[n-1:1]};
        1'b0: q<={q[n-2:0],si};
      endcase
    end
  end
endmodule

//Testbench
module bidirectional_shift_register_tb;
  parameter n=4;
  reg clk,rst,si;
  reg s;
  wire [n-1:0]q;
  bidirectional_shift_register #(n)dut(.*);
  initial begin
    $dumpfile("out_bidirectional_shift_register.vcd");
    $dumpvars(0,bidirectional_shift_register_tb);
    $monitor("time=%0t | clk=%b | rst=%b | s=%b |  q=%b",$time,clk,rst,s,q);
  end
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=1;si=0;#10;
    rst=0;s=1'b1;si=1;#40;
    rst=0;s=1'b0;si=0;#40;
    $finish;
  end
  
endmodule
              
