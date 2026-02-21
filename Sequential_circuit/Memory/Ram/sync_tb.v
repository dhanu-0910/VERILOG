module ram_tb;
  reg [7:0]din;
  reg [9:0]addr;
  reg w_en,clk;
  wire [7:0]dout;
  ram dut(.*);
  initial begin
    $dumpfile("out_ram.vcd");
    $dumpvars(0,ram_tb);
    $monitor("time=%0t, INPUT VALUES: din=%b addr=%b  w_en=%b  clk=%b, OUTPUT VALUES: dout=%b",$time,din,addr,w_en,clk,dout);
  end
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    din=8'd210;
    addr=10'd1010;
    w_en=1;
    #10
    din=8'd110;
    addr=10'd1000;
    w_en=1;
     #10
    din=8'd158;
    addr=10'd788;
    w_en=1;
     #10
     din=8'd210;
    addr=10'd1010;
    w_en=0;
    #10
    din=8'd110;
    addr=10'd1000;
    w_en=0;
     #10
    din=8'd158;
    addr=10'd788;
    w_en=0;
    #100 $finish;
  end
endmodule
