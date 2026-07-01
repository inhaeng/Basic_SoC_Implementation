`timescale 1ns / 1ps

module tb_multiplexed_bus_driver;
//stimulus
reg	[31:0]	i_data_a	;
reg	[31:0]	i_data_b	;
reg		i_en_a		;
reg		i_en_b		;
//monitor
wire	[31:0]	o_bus_data	;

//dut instantiaiton
multiplexed_bus_driver dut(
	.i_data_a	(i_data_a	)	,
	.i_data_b	(i_data_b	)	,
	.i_en_a		(i_en_a		)	,
	.i_en_b		(i_en_b		)	,
	.o_bus_data	(o_bus_data	)	
);
//dumpfile gen
initial begin
	$dumpfile("./multiplexed_bus_driver.vcd")		;
	$dumpvars(0, tb_multiplexed_bus_driver	)		;
end



//TEST scenario
initial begin
	//monitoring
	 $monitor("Time=%05t | en_A=%b, data_A=%b | en_B=%b, data_B=%b | bus_data=%b", 
             $time, i_en_a, i_data_a, i_en_b, i_data_b, o_bus_data);

	//init
	i_data_a <= 32'haaaa_aaaa;  i_data_b <= 32'hcccc_cccc;
	//apply stimulus
	i_en_a <= 0; i_en_b <= 0; #10;  
	i_en_a <= 1; i_en_b <= 0; #10; 
   	i_en_a <= 0; i_en_b <= 1; #10; 
  	i_en_a <= 1; i_en_b <= 1; #10; 
   	i_en_a <= 0; i_en_b <= 0; #10; 

  	$finish;
end

endmodule

