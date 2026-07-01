`timescale 1ns / 1ps

module bidirectional_bus_driver(
	//port list
	i_data_to_bus		,
	i_send			,
	i_rcv			,
	io_bus_data		,
	o_data_from_bus		
);
//port declaration
input	[31:0]		i_data_to_bus		;
input			i_send			;
input			i_rcv			;
inout	[31:0]		io_bus_data		;
output	[31:0]		o_data_from_bus		;

//modeling	: 3-state buffer
assign io_bus_data = (i_send) ? i_data_to_bus : 32'bz		;

//modeling	: data receive logic
reg	[31:0]		o_data_from_bus		;
always @(*) begin
	if(i_rcv) begin
		o_data_from_bus = io_bus_data			;
	end else begin
		o_data_from_bus = 32'b0				; //default
	end
end

endmodule
