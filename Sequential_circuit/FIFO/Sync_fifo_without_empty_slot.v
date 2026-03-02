module sync_fifo #(parameter depth=16,parameter n=8,parameter addr_n=4)(input [n-1:0]din,input clk,rst,w_en,r_en,output reg [n-1:0]dout,output full,empty);
  reg [n-1:0]mem[depth-1:0];
  reg [addr_n:0]wptr;
  reg [addr_n:0]rptr;
  always @(posedge clk) begin
    if(rst)
      wptr<=4'b0;
    else if(w_en && !full) begin
      mem[wptr[addr_n-1:0]]<=din;
      wptr<=wptr+1;
    end
  end
  always @(posedge clk) begin
    if(rst) begin
      rptr<=4'b0;
      dout<=8'b0;
    end
    else if(r_en && !empty) begin
      dout<=mem[rptr[addr_n-1:0]];
      rptr<=rptr+1;
    end
  end
  assign empty=(wptr==rptr);
  assign full=((wptr[addr_n]!=rptr[addr_n])&&(wptr[addr_n-1:0]==rptr[addr_n-1:0]));
endmodule

    
  
