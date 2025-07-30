`timescale 1ns / 1ns
module tb ();
  reg [3:0] A, B;
  wire result;
  equality_comparator uut (.A(A),.B(B),.result(result));

  initial begin
    $dumpfile("L1_2_waveform.vcd");
    $dumpvars(0, tb);

    A = 4'b0000; B = 4'b0000 
    #15;
    A = 4'b1010; B = 4'b1010; 
    #15;
    A = 4'b1110; B = 4'b000; 
    #15;
    A = 4'b1100; B = 4'b1100; 
    #15;
    A = 4'b1011; B = 4'b1011; 
    #10;
    A = 4'b1000; B = 4'b1001; 
    #10
    $finish;
  end

endmodule
