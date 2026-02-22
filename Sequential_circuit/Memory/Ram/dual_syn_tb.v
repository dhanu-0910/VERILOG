module dual_port_ram_tb();
  reg [15:0] data1,data2;
  reg [13:0] addr1,addr2;
  reg w_en1,w_en2,clk;
  wire  [15:0]q1,q2;  
  dual_port_ram dut(.*);
  initial begin
    $dumpfile("dual_port_ram.vcd");
    $dumpvars(1,dual_port_ram_tb);
    clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("time=%0t data1=%b data2=%b addr1=%b addr2=%b w_e1=%b w_e2=%b || q1=%b q2=%b",$time, data1,data2,addr1,addr2,w_en1,w_en2,q1,q2);
    data1=16'd20000;
    data2=16'd20123;
    addr1=14'd101;
    addr2=14'd102;
    w_en1=1;
    w_en2=1;
    #10
    data1=16'd20;
    data2=16'd23;
    addr1=14'd2000;
    addr2=14'd101;
    w_en1=1;
    w_en2=0;
    #10
    data1=16'd400;
    data2=16'd3;
    addr1=14'd1;
    addr2=14'd20;
    w_en1=0;
    w_en2=1;
    #10
    data1=16'd013;
    data2=16'd123;
    addr1=14'd2000;
    addr2=14'd3;
    w_en1=0;
    w_en2=0;
    #10
     data1=16'd45;
    data2=16'd18;
    addr1=14'd101;
    addr2=14'd101;
    w_en1=1;
    w_en2=1;
    #10
     data1=16'd233;
    data2=16'd435;
    addr1=14'd6754;
    addr2=14'd101;
    w_en1=1;
    w_en2=0;
    #10
     data1=16'd879;
    data2=16'd768;
    addr1=14'd20;
    addr2=14'd7;
    w_en1=0;
    w_en2=1;
    #10
    data1=16'd867;
    data2=16'd897;
    addr1=14'd12;
    addr2=14'd13;
    w_en1=1;
    w_en2=1;
    #10
    data1=16'd342;
    data2=16'd453;
    addr1=14'd34;
    addr2=14'd452;
    w_en1=1;
    w_en2=0;
    #10 $finish;
  end
endmodule
