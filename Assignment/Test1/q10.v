module tb;
integer d;
initial begin
  repeat(10) begin
    d= ($random % 201) - 100;
    $display("time=%0t Random number = %0d",$time, d);
    #5;
  end
end
endmodule

