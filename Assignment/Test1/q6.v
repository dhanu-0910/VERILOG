module pri(input [7:0]d,output reg [2:0]y,output reg valid);
  always @(*) begin
    valid=1'b1;
    casez(d)
      8'b1zzzzzzz:y=3'b111;
      8'b01zzzzzz:y=3'b110;
      8'b001zzzzz:y=3'b101;
      8'b0001zzzz:y=3'b100;
      8'b00001zzz:y=3'b011;
      8'b000001zz:y=3'b010;
      8'b0000001z:y=3'b001;
      8'b00000001:y=3'b000;
      default:begin 
        valid=1'b0;
        y=3'b000;
      end
    endcase
  end
endmodule
//Testbench
module pri_tb;
  reg [7:0]d;
  wire [2:0]y;
  wire valid;
  pri dut(.*);
  initial begin
    $dumpfile("out_pri.vcd");
    $dumpvars(0,pri_tb);
    $monitor("d=%b y=%b valid=%b",d,y,valid);
  end
  initial begin
    d=8'b01000000;#10;
    d=8'b00000100;#10;
    d=8'b10000000;#10;
    d=8'b00000001;#10;
    d=8'b01010001;#10;
    d=8'b00000000;#10;
  end
endmodule

    
