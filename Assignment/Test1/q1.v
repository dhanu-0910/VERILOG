module diamond;
  integer i,j,k;
  initial begin
    for(i=1;i<=5;i=i+1) begin
      for(j=5;j>i;j=j-1)
        $write(" ");
      for(k=1;k<=i;k=k+1)
        $write("%0d ",i);
      $write("\n");
    end
    for(i=4;i>=1;i=i-1)begin
      for(j=5;j>i;j=j-1)
        $write(" ");
      for(k=1;k<=i;k=k+1)
        $write("%0d ",i);
      $write("\n");
    end
    $finish;
  end
endmodule
