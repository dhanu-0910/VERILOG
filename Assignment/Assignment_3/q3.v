module task_sum #(parameter n=4)(input [n-1:0]a,b,output reg [n:0]c);
  always @(*)begin
    sum(a,b,c);
  end
  
  task sum;
    input[n-1:0]a,b;
    output [n:0]c;
    c=a+b;
  endtask
  
endmodule
//Tb
module task_sum_tb;
  parameter n=8;
  reg [n-1:0]a,b;
  wire [n:0]c;
  task_sum #(8)dut(.*);
  initial begin
    $dumpfile("task_sum.vcd");
    $dumpvars(0,task_sum_tb);
  end
  initial begin
    $monitor("time=%0t a=%0d b=%0d c=%0d",$time,a,b,c);
    a=36;b=54;#10;
    a=15;b=24;#5;
    a=10;b=56;#20;
    $finish;
  end
endmodule
    
  
