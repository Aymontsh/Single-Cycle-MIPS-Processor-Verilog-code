
/*
// Module: Sign_Extend.v
// Description: Sign Extend verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module Sign_Extend 
#(parameter data_size = 32) 
(
    output  reg     [data_size-1:0]    SignImm,          
    input   wire    [15:0]              Instr
);

always @ (*)
begin
    if (Instr[15] == 0)
        SignImm = {{16{1'b0}},Instr};
    else
        SignImm = {{16{1'b1}},Instr};
end
endmodule