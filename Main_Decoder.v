
/*
// Module: Main_Decoder.v
// Description: Main Decoder verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module Main_Decoder (
    output  reg              MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump,
    output  reg     [1:0]    ALUOp,          
    input   wire    [5:0]    opcode
);
always @ (*)
begin
    case (opcode)
    // load word 
        6'b100011 :
                     begin 
                         Jump       = 1'b0;
                         ALUOp      = 2'b00;
                         MemWrite   = 1'b0;
                         RegWrite   = 1'b1;
                         RegDst     = 1'b0;
                         ALUSrc     = 1'b1;
                         MemtoReg   = 1'b1;
                         Branch     = 1'b0;
                     end
    // store word 
        6'b101011 :
                     begin 
                         Jump       = 1'b0;
                         ALUOp      = 2'b00;
                         MemWrite   = 1'b1;
                         RegWrite   = 1'b0;
                         RegDst     = 1'b0;
                         ALUSrc     = 1'b1;
                         MemtoReg   = 1'b1;
                         Branch     = 1'b0;
                     end
    // R Type 
        6'b000000 :
                     begin 
                         Jump       = 1'b0;
                         ALUOp      = 2'b10;
                         MemWrite   = 1'b0;
                         RegWrite   = 1'b1;
                         RegDst     = 1'b1;
                         ALUSrc     = 1'b0;
                         MemtoReg   = 1'b0;
                         Branch     = 1'b0;
                     end
   // Add Immediate
        6'b001000 :
                     begin 
                         Jump       = 1'b0;
                         ALUOp      = 2'b00;
                         MemWrite   = 1'b0;
                         RegWrite   = 1'b1;
                         RegDst     = 1'b0;
                         ALUSrc     = 1'b1;
                         MemtoReg   = 1'b0;
                         Branch     = 1'b0;
                     end
   // branch if equal
        6'b000100 :
                     begin 
                         Jump       = 1'b0;
                         ALUOp      = 2'b01;
                         MemWrite   = 1'b0;
                         RegWrite   = 1'b0;
                         RegDst     = 1'b0;
                         ALUSrc     = 1'b0;
                         MemtoReg   = 1'b0;
                         Branch     = 1'b1;
                     end
   // jump_inst
        6'b000010 :
                     begin 
                         Jump       = 1'b1;
                         ALUOp      = 2'b00;
                         MemWrite   = 1'b0;
                         RegWrite   = 1'b0;
                         RegDst     = 1'b0;
                         ALUSrc     = 1'b0;
                         MemtoReg   = 1'b0;
                         Branch     = 1'b0;
                     end 
   // default
        default :
                     begin 
                         Jump       = 1'b0;
                         ALUOp      = 2'b00;
                         MemWrite   = 1'b0;
                         RegWrite   = 1'b0;
                         RegDst     = 1'b0;
                         ALUSrc     = 1'b0;
                         MemtoReg   = 1'b0;
                         Branch     = 1'b0;
                     end        
    endcase
end
endmodule