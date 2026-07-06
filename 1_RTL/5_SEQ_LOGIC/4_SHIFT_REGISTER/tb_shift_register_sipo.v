`timescale 1ns / 1ps

module tb_shift_register_sipo;
//local parameter
localparam WIDTH = 8			;
//stimuls
reg			clk		;
reg			rst_n		;
reg			i_serial_in	;
//monitor
wire [WIDTH-1:0]	o_parallel_out	;

//dut instantiation
shift_register_sipo dut(
	.clk		(clk		)	,
	.rst_n		(rst_n		)	,
	.i_serial_in	(i_serial_in	)	,
	.o_parallel_out	(o_paralle_out	)
);

//dump gen
initial begin
	$dumpfile("./shift_register_sipo.vcd")	;
	$dumpvars(0, tb_shift_register_sipo)	;
end
//clock gen
initial begin
	clk = 0;
	forever #5 clk = ~clk; // 10ns (100MHz)
end	

//Test scenario
initial begin
	rst_n	  = 1'b0;	i_serial_in = 0;
	#15 rst_n = 1'b1;
	//random vector generation
	repeat(WIDTH*2) begin
		@(negedge clk);
		i_serial_in = $random % 2;
	end
	#50 $finish;
end

//monitoring
initial begin
    $monitor("time=%0t | reset=%b | serial_in=%b | parallel_out=%b", $time, rst_n, i_serial_in, o_parallel_out);
end

endmodule
