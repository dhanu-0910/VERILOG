module ram(input [7:0]data,input [15:0]addr,input clk,w_e,output [7:0]dout);
  reg [7:0]mem[65535:0];
  reg [5:0]reg_addr;
  always @(posedge clk) begin
    if(w_e)
      mem[addr]<=data;
    else
      reg_addr<=addr;
  end 
  assign dout=mem[reg_addr];
endmodule
