module odd_even #(parameter n=4)(input [n-1:0]a,output reg y)
always@(*) begin
    if(a%2==0)
        y=0;
    else
    y=1;
end
endmodule
//Testbench
module odd_even_tb;
parameter n=8;
reg [n-1:0]a;
wire y;
odd_even #(n) dut(.*);
initial begin
    $dumpfile("out_odd_even.vcd");
    $dumpvars(0,odd_even_tb);
  $monitor("time=%0t,a=%d,odd_or_even=%b",$time,a,y);
end
initial begin
    a=2;#10;
    a=3;#10;
    a=5;#10;
    a=9;#10;
    a=51;#10;
    a=64;#10;
    $finish;
end
endmodule

