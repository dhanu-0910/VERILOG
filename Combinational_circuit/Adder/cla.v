module cla #(parameter n=4)(input [n-1:0]a,input [n-1:0]b,input cin,output reg[n-1:0]sum,output  cout);
reg [n-1:0]g;
reg [n-1:0]p;
reg [n:0]c;
integer i;
//propagate and genearte 
always @(*)begin
    c[0]=cin;
    for(i=0;i<n;i=i+1) begin
        p[i]=a[i]^b[i];
        g[i]=a[i]&b[i];
    end
end
//carry 
always @(*)begin
    for(i=0;i<n;i=i+1) begin
        c[i+1]=g[i]|(p[i]&c[i]);
    end
end
//sum 
always @(*)begin
    for(i=0;i<n;i=i+1) begin
        sum[i]=p[i]^c[i];
    end
end
assign cout=c[n];
endmodule


