/*Design a Traffic Light Controller using Verilog to manage traffic flow at a
four-way intersection. This system should handle complex traffic scenarios,
including emergency vehicle priority, pedestrian crossing, and adaptive timing
based on traffic density.*/

module traffic_controller(input clk,input reset,input emg_ns,input emg_ew,input ped_req,input traffic_ns,input traffic_ew,output reg [2:0] ns_light,output reg [2:0] ew_light,output reg ped_walk);
  parameter S0=3'd0,S1=3'd1,S2=3'd2,S3=3'd3,S4=3'd4,S5=3'd5;   
  parameter RED = 3'b100,YELLOW = 3'b010,GREEN  = 3'b001;
  reg [2:0] state, next_state;
  reg [3:0] timer;
  wire [3:0] ns_time;
  wire [3:0] ew_time;
  assign ns_time = (traffic_ns) ? 8 : 4;
  assign ew_time = (traffic_ew) ? 8 : 4;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= S0;
      timer <= 0;
    end
    else begin
      state <= next_state;
      timer <= timer + 1;
    end
  end
  always @(*) begin
    if(emg_ns || emg_ew)
      next_state = S4;
    else begin
      case(state)
        S0: begin
          if(timer >= ns_time)
            next_state = S1;
          else
            next_state = S0;
        end
        S1: begin
          if(timer >= 2) begin
            if(ped_req)
              next_state = S5;
            else
              next_state = S2;
          end
          else
            next_state = S1;
        end
        S2: begin
          if(timer >= ew_time)
            next_state = S3;
          else
            next_state = S2;
        end
        S3: begin
          if(timer >= 2) begin
            if(ped_req)
              next_state = S5;
            else
              next_state = S0;
          end
          else
            next_state = S3;
        end
        S4: begin
          if(!(emg_ns || emg_ew))
            next_state = S0;
          else
            next_state = S4;
        end
        S5: begin
          if(timer >= 4)
            next_state = S0;
          else
            next_state = S5;
        end
        default:
          next_state = S0;
      endcase
    end
  end
  always @(*) begin
    ped_walk = 0;
    case(state)
      S0: begin
        ns_light = GREEN;
        ew_light = RED;
      end
      S1: begin
        ns_light = YELLOW;
        ew_light = RED;
      end
      S2: begin
        ns_light = RED;
        ew_light = GREEN;
      end
      S3: begin
        ns_light = RED;
        ew_light = YELLOW;
      end
      S4: begin
        if(emg_ns) begin
          ns_light = GREEN;
          ew_light = RED;
        end
        else begin
          ns_light = RED;
          ew_light = GREEN;
        end
      end
      S5: begin
        ns_light = RED;
        ew_light = RED;
        ped_walk = 1;
      end
      default: begin
        ns_light = RED;
        ew_light = RED;
      end
    endcase
  end
endmodule
//Testbench
module tb;
  reg clk;
  reg reset;
  reg emg_ns;
  reg emg_ew;
  reg ped_req;
  reg traffic_ns;
  reg traffic_ew;
  wire [2:0] ns_light;
  wire [2:0] ew_light;
  wire ped_walk;
  traffic_controller uut(.clk(clk),.reset(reset),.emg_ns(emg_ns),.emg_ew(emg_ew),.ped_req(ped_req),.traffic_ns(traffic_ns),.traffic_ew(traffic_ew),.ns_light(ns_light),.ew_light(ew_light),.ped_walk(ped_walk));
  always #5 clk = ~clk;
  initial begin
    $dumpfile("traffic_out.vcd");
    $dumpvars(0,tb);
    $monitor("T=%0t reset=%b emg_ns=%b emg_ew=%b ped=%b ns=%b ew=%b walk=%b",$time, reset, emg_ns, emg_ew, ped_req, ns_light, ew_light, ped_walk);
  end
  initial begin
    clk = 0;
    reset = 1;
    emg_ns = 0;
    emg_ew = 0;
    ped_req = 0;
    traffic_ns = 0;
    traffic_ew = 0;
    #10 reset = 0;
    #60;
    ped_req = 1;
    #30;
    ped_req = 0;
    emg_ns = 1;
    #30;
    emg_ns = 0;
    traffic_ns = 1;
    #60;
    traffic_ns = 0;
    emg_ew = 1;
    #30;
    emg_ew = 0;
    #50;
    $finish;

  end
endmodule
