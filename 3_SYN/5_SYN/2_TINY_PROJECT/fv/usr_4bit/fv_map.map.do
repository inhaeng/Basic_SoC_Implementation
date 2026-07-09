
//input ports
add mapped point clk clk -type PI PI
add mapped point rst_n rst_n -type PI PI
add mapped point i_parallel[3] i_parallel[3] -type PI PI
add mapped point i_parallel[2] i_parallel[2] -type PI PI
add mapped point i_parallel[1] i_parallel[1] -type PI PI
add mapped point i_parallel[0] i_parallel[0] -type PI PI
add mapped point i_shift_l i_shift_l -type PI PI
add mapped point i_shift_r i_shift_r -type PI PI
add mapped point i_mode[1] i_mode[1] -type PI PI
add mapped point i_mode[0] i_mode[0] -type PI PI

//output ports
add mapped point o_data[3] o_data[3] -type PO PO
add mapped point o_data[2] o_data[2] -type PO PO
add mapped point o_data[1] o_data[1] -type PO PO
add mapped point o_data[0] o_data[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point r_data[0]/q r_data_reg[0]/Q -type DFF DFF
add mapped point r_data[1]/q r_data_reg[1]/Q -type DFF DFF
add mapped point r_data[3]/q r_data_reg[3]/Q -type DFF DFF
add mapped point r_data[2]/q r_data_reg[2]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
