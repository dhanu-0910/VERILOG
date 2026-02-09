module bcd_to_excess #(parameter n=1)(input [4*n-1:0]bcd, output reg [4*n-1:0]excess);
integer i;
always @(*) begin
    for(i=0;i<n;i=i+1) begin
        if(bcd[4*i +: 4]<=4'd9)
            excess[4*i +: 4] = bcd[4*i +: 4] + 4'd3;
        else
            excess[4*i +: 4] = 4'd0;
    end
end
endmodule
