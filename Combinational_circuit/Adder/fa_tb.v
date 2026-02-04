module full_adder_tb;

reg a,b,cin;
wire sum,cout;

full_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
    initial begin
        $display("A B Ci | S Co");
        $monitor("%b %b %b | %b %b",a,b,cin,sum,cout);
        a=0;b=0;cin=0;#10;
        a=0;b=0;cin=1;#10;
        a=0;b=1;cin=0;#10;
        a=0;b=1;cin=1;#10;
        a=1;b=0;cin=0;#10;
        a=1;b=0;cin=1;#10;
        a=1;b=1;cin=0;#10;
        a=1;b=1;cin=1;#10;
        $finish;
    end
endmodule
