module L1_1(input a,b,output [3:1] o);
  assign o = {(b>a),(b==a),(a>b)};
endmodule
