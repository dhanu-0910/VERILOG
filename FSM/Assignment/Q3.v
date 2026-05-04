/*The purpose of this lab is to build a Binary-to-BCD converter using the double
dabble algorithm (aka the shift-add-3 algorithm). You will only utilize
combinational circuit components, verify the functionality of the converter using
a testbench*/
module binary_to_bcd(input  [7:0] bin,output reg [11:0] bcd);
  integer i;
  always @(*) begin
    bcd = 12'd0;
    for(i=7; i>=0; i=i-1) begin
      if(bcd[3:0] >= 5)
        bcd[3:0] = bcd[3:0] + 3;
      if(bcd[7:4] >= 5)
        bcd[7:4] = bcd[7:4] + 3;
      if(bcd[11:8] >= 5)
        bcd[11:8] = bcd[11:8] + 3;
      bcd = {bcd[10:0], bin[i]};
    end
  end
endmodule

//Testbench
module tb;
  reg [7:0] bin;
  wire [11:0] bcd;
  binary_to_bcd uut(.bin(bin),.bcd(bcd));
  initial begin
    $monitor("bin=%0d  bcd=%b", bin, bcd);
    bin = 8'd13; #10;   
    bin = 8'd25; #10;   
    bin = 8'd99; #10;  
    bin = 8'd123; #10;  
    $finish;
  end
endmodule
/*Suppose input = 8-bit binary number.
We need 3 BCD digits:
->Hundreds
->Tens
->Ones
Initialize:
BCD = 0000 0000 0000
Then repeat for every input bit:
Step 1: If any BCD digit ≥ 5, add 3.
Step 2: Shift left by 1 and bring next binary bit.
Repeat 8 times.
*/
