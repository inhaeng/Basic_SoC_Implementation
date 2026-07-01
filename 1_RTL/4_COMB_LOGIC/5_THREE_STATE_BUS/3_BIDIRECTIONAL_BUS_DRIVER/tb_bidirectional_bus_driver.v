`timescale 1ns/1ps

module tb_bidirectional_bus_driver;
//stimulus signal
reg	[31:0]	i_data_to_bus		;
reg		i_send			;
reg		i_rcv			;
//monitor signal
wire	[31:0]	io_bus_data		;	//why inout wire?
wire	[31:0]	o_data_from_bus		;

//DUT instantiation
bidirectional_bus_driver dut(
	.i_data_to_bus		(i_data_to_bus		)	,
	.i_send			(i_send			)	,
	.i_rcv			(i_rcv			)	,
	.io_bus_data		(io_bus_data		)	,
	.o_data_from_bus	(o_data_from_bus	)		
);
//dumpfile gen
initial begin
	$dumpfile("./bidirectional_bus_driver.vcd"	)	;
	$dumpvars(0, tb_bidirectional_bus_driver	)	;
end


//internal register
reg	[31:0]	r_bus_drive_data					;
assign		io_bus_data = (i_rcv) ? r_bus_drive_data : 32'bz	;

//test scenario
initial begin
	//system for monitoring 
	 $monitor("Time=%05t | send=%b | rcv=%b | data_to_bus=%h | bus_data=%h | data_from_bus=%h", 
            $time, i_send, i_rcv, i_data_to_bus, io_bus_data, o_data_from_bus);
	
	//init
	i_data_to_bus		= 32'b0			;
	i_send			= 0			;
	i_rcv			= 0			;
	r_bus_drive_data	= 32'b0			;

	//apply stimulus
	#10;
	//send test
        i_send			= 1			;
	i_rcv			= 0			;
	i_data_to_bus		= 32'hffff;	#10	;

	//receive test
        i_send			= 0			;
	i_rcv			= 1			;
        r_bus_drive_data	= 32'hf0f0;	#10	;

	//send and receive disable
	i_send			= 0			;
	i_rcv			= 0			;
	#10;

	$finish;
end
endmodule
