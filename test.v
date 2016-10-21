module test;

	// Inputs
	reg [3:0] multiplicand;
	reg [3:0] multiplier;
	reg load;
	reg clear;
	reg clock;

	// Outputs
	wire [7:0] product;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	multiplier_booths uut (
		.product(product), 
		.done(done), 
		.multiplicand(multiplicand), 
		.multiplier(multiplier), 
		.load(load), 
		.clear(clear), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		multiplicand = 3;
		multiplier = -4;
		load=0;
		clear = 1;
		clock=0;
		

		// Wait 100 ns for global reset to finish
		#50;
      clear=0;
      load=1;
      #50
      clear=0;
      load=0;
      #250;
      clear=1;	
		// Add stimulus here

	end
	
   always #10 clock= ~clock;
endmodule
