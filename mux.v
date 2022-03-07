
/*
// Module: mux.v
// Description: MUX verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module mux
#(parameter data_size = 32) 
(
    output reg    [data_size-1:0]     data_out,
    input  wire   [data_size-1:0]     data_in1,data_in2,
    input  wire                       sel
);

always @(*)

    begin
        if (sel)
            data_out = data_in2;
        else
            data_out = data_in1;
    end

endmodule


