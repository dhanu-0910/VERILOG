module d_to_bcd_encoder(input d0,d1,d2,d3,d4,d5,d6,d7,d8,d9, output b0,b1,b2,b3);
 or(b0,d1,d3,d5,d7,d9);
 or(b1,d2,d3,d6,d7);
 or(b2,d4,d5,d6,d7);
 or(b3,d8,d9);
 endmodule
