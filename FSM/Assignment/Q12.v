
module fsm(input clk,input reset,input x,output reg z);
  parameter S0=3'd0,S1=3'd1,S2=3'd2,S3=3'd3,S4=3'd4;
  reg [2:0] state, next_state;
  always @(posedge clk or posedge reset) begin
    if(reset)
      state <= 0;
    else
      state <= next_state;
  end
  always @(*) begin
    case(state)
      S0: next_state = (x) ? S1 : S0;
      S1: next_state = (x) ? S3 : S2;
      S2: next_state = (x) ? S0 : S4;
      S3: next_state = (x) ? S2 : S1;
      S4: next_state = (x) ? S4 : S3;
      default: next_state = S0;
    endcase
  end
  always @(*) begin
    if (reset)
        z = 1'b0;
    else begin
      case(state)                                       
        S0: z = 1'b1;
        default: z = 1'b0;
      endcase
    end
  end
endmodule
//Testbench
module tb;
  reg clk;
  reg reset;
  reg x;
  wire z;
  fsm dut (.clk(clk),.reset(reset),.x(x),.z(z));
  always #5 clk = ~clk;
  initial begin
    $dumpfile("Fsm_out.vcd");
    $dumpvars(0,tb);
    $monitor("time=%0t clk=%0b reset=%0b x=%0b z=%0b", $time, clk, reset, x, z);
  end
  initial begin
    clk = 0;
    reset = 1;
    x = 0;
    #10 reset = 0;
    x = 1; #10;   
    x = 0; #10;   
    x = 1; #10;   
    x = 1; #10;   
    x = 0; #10;
    reset = 1; #10;
    reset = 0; 
    x = 1; #10;
    x = 1; #10;
    x = 1; #10;
    x = 1; #10;   
    #20;$finish;
    end
endmodule
