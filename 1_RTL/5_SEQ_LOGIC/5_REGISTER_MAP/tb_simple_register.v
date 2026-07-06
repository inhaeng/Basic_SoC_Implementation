`timescale 1ns / 1ps

module tb_simple_register;
//stimulus sig
reg		clk		;
reg		rst_n		;
reg		wen		;
reg	[31:0]	i_wdata		;
//monitor sig
wire	[31:0]	o_rdata		;

//DUT instantiation
simple_register dut (
	.clk		(clk		)	,
	.rst_n		(rst_n		)	,
	.wen		(wen		)	,
	.i_wdata	(i_wdata	)	,
	.o_rdata	(o_rdata	)	
);

//dumpfile gen
initial begin
	$dumpfile("./simple_register.vcd"	)	;
	$dumpvars(0, tb_simple_register	)		;
end

//clk gen
initial begin
	clk=0;
	forever #5 clk = ~clk;
end

//simulation scenario
initial begin
	//init
	rst_n = 1'b0; wen = 1'b0; i_wdata = 32'b0;
	#10 rst_n = 1'b1; //reset release

	//write test
	#10 wen = 1; i_wdata = 32'd1000;
	#10 wen = 0;

	//read test
	#10 $display("Read Data : %d", o_rdata);

	$finish;
end

endmodule
