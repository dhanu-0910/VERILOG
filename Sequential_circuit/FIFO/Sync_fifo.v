module sync_fifo #(parameter depth=64,parameter n=8,parameter addr_n=6)(input [n-1:0]din,input clk,rst,w_en,r_en,output reg [n-1:0]dout,output full,empty);
  reg [n-1:0]mem[depth-1:0];
  reg [addr_n-1:0]wptr;
  reg [addr_n-1:0]rptr;
  always @(posedge clk) begin
    if(rst)
      wptr<=6'b0;
    else if(w_en && !full) begin
      mem[wptr]<=din;
      wptr<=wptr+1;
    end
  end
  always @(posedge clk) begin
    if(rst) begin
      rptr<=6'b0;
      dout<=8'b0;
    end
    else if(r_en && !empty) begin
      dout<=mem[rptr];
      rptr<=rptr+1;
    end
  end
  assign empty=(wptr==rptr);
  assign full=(rptr==(wptr+1'b1));
endmodule

    
  
