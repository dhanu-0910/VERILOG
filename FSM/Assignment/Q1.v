/*Design a finite state machine that has an input x and output y. The output should
be asserted whenever x = 1 or x = 0 for three consecutive clock pulses. In other
words, the FSM should detect the sequences 111 or 000. Overlapping sequences
are allowed, so a sequence of four or five 0s or 1s should also output 1.*/

module fsm (input clk,input reset,input x,output reg y);

parameter S0 = 3'd0,Z1 = 3'd1,Z2 = 3'd2,Z3 = 3'd3,O1 = 3'd4,O2 = 3'd5,O3 = 3'd6;
reg [2:0] state, next_state;
always @(posedge clk or posedge reset) begin
  if (reset)
    state <= S0;
  else
    state <= next_state;
end
always @(*) begin
  case(state)
    S0: next_state = (x) ? O1 : Z1;
    Z1: next_state = (x) ? O1 : Z2;
    Z2: next_state = (x) ? O1 : Z3;
    Z3: next_state = (x) ? O1 : Z3;
    O1: next_state = (x) ? O2 : Z1;
    O2: next_state = (x) ? O3 : Z1;
    default: next_state = S0;
  endcase
end
always @(*) begin
  case(state)
    Z3: y=1'b1;
    O3: y=1'b1;
    default: y = 1'b0;
  endcase
end

endmodule

//Testbench
module tb;
  reg clk;
  reg reset;
  reg x;
  wire y;
  fsm dut (.clk(clk),.reset(reset),.x(x),.y(y));
  always #5 clk = ~clk;
  initial begin
    $dumpfile("fsm_out.vcd");
    $dumpvars(0,tb);
    $monitor("time=%0t clk=%0b x=%0b y=%0b", $time, clk, x, y);
  end
  initial begin
    clk = 0;
    reset = 1;
    x = 0;
    #10 reset = 0;
    // Test sequence 000
    x = 0; #10;
    x = 0; #10
    x = 0; #10;   
    x = 0; #10;   
    // Test sequence 111
    x = 1; #10;
    x = 1; #10;
    x = 1; #10;   
    x = 1; #10;   
    //Mixed sequence
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 0; #10;
    x = 0; #10;   
    x = 1; #10;
    x = 1; #10;
    x = 1; #10;   
    #20;$finish;
  end
endmodule

