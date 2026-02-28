module alu(input [3:0]a,b,input clk,rst,input [3:0]sel,output reg [7:0]y);
  task arithmetic_op;
    input [3:0]a,b;
    input[3:0]s;
    output reg[7:0]out;
    begin
      case({s[2],s[1],s[0]})
        3'b000:out=a+b;
        3'b001:out=a-b;
        3'b010:out=a*b;
        3'b011:out=a/b;
        3'b100:out=a%b;
        3'b101:out=b+5;
        3'b110:out=a>>3;
        3'b111:out=b<<5;
        default:out=8'b0;
      endcase
    end
  endtask
  
  task logic_op;
    input [3:0]a,b;
    input[3:0]s;
    output reg[7:0]out;
    begin
      case({s[2],s[1],s[0]})
        3'b000:out=a&b;
        3'b001:out=a|b;
        3'b010:out=a^b;
        3'b011:out=~(a^b);
        3'b100:out=~(a&b);
        3'b101:out=~(a|b);
        3'b110:out=^a;
        3'b111:out=&b;
        default:out=8'b0;
      endcase
    end
  endtask   
  
  always @(posedge clk) begin
    if(rst)
      y<=8'b0;
    else begin
      if(sel[3])
        arithmetic_op(a,b,sel,y);
      else
        logic_op(a,b,sel,y);
    end
  end
endmodule
  
