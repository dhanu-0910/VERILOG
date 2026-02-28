module comp(input [1:0]a,b,output aeb,alb,agb);
  assign aeb=(((a[1]&b[1])|(~a[1]&~b[1]))&((a[0]&b[0])|(~a[0]&~b[0])));
  assign agb=(a[1]&~b[1])|(((a[1]&b[1])|(~a[1]&~b[1]))&(a[0]&~b[0]));
  assign alb=(~a[1]&b[1])|(((a[1]&b[1])|(~a[1]&~b[1]))&(~a[0]&b[0]));  
endmodule
//Testbench
                            
  module comp_tb;
  reg [1:0]a,b;
  wire aeb,alb,agb;
  comp dut(.*);
  initial begin
    $monitor("time=%0t a=%b b=%b aeb=%b agb=%b alb=%b",$time,a,b,aeb,agb,alb);
  end
  initial begin
    a=2'b00;b=2'b00;#10;
    a=2'b01;b=2'b00;#10;
    a=2'b10;b=2'b11;#10;
    a=2'b10;b=2'b10;#10;
    a=2'b11;b=2'b01;#10;
    a=2'b10;b=2'b01;#10;
    $finish;
    end
endmodule
