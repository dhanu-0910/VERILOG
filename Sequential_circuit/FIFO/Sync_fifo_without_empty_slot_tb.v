module sync_fifo_tb;
  parameter depth=16;
  parameter n=8;
  parameter addr_n=4;
  reg [n-1:0]din;
  reg clk,rst,w_en,r_en;
  wire [n-1:0]dout;
  wire full,empty;
  sync_fifo #(depth,n,addr_n)dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("out_sync_fifo.vcd");
    $dumpvars(0,sync_fifo_tb);
    $monitor("time=%0t clk=%b rst=%b w_en=%b r_en=%b din=%b dout=%b full=%b empty=%b", $time,clk,rst,w_en,r_en,din,dout,full,empty);
  end
  initial begin
    clk=0;rst=1;w_en=0;r_en=0;din=0;#10;
    rst=0;
    repeat (5) begin
      @(posedge clk);
      w_en=1;
      din=din+8'd10;
    end
    @(posedge clk);
    w_en=0;
    
    repeat (5) begin
      @(posedge clk);
      r_en=1;
    end
    @(posedge clk);
    r_en=0;
    @(posedge clk);
    r_en = 1;
    @(posedge clk);
    r_en = 0;
    repeat (20) begin
      @(posedge clk);
      if(!full) begin
        w_en=1;
        din=din+1;
      end
    end
    @(posedge clk);
    w_en = 0;
    
    #20;
    $finish;
    end
endmodule
    
