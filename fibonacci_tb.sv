
module tb_fibonacci ();
  
  reg clock,reset;
  reg [7:0] number;
  wire [19:0] fibonacci_number;
  
  fibonacci_series f1(.*);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    clock = 0;
    reset = 0;
    
    
    #5 reset = 1;
    #5 reset =0;
    #1 number = 10;
    
    #100 $finish;
    end
  
  initial begin
    repeat (100) #1 clock = !clock;
  end
  
 
  
endmodule