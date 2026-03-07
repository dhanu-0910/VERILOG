module lifo #(parameter depth=8,parameter width=4)(input [width-1:0]din,input  push,pop,clk,rst,output overflow,underflow,output reg [width-1:0]dout);
  reg [$clog2(depth):0]stk_ptr;
  reg [width-1:0]mem[depth-1:0];
  
  assign underflow= (stk_ptr==0);
  assign overflow= (stk_ptr==depth);
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      stk_ptr<=0;
      dout<=4'b0;
    end
    else if(push && !overflow && !pop) begin
      mem[stk_ptr]<=din;
      stk_ptr<=stk_ptr+1;
    end
    else if(pop && !underflow && !push) begin
      stk_ptr<=stk_ptr-1;
      dout<=mem[stk_ptr-1];
    end
    else if(push && pop && !underflow) begin
      mem[stk_ptr-1]<=din;
      dout<=mem[stk_ptr-1];
    end
  end
endmodule
      
      
    
