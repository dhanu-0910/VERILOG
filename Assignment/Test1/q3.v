module full_adder #(parameter n=4)(input [n-1:0]a,input [n-1:0]b,input cin,output [n-1:0]sum,output cout);
  assign{cout,sum}=a+b+cin;
endmodule
//Testbench
module full_adder_tb;
  reg [7:0] a8,b8;
  reg cin8;
  wire [7:0] sum8;
  wire cout8;
  
  reg [15:0] a16,b16;
  reg cin16;
  wire [15:0]sum16;
  wire cout16;

  full_adder #(.n(8)) FA8 (.a(a8),.b(b8),.cin(cin8),.sum(sum8),.cout(cout8));
  
  full_adder #(.n(16)) FA16 (.a(a16),.b(b16),.cin(cin16),.sum(sum16),.cout(cout16));
  initial begin
    a8   = 8'd255;
    b8   = 8'd1;
    cin8 = 1'b0;
    #5;
    $strobe("8-bit: a=%0d b=%0d cin=%b sum=%0d cout=%b",
             a8, b8, cin8, sum8, cout8);

    a16   = 16'd2000;
    b16   = 16'd3000;
    cin16 = 1'b1;
    #5;
    $strobe("16-bit: a=%0d b=%0d cin=%b sum=%0d cout=%b",
             a16, b16, cin16, sum16, cout16);

    #10 $finish;
  end

endmodule
    
