module odd_even #(parameter n=6,count=20) (input x,output reg [n-1:0]z[count-1:0]);
  integer i;
  always @(*)begin
    for(i=0;i<count;i=i+1)begin
      if(x)
        z[i]=odd(i);
      else
        z[i]=even(i);
    end
  end
  
  function [n-1:0]odd;
    input [n-1:0]a;
    odd=(2*a)+1;
  endfunction
  
  function [n-1:0]even;
    input [n-1:0]a;
    even=(2*a);
  endfunction
  
endmodule
//Tb
module odd_even_tb #(parameter n=6,count=20);
  reg x;
  wire [n-1:0]z[count-1:0];
  odd_even dut(.*);
  initial begin
    $dumpfile("odd_even.vcd");
    $dumpvars(0,odd_even_tb);
  end
  initial begin
    x=1;
    for(i=0;i<count;i=i+1) begin
      #10;
      $display("time=%0t x=%0d z=%0d",$time,x,z[i]);
    end
    x=0;
    for(i=0;i<count;i=i+1) begin
      #10;
      $display("time=%0t x=%0d z=%0d",$time,x,z[i]);
    end
    #10;$finish;
  end
endmodule
      
  
