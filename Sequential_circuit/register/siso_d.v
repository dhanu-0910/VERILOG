module siso (
    input clk,rst,
    input si,
    output reg so
);

    reg [3:0] q;

  always @(posedge clk) begin
    if(rst)begin
      q<=4'b0000;
    end
    else begin
      q <= {si,q[3:1]};
      so <= q[0];
    end
  end
    
endmodule


// Code your testbench here
// or browse Examples
module siso_tb;
  reg clk,si,rst;
  wire so;
  siso dut(.*);
  initial begin
    $monitor("t=%0t|si=%b clk=%b rst=%b|so=%b",$time,si,clk,rst,so);
    clk=0;
    si=0;rst=1;
    #5 si=1;rst=0;
    #25 si=0;rst=0;
    #45 si=1;rst=0;
  end
  always #5 clk=~clk;
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #400 $finish;
  end
endmodule
