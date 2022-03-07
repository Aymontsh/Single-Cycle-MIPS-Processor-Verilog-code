
/*
// Module: Datapath.v
// Description: Datapath verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module Datapath

#(parameter datasize = 32)

(
    output  wire    [datasize-1:0]     Pc,ALUout,WriteData,
    output  wire                       zero,
    input   wire    [datasize-1:0]     RD_inst,RD_Data,
    input   wire                       clk,reset,
    input   wire                       MemtoReg,ALUSrc,RegDst,RegWrite,Jump,PCSrc,
    input   wire    [2:0]              ALUcontrol
    
);

wire    [datasize-1:0]     SrcA,SrcB,RD2;
wire    [datasize-1:0]     instr;
wire    [4:0]              outmux_A3;
wire    [datasize-1:0]     outmux_WD3;
wire    [datasize-1:0]     SignImm,shiftout_inst6;   
wire    [datasize-1:0]     PCBranch,PCPlus4;
wire    [27:0]             PCjump;
wire    [datasize-1:0]     currentpc,outmux_inst11;



Register_file inst1 (

    .readData1 (SrcA),
    .readData2 (WriteData),
    .writeData (outmux_WD3),
    .readAddr1 (RD_inst[25:21]),
    .readAddr2 (RD_inst[20:16]),
    .writeAddr (outmux_A3),
    .writeEnable (RegWrite),
    .clk (clk),
    .reset (reset)

);

ALU inst2 (

    .ALUResult (ALUout),
    .Zero_flag (zero),
    .SrcA (SrcA),
    .SrcB (SrcB),
    .ALUcontrol (ALUcontrol)
);

mux inst3 (

    .data_in1 (WriteData),
    .data_in2 (SignImm),
    .data_out (SrcB),
    .sel (ALUSrc)

);

mux #(.data_size(5)) inst4 (

    .data_in1 (RD_inst[20:16]),
    .data_in2 (RD_inst[15:11]),
    .data_out (outmux_A3),
    .sel (RegDst)

);


Sign_Extend inst5 (

    .SignImm (SignImm),
    .Instr (RD_inst[15:0])
);


shift_left_twice inst6 (

    .data_out (shiftout_inst6),
    .data_in  (SignImm)

);

Adder inst7 (

    .C (PCBranch),
    .A (shiftout_inst6),
    .B (PCPlus4)

);

shift_left_twice #(.data_size(28)) inst8 (

    .data_out (PCjump),
    .data_in  ({{2{1'b0}},RD_inst[25:0]})
);

Adder inst9 (

    .C (PCPlus4),
    .A (Pc),
    .B (32'd4)
);

program_counter inst10 (

    .PC_out (Pc),
    .PC_in (currentpc),
    .clk (clk),
    .reset (reset)
);

mux inst11 (

    .data_in1 (PCPlus4),
    .data_in2 (PCBranch),
    .data_out (outmux_inst11),
    .sel (PCSrc)
);

mux inst12 (

    .data_in1 (outmux_inst11),
    .data_in2 ({PCPlus4[31:28],PCjump}),
    .data_out (currentpc),
    .sel (Jump)
);

mux inst13 (

    .data_in1 (ALUout),
    .data_in2 (RD_Data),
    .data_out (outmux_WD3),
    .sel (MemtoReg)

);


endmodule