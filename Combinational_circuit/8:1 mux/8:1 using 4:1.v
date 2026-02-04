module mux_4to1(input [3:0]d, input [1:0]s,output reg y);
always @(*) begin
    case(s)
        2'b00:y=d[0];
        2'b01:y=d[1];
        2'b10:y=d[2];
        2'b11:y=d[3];
        default:y=1'b0;
    endcase
end
endmodule
module mux_8to1(input [7:0]d, input [3:0]s,output y);
wire y0,y1;
mux_4to1 m1(.d(d[3:0]),.s(s[1:0]),.y(y0));
mux_4to1 m2(.d(d[7:4]),.s(s[1:0]),.y(y1));
assign y= (s[2]==1'b0)?y0:y1;
endmodule
    
