module prime #(parameter n=4)(input [n-1:0]a,output reg y);
integer i;
reg f;
always @(*) begin
    if(a==0 || a==1)
        y=0;
    else if(a==2 || a==3)
        y=1;
    else begin
        f=1;
        for(i=2;i<a;i=i+1) begin
            if(a%i==0)
                f=0;
        end
        y=f;
    end
end 
endmodule

//Testbench
module prime_tb;
parameter n=4;
reg [n-1:0]a;
wire y;
prime #(n) dut(.*);
initial begin
    $dumpfile("out_prime.vcd");
    $dumpvars(0,prime_tb);
    $monitor("time=%0t,a=%b,prime=%b",$time,a,y);
end
initial begin
    a=4'b0010;#10;
    a=4'b0000;#10;
    a=4'b1100;#10;
    a=4'b0011;#10;
    a=4'b1010;#10;
    a=4'b0101;#10;
    $finish;
end
endmodule
