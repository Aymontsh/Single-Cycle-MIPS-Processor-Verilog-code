
/*
// Module: Data_memory.v
// Description: Data memory verilog code //
// Owner : Mohamed Ayman
// Date :  March 2022
*/

module Data_memory
#(parameter memory_width = 32, parameter memory_depth = 100)
(
    output  reg    [memory_width-1:0]       RD,
    output  reg    [(memory_width/2)-1:0]   test_value,
    input   wire                            clk,reset,WE, 
    input   wire   [memory_width-1:0]       WD,A
);

reg   [memory_width-1:0]   RAM  [memory_depth-1:0];
integer i;

always @( posedge clk or negedge reset)

    begin
        if ( ! reset )
            begin
                for( i=0 ; i<memory_depth ; i=i+1)  
                    RAM[i] <= { (memory_width) {1'b0} };
            end
        else if ( WE )
            begin
                RAM [A] <= WD;
            end
    end

always @(*)
    begin
        RD = RAM [A];
        test_value = RAM [{ (memory_width) {1'b0} }];
    end
endmodule 