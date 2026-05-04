/*This is a Moore state machine with two states, two inputs, and one output.
Implement this state machine.*/

module moore_fsm(input clk,input reset,input j,input k,output reg out);
parameter OFF = 1'b0,ON  = 1'b1;
reg state, next_state;
always @(posedge clk or posedge reset) begin
    if(reset)
        state <= OFF;
    else
        state <= next_state;
end
always @(*) begin   
    case(state)   
        OFF: begin
            if(j == 1)
                next_state = ON;
            else
                next_state = OFF;
        end       
        ON: begin
            if(k == 1)
                next_state = OFF;
            else
                next_state = ON;
        end        
        default:
            next_state = OFF;            
    endcase    
end
always @(*) begin    
    case(state)
        OFF: out = 1'b0;
        ON : out = 1'b1;
        default: out = 1'b0;
    endcase   
end
endmodule
//Testbench
module tb;
reg clk;
reg reset;
reg j;
reg k;
wire out;
moore_fsm uut(.clk(clk),.reset(reset),.j(j),.k(k),.out(out));
always #5 clk = ~clk;
initial begin
    $dumpfile("fsm.vcd");
    $dumpvars(0, tb);
    $monitor("T=%0t clk=%b reset=%b j=%b k=%b out=%b",
              $time, clk, reset, j, k, out);
end
initial begin
    clk = 0;
    reset = 1;
    j = 0;
    k = 0;
    #10 reset = 0;
    #10 j = 0;
    #10 j = 1;
    #10 j = 0;
    #10 k = 0;
    #10 k = 1;
    #10 k = 0;
    #20;
    $finish;

end
endmodule
