`timescale 1ns / 1ps
//always keeps looping and starts at t=0
module tb();
// global signal : clk and reset
	reg clk100;   //100MHz = 10 ns
	reg clk50;    //50MHz  = 20 ns	
	reg clk25;    //25MHZ  = 40 ns
	reg rst;
	
//set the values of global signal clk and reset
	initial begin
		clk100 = 1'b0;
		clk50  = 1'b0;
		clk25  = 1'b0;
		rst = 1'b0;
	end

//clock frequency of 100MHz = 10ns , period = 10ns, half cycle = 5ns

/*	clock phases are different, and timescale was set to 1ps / 1ps 
*	always #5000 clk100 = ~clk100;
	always #10000 clk50 = ~clk50;
	always #20000 clk25 = ~clk25;
*/

//To synchronize clock phases 
	// we use clk100 as ref clock 
	always #5 clk100 = ~clk100;

	always begin
		#5;
		clk50 = ~clk50;
		#5;
	end

	always begin
		#5;
		clk25 = ~clk25;
		#15;
	end

//to dump the simulation file
	initial begin
		$dumpfile("out/dump.vcd");
		$dumpvars;
	end

//to finish execution
	initial begin
		#200
		$finish();
	end
endmodule
	
