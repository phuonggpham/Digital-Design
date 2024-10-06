module regfile (
    input clk, resetn,
    input [4:0] rs1, rs2, rd, // register source 1, 2; register destination
    input reg_write,
    input [31:0] write_data,
    output [31:0] read_data1, read_data2,

    input wire [31:0] core_reg_file [0:31], // Huy debug
    output [31:0] x0,
                x1,
                x2,
                x3,
                x4,
                x5,
                x6,
                x7,
                x8,
                x9,
                x10,
                x11,
                x12,
                x13,
                x14,
                x15,
                x16,
                x17,
                x18,
                x19,
                x20,
                x21,
                x22,
                x23,
                x24,
                x25,
                x26,
                x27,
                x28,
                x29,
                x30,
                x31
);
    integer i;
    reg [31:0] reg_file [0:31]; 

    // write data
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            for (i= 0; i<32; i = i+1)
                reg_file[i] <= 0;
        else if(reg_write & (rd != 0))
            reg_file[rd] <= write_data; 
    end 

    // read data
    assign read_data1 = reg_file[rs1]; // reg_file[0] hardwired to 0
    assign read_data2 = reg_file[rs2];

    assign core_reg_file = reg_file; // Huy debug
    assign x0 = reg_file[0];
    assign x1 = reg_file[1];
    assign x2 = reg_file[2];
    assign x3 = reg_file[3];
    assign x4 = reg_file[4];
    assign x5 = reg_file[5];
    assign x6 = reg_file[6];
    assign x7 = reg_file[7];
    assign x8 = reg_file[8];
    assign x9 = reg_file[9];
    assign x10 = reg_file[10];
    assign x11 = reg_file[11];
    assign x12 = reg_file[12];
    assign x13 = reg_file[13];
    assign x14 = reg_file[14];
    assign x15 = reg_file[15];
    assign x16 = reg_file[16];
    assign x17 = reg_file[17];
    assign x18 = reg_file[18];
    assign x19 = reg_file[19];
    assign x20 = reg_file[20];
    assign x21 = reg_file[21];
    assign x22 = reg_file[22];
    assign x23 = reg_file[23];
    assign x24 = reg_file[24];
    assign x25 = reg_file[25];
    assign x26 = reg_file[26];
    assign x27 = reg_file[27];
    assign x28 = reg_file[28];
    assign x29 = reg_file[29];
    assign x30 = reg_file[30];
    assign x31 = reg_file[31];

endmodule
