module ram(input [7:0]data,input [3:0]addr,input clk,w_e,output [7:0]dout);
  reg [7:0]mem[15:0];
  always @(posedge clk) begin
    if(w_e)
      mem[addr]<=data;
  end 
  assign dout=mem[addr];
endmodule
