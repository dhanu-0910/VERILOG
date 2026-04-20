/*Write a Verilog program with the following specifications.
1. It should have a memory of size 8x14.
2. Write a task/function to fill all elements in the memory.
3. Write a method to add the values stored inside the memory.
4. Write a method to find the largest number in the memory*/
module memory;
reg [13:0]mem[0:7];
integer i;
reg [13:0]max;

task elements;
  for(i=0;i<8;i=i+1)begin
    mem[i]=i*5+5;
    $display("mem[%0d]=%0d",i,mem[i]);
  end
endtask
function [15:0]sum;
  integer j;
  sum=0 ;
  for(j=0;j<8;j=j+1)begin
    sum=sum+mem[j];
  end
endfunction
task max_elements;
  max=mem[0];
  for(i=0;i<8;i=i+1)begin
    if(max<mem[i])begin
      max=mem[i];
    end
  end
  $display("Maximum element=%0d",max);
endtask
initial begin
  elements();
  $display("Sum=%0d",sum());
  max_elements();
end
endmodule
  
