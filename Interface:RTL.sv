// Interface has all the ports that are there in our module

interface add_if;

  logic [3:0] a;// we are using logic because it supports both reg or wire.
  logic [3:0] b;
  logic [4:0] sum;


endinterface


module tb;

  add_if aif(); // paranthesis mandatory

  //add dut(aif.a,aif.b,aif.sum);  //positional assignment

  add dut(.b(aif.b),.a(aif.a), .sum(aif.sum)); // mapping by name

  initial begin  // We will prefer non-blocking
    aif.a = 4;
    aif.b = 4;
    #10;
    aif.a = 3;
    #10;
    aif.b = 7;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
