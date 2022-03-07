
/*
// Module: ALU.v
// Description: ALU verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module ALU 
#(parameter data_size = 32)
(
output  reg    [data_size-1:0]   ALUResult,
output  wire                     Zero_flag,
input   wire   [data_size-1:0]   SrcA,SrcB,
input   wire   [2:0]             ALUcontrol
);

always @ (*)
begin
    case (ALUcontrol)
        3'b000 : ALUResult = SrcA & SrcB;
        3'b001 : ALUResult = SrcA | SrcB; 
        3'b010 : ALUResult = SrcA + SrcB;        
        3'b100 : ALUResult = SrcA - SrcB; 
        3'b101 : ALUResult = SrcA * SrcB; 
        3'b110 : 
                begin
                    if (SrcA < SrcB)
                        ALUResult = 1;
                    else
                        ALUResult = 0;
                end
        default: ALUResult = SrcA + SrcB;  
    endcase 
end
assign Zero_flag = (ALUResult == 0) ? 1'b1: 1'b0;
endmodule