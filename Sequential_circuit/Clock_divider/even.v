module cd #(parameter n=4)(input clk,rst,output reg clk_out);
  reg [$clog2(n)-1:0]count;
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      count<=0;
      clk_out<=0;
    end
    else begin
      if(count==(n/2-1)) begin
        clk_out<=~clk_out;
        count<=0;
      end
      else
        count<=count+1;
    end
  end
endmodule

    
  
