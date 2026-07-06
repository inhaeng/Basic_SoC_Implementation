`timescale 1ns / 1ps

module tb_FSM2;
//localparams
//stimulus sig
reg	clk	;	
reg	rst_n	;
reg	go	;
reg	ws	;
//monitor sig
wire	rd	;
wire	ds	;
//DUT instantiation
FSM2 dut (
	.clk	(clk	)	,
	.rst_n	(rst_n	)	,
	.go	(go	)	,
	.ws	(ws	)	,
	.rd	(rd	)	,
	.ds	(ds	)	
);
//Dump gen
initial begin
	$dumpfile("./FSM2.vcd"	)	;
	$dumpvars(0, tb_FSM2	)	;
end
//clk gen
always #5 clk = ~clk	;
//apply stimulus //init
initial begin
	//t=0, init
	clk = 1'b0; rst_n = 1'b0; // reset on
	go =1'b0; ws = 1'b0;

	#100 rst_n = 1'b1; // rst off
	
	//apply stimulus
	#100 go = 1'b1;	ws = 1'b1;
	#100 ws = 1'b0;
	#100 rst_n = 1'b0;
	#100; $finish;
end

endmodule
