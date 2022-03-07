

/*
// Module: Instruction_memory.v
// Description: Instruction memory verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module Instruction_memory
#(parameter memory_width = 32, parameter memory_depth = 100)
(
    output  wire    [memory_width-1:0]  dout,
    input   wire    [memory_width-1:0]  addr
);

reg   [memory_width-1:0]   ROM   [memory_depth-1:0];

initial 
    begin
        $readmemh ("Hexadecimal_File.txt", ROM);
    end

assign dout = ROM[addr>>2];

endmodule 