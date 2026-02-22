module dual_port_ram(input [15:0] data1,data2,input[13:0]addr1,addr2,input w_en1,w_en2,clk,output  reg [15:0]q1,q2);
  reg [15:0] mem[16383:0];
  always @(posedge clk) begin
    if(w_en1)
      mem[addr1]<=data1;
    else
      q1<=mem[addr1];
  end
  always @(posedge clk) begin
    if(w_en2 && !(w_en1 && addr1==addr2)) begin 
      mem[addr2]<=data2;
    end
    else
      q2<=mem[addr2];
  end
endmodule 
