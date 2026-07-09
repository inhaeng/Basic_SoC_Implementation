`timescale 1ns / 1ps

module usr_4bit(
	//port list
	clk		,
	rst_n		,
	i_parallel	,
	i_shift_l	,
	i_shift_r	,
	i_mode		,
	o_data
);
//port declaration
input		clk		;
input		rst_n		;
input	[3:0]	i_parallel	;
input		i_shift_l	;
input		i_shift_r	;
input	[1:0]	i_mode		;
output	[3:0]	o_data		;

//internal register
reg	[3:0]	r_data		;


//modeling
always @(posedge clk or negedge rst_n) begin
	if( ~rst_n ) r_data  <= 4'b0000		;
	else begin
		case ( i_mode )
			2'b00 	: r_data <= r_data			;	// hold,  [d, c, b, a]
			2'b01 	: r_data <= {r_data[2:0], i_shift_r}	;	// shift right, from lsb to msb,  [c, b, a, sr]
			2'b10 	: r_data <= {i_shift_l, r_data[3:1]}	;	// shift left, from msb to lsb, [sl, d, c, b]
			2'b11 	: r_data <= i_parallel			;	// output
			default : r_data <= r_data			;
		endcase
	end
end

assign o_data = r_data	;

endmodule
