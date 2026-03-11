module fsm_traffic (input clk,rst,output reg g,y,r);
  parameter s0=2'b00,s1=2'b01,s2=2'b10;
  reg [1:0]s;
  always @(posedge clk or posedge rst) begin
    if(rst)
      s<=s0;
    else begin
      case(s)
        s0:s<=s1;
        s1:s<=s2;
        s2:s<=s0;
        default:s<=s0;
      endcase
    end
  end
  always @(*) begin
    case(s)
      s0: begin
        g=1;y=0;r=0;
      end
      s1: begin
        g=0;y=1;r=0;
      end
      s2:begin
        g=0;y=0;r=1;
      end
      default: begin
        g=0;y=0;r=0;
      end
    endcase
  end
endmodule
//Testbench
module fsm_traffic_tb;
  reg clk,rst;
  wire g,y,r;
  fsm_traffic dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("time=%0t clk=%b rst=%b g=%b y=%b r=%b",$time,clk,rst,g,y,r);
    clk=0;rst=1;#10
    rst=0;#60;$finish;
  end
endmodule

        
    
  

    
