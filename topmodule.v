

/*
// Module: topmodule.v
// Description: Top Module verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module topmodule 

#(parameter datasize = 32)
(
    output      wire      [15:0]    testvalue,
    input       wire                clk,reset
);

wire    [datasize-1:0]     PC,ALU_OUT,Write_Data,RD_Data,RD_instruction;
wire                       MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump,zero,PCSrc;
wire    [2:0]              ALUcontrol;
wire    [1:0]              ALUOP;
wire    [5:0]              OPcode,Funct;


Datapath inst_datapath (

    .Pc (PC),
    .ALUout (ALU_OUT),
    .WriteData (Write_Data),
    .clk (clk),
    .reset(reset),
    .RD_inst (RD_instruction),
    .RD_Data (RD_Data),
    .MemtoReg(MemtoReg),
    .ALUSrc (ALUSrc),
    .RegDst (RegDst),
    .RegWrite (RegWrite),
    .Jump (Jump),
    .zero (zero),
    .PCSrc(PCSrc),
    .ALUcontrol (ALUcontrol)
);

Instruction_memory instr_mem (

    .dout (RD_instruction),
    .addr (PC)
);

Data_memory data_mem (

    .RD (RD_Data),
    .test_value (testvalue),
    .clk (clk),
    .reset (reset),
    .WE (MemWrite),
    .WD (Write_Data),
    .A (ALU_OUT)
);

control_unit contUnit (

    .MemtoReg (MemtoReg),
    .MemWrite (MemWrite),
    .PCsrc (PCSrc),
    .zero(zero),
    .ALUSrc (ALUSrc),
    .RegDst (RegDst),
    .RegWrite (RegWrite),
    .Jump (Jump),
    .ALUControl (ALUcontrol),
    .Funct (RD_instruction[5:0]),
    .opcode (RD_instruction[31:26])

);


endmodule