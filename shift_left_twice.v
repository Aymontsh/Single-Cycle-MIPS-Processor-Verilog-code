
/*
// Module: shift_left_twice.v
// Description: shift left twice verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module shift_left_twice
#(parameter data_size = 32) 
(
    output reg    [data_size-1:0]     data_out,
    input  wire   [data_size-1:0]     data_in
);

always @(*)

    begin
        data_out = data_in << 2;
    end

endmodule