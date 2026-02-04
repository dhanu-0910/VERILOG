module half_adder_tb;
reg a,b;
wire sum,carry;
half_adder uut(.a(a),.b(b),.sum(sum),.carry(carry));
    initial begin
        $display("A B | S C");
        $monitor("%b %b | %b %b",a,b,sum,carry);
        a=0;b=0;#10;
        a=0;b=1;#10;
        a=1;b=0;#10;
        a=1;b=1;#10;
        $finish;
    end
endmodule
