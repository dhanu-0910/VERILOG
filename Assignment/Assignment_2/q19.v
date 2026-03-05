module mux2to1 (input I0,I1,S,output Y);
  assign Y = (~S & I0) | (S & I1);
endmodule

module and_mux(input A,B, output Y);
  mux2to1 M1(1'b0, B, A, Y);
endmodule
module or_mux(input A,B, output Y);
  mux2to1 M1(B, 1'b1, A, Y);
endmodule
module nand_mux(input A,B, output Y);
  wire nB;
  assign nB = ~B;
  mux2to1 M1(1'b1, nB, A, Y);
endmodule
module nor_mux(input A,B, output Y);
  wire nB;
  assign nB = ~B;
  mux2to1 M1(nB, 1'b0, A, Y);
endmodule
module xor_mux(input A,B, output Y);
  wire nB;
  assign nB = ~B;
  mux2to1 M1(B, nB, A, Y);
endmodule
module xnor_mux(input A,B, output Y);
  wire nB;
  assign nB = ~B;
  mux2to1 M1(nB, B, A, Y);
endmodule
//testbench
module tb;
  reg A, B;
  wire Y_and, Y_or, Y_nand, Y_nor, Y_xor, Y_xnor;
  and_mux   U1(A,B,Y_and);
  or_mux    U2(A,B,Y_or);
  nand_mux  U3(A,B,Y_nand);
  nor_mux   U4(A,B,Y_nor);
  xor_mux   U5(A,B,Y_xor);
  xnor_mux  U6(A,B,Y_xnor);

  initial begin
    $display("A B | AND  OR  NAND  NOR  XOR  XNOR ");
    $monitor("%b %b |  %b   %b    %b    %b    %b    %b",
              A,B,Y_and,Y_or,Y_nand,Y_nor,Y_xor,Y_xnor);
    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;
    $finish;
  end

endmodule
