
/*
// Module: control_unit.v
// Description: Control unit verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module control_unit (
    output  wire             MemtoReg,MemWrite,ALUSrc,RegDst,RegWrite,Jump,PCsrc,
    output  wire    [2:0]    ALUControl,
    input   wire    [5:0]    Funct,
    input   wire    [5:0]    opcode,
    input   wire             zero
);



wire    [1:0]   Aluop;
wire            Branch;

assign PCsrc = Branch & zero;


Main_Decoder Inst1 (
    .MemtoReg (MemtoReg),
    .MemWrite (MemWrite),
    .Branch (Branch),
    .ALUSrc (ALUSrc),
    .RegDst (RegDst),
    .RegWrite (RegWrite),
    .Jump (Jump),
    .opcode (opcode),
    .ALUOp (Aluop)
);

ALU_Decoder Inst2 (
    .Funct (Funct),
    .ALUOp (Aluop),
    .ALUControl (ALUControl)
);


endmodule