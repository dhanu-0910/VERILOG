module ram(input clk,w_en,input [7:0]din,input [9:0]addr,output reg [7:0]dout);
  reg [7:0]mem[1023:0];
  always @(posedge clk) begin
    if(w_en)
      mem[addr]<=din;
    else
      dout<=mem[addr];
  end
endmodule
