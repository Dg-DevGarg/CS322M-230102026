module tb();
  reg a,b;
  wire [3:1] o;
  L1_1 dut(.a(a),.b(b),.o(o));
  initial begin
    $dumpfile("L1_1wave.vcd");
    $dumpvars(0,tb);

    a = 0; b = 0; 
    #15;
    a = 0; b = 1; 
    #15;
    a = 1; b = 0; 
    #15;
    a = 1; b = 1; 
    #15;

    $finish;
  end
endmodule
