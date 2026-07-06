`timescale 1ns / 1ps

module tb_FSM1;
//local parameters
//stimulus sig
reg clk		;
reg rst_n	;
reg go		;
reg ws		;
//monitor sig
wire rd		;
wire ds		;
//DUT instantiation (with designated parameters)
FSM1 DUT (
	.clk	(clk	)	,
	.rst_n	(rst_n	)	,
	.go	(go	)	,
	.ws	(ws	)	,
	.rd	(rd	)	,
	.ds	(ds	)	
);
//dumpfile gen
initial begin
	$dumpfile("./FSM1.vcd")	;
	$dumpvars(0, tb_FSM1)	;
end
//clk gen
always #5 clk = ~clk;
//Test scenario //init //apply stimulus
initial begin
	//t=0, init
	clk = 1'b0;	rst_n = 1'b0;
	go = 1'b0;	ws = 1'b0;

	#100 rst_n = 1'b1; // rst off(system on)

	#100 go = 1'b1; ws = 1'b1;
	#100 ws = 1'b0;
	#100 rst_n = 1'b0;
	#100; $finish;
end

endmodule
