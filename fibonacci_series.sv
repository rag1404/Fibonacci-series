module fibonacci_series (input clock,reset, input [7:0] number, output [19:0] fibonacci_number);
  
  reg [19:0] prev_value, next_value;
  reg [7:0] cnt;
  reg fb_ready;
  reg [19:0] fibonacci_number;
  
/*  always @(posedge reset) begin
   prev_value <='d0;
   next_value <='d1;
   cnt <= 'd1;
   fb_ready <= 0; 
   fibonacci_number <= 19'b0; 
  end*/
  
  always @(posedge clock or posedge reset) begin
    if (reset) 
    begin
    prev_value <='d0;
   next_value <='d1;
   cnt <= 'd1;
   fb_ready <= 0; 
   fibonacci_number <= 19'b0;
      
    end
    
    else begin
    cnt <= cnt +1;
    next_value <= next_value + prev_value;
    prev_value <= next_value;
    if (cnt == (number-1)) begin
    fb_ready <=1;
    fibonacci_number <= next_value;
    end
    else begin
      fb_ready <=0;
    end
  end
  end
  
 // assign fibonacci_number = next_value;
  
    always @(fb_ready) 
      if (fb_ready)
    $display ("Number is =%d, Nth fibonacci number =%d",number,fibonacci_number);
    
  
endmodule