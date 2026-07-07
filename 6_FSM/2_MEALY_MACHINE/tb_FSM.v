`timescale 1ns / 1ps

module tb_FSM;
//signal def // stimulus // monitoring
//stimuls sig
reg	clk	;
reg	rst_n	;
reg	din_bit	;
//monitor sig
wire	dout_bit;

//DUT instantiation
FSM dut (
	.clk		(clk		)	,
	.rst_n		(rst_n		)	,
	.din_bit	(din_bit	)	,
	.dout_bit	(dout_bit	)	
);

//Dump gen
initial begin
	$dumpfile("./FSM.vcd"	)	;
	$dumpvars(0, tb_FSM	)	;
end

//clk gen
always #5 clk = ~clk			;


//Test scenario
initial begin
	//t=0 init
	clk = 1'b0;	rst_n = 1'b0;	din_bit = 1'b0;

	//reset release
	#100 rst_n = 1'b1;

	//apply stimulus
	repeat(20) begin
		@(negedge clk)		;
		din_bit = $random % 2	;
	end

	#200; $finish;

end






endmodule
