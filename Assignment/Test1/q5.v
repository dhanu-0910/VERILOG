module clk(input clk,input rst,output reg clk_out);
reg [17:0] count;    
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      count <= 0;
      clk_out <= 0;
    end
    else begin
      if(count == 249999) begin
        count <= 0;
        clk_out <= ~clk_out;
      end
      else
        count <= count + 1;
    end
end
endmodule
