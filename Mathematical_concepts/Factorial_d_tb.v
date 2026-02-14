module factorial #(parameter n=4, parameter out=32)(input [n-1:0] a,output reg [out-1:0] fact);
integer i;
always @(*) begin
fact = 1;                  
for(i = 1; i <= a; i = i + 1) begin
    fact = fact * i;
end
end
endmodule

//Testbench
module factorial_tb;
parameter n=4;
parameter out=32;
reg [n-1:0]a;
wire [out-1:0]fact;
factorial #(n,out) dut(.*);
initial begin
    $dumpfile("out_factorial.vcd");
    $dumpvars(0,factorial_tb);
    $monitor("factorial=%b",fact);
end
initial begin
    a=4'b0011;
end
endmodule
