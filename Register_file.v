

/*
// Module: Register_file.v
// Description: Register file verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module Register_file 
#(parameter memory_width  = 32,  parameter memory_depth  = 100, parameter register_num = 32) 
( 
    output wire  [memory_width-1:0]            readData1, readData2,
    input  wire  [memory_width-1:0]            writeData,
    input  wire  [$clog2 (register_num)-1:0]   readAddr1, readAddr2, writeAddr,
    input  wire                                writeEnable, 
    input  wire                                clk, reset
);

reg [memory_width-1:0] MEM [memory_depth-1:0];
integer i;

always @ (posedge clk or negedge reset)
    begin
        if (!reset)
            begin 
                for (i=0; i<memory_depth; i=i+1)
                    begin
                        MEM [i] <= { (memory_width) {1'b0} };
                    end
            end
        else if (writeEnable) 
            begin
                MEM[writeAddr] <= writeData;
            end
    end 
assign readData1 = MEM[readAddr1];
assign readData2 = MEM[readAddr2];

endmodule