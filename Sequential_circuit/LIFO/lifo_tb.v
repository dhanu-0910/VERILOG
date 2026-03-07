module lifo_tb;
  parameter depth=8;
  parameter width=4;
  reg [width-1:0]din;
  reg clk,rst,push,pop;
  wire overflow,underflow;
  wire [width-1:0]dout;
  lifo #(depth,width) dut(.*);
  always #5 clk=~clk;
  initial begin
    clk=0;rst=1;push=0;pop=0;din=4'd0;
    #10;rst=0;
    repeat(5) begin
      @(posedge clk)
      push=1;pop=0;
      din=din+1;
    end
    @(posedge clk)
    push=0;
    repeat(3) begin
      @(posedge clk)
      pop=1;push=0;
    end
    @(posedge clk)
    pop=0;
    repeat(3) begin
      @(posedge clk)
  	  push = 1;
  	  pop  = 1;
      din=din+1;
    end
    
    #20 $finish;
  end
  initial begin
    $dumpfile("lifo.vcd");
    $dumpvars(0,lifo_tb);   
    $monitor("time=%0t clk=%b rst=%b din=%d push=%b pop=%b dout=%d underflow=%b overflow=%b",$time,clk,rst,din,push,pop,dout,underflow,overflow);
  end
endmodule
      
    
