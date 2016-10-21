///////
//////
//////
///////
//////

module multiplier_booths #(parameter width = 4, no = 3)( 
output reg [(2*width-1):0] product, 
output reg done, 
input [(width-1):0] multiplicand, 
input [(width-1):0] multiplier, 
input      load, 
input clear, 
input clock ); 

reg [(3*width):0] accumulator; 
reg [no-1:0] count; 
reg [width+1:0] check ; 

always@(posedge clock, posedge clear) 
if(clear) 
begin 
accumulator = 0; 
done = 0;
check = 0; 
end 
else if(load) 
begin 
check = {1'b0,multiplier,1'b0}; 
count = 0; 
end 
else 
begin 
case(check[1:0]) 
2'b10 :  accumulator[3*width:width] = accumulator[3*width-1:width] + ~({{width{1'b0}},multiplicand}) + 1'b1; 
2'b01 :  accumulator[3*width:width] = accumulator[3*width-1:width] +   {{width{1'b0}},multiplicand}; 
default: accumulator = accumulator; 
endcase 

if(count == (width)) 
begin	
done = 1'b1; 
product = accumulator[(2*width-1):0]; 
end 

accumulator = {accumulator[3*width],accumulator[3*width:1]}; //shifting>>	add msb
check = {1'b0,check[width+1:1]}; //shifting >> add 0 msb
count = count + 1'b1; 
end
endmodule
