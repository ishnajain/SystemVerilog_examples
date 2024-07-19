`timescale 1ns / 1ps
//code inside "intial begin" starts at t=0 parallely.
module tb();
	reg a = 0;
// global signal : clk and reset
	reg clk;
	reg rst;
//set the values of global signal clk and reset
	initial begin
		clk = 1'b1;
		rst = 1'b0;
		#60
		rst = 1'b1;
	end
//random signal for data/control
	initial begin
		a=1;
		#10
		a=10;
	end
//to monitor whenever value changes
	initial begin
		$monitor("a: %0d at time : %0t",a, $time);
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
	
