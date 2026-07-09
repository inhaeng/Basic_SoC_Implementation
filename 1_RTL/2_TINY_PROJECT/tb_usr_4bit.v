`timescale 1ns / 1ps

module tb_usr_4bit;
//signal def
//stimulus signal
reg		clk		;
reg		rst_n		;
reg	[3:0]	i_parallel	;
reg		i_shift_l	;
reg		i_shift_r	;
reg	[1:0]	i_mode		;
//monitoring sigal
wire	[3:0]	o_data		;

//DUT instantiation
usr_4bit dut (
	.clk		(clk		)	,
	.rst_n		(rst_n		)	,
	.i_parallel	(i_parallel	)	,
	.i_shift_l	(i_shift_l	)	,
	.i_shift_r	(i_shift_r	)	,
	.i_mode		(i_mode		)	,
	.o_data		(o_data		)
);

//dumpfile gen
initial begin
	$dumpfile("./usr_4bit.vcd"	)	;
	$dumpvars(0, tb_usr_4bit	)	;
end

//clk gen
always #5 clk = ~clk;

//test scenario
initial begin
	//t=0, init
	clk = 1'b0;	rst_n = 1'b0;
	i_parallel = 4'b0000;
	i_shift_l = 1'b0;	i_shift_r = 1'b0;
	i_mode = 2'b00;

	//rst release
	#20 rst_n = 1'b1;
	
	@(negedge clk);
	i_parallel = 4'b1011;
	i_mode = 2'b11;

	@(negedge clk);
	i_mode = 2'b00;

	@(negedge clk);
	i_shift_r = 1'b0;
	i_mode = 2'b01;

	@(negedge clk);
	i_shift_r = 1'b1;
	i_mode = 2'b01;

	@(negedge clk);
	i_shift_l = 1'b0;
	i_mode = 2'b10;

	@(negedge clk);
	i_shift_l = 1'b0;
	i_mode = 2'b10;

	@(negedge clk);
	rst_n = 1'b0;

	#50; $finish;
end

endmodule
