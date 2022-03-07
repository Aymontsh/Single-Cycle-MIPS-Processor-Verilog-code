
/*
// Module: Adder.v
// Description: Adder verilog code //
// Owner : Mohamed Ayman
// Date : March 2022
*/

module Adder 
#(parameter data_size = 32)
(
output  reg    [data_size-1:0]   C,
input   wire   [data_size-1:0]   A,B
);

always @(*)
begin
    C = A + B;
end
endmodule

