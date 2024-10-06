module exe_mem_reg(
    input i_clk, i_resetn, 
    // Control signals from EXE stage
    input i_exe_mem2reg, i_exe_wmem, i_exe_wreg, i_exe_lsb, i_exe_lsh, i_exe_loadsignext,
    // Data from EXE stage 
    input [4:0] i_exe_rd,
    input [31:0] i_exe_data, i_exe_dmem, 
    // Control signals to MEM stage
    output reg o_mem_mem2reg, o_mem_wmem, o_mem_wreg, o_mem_lsb, o_mem_lsh, o_mem_loadsignext,
    // Data to MEM stage
    output reg [4:0] o_mem_rd,
    output reg [31:0] o_mem_data, o_mem_dmem,
    input  instr_rvalid_i, instr_gnt_i,
    //stop core
    output reg stop_core_q
);
    wire stop_core_d;

    always @(posedge i_clk or negedge i_resetn)
    begin
        if(!i_resetn)
        begin
            // Control signals
            o_mem_mem2reg     <= 0;
            o_mem_wmem        <= 0;
            o_mem_wreg        <= 0;
            o_mem_lsb         <= 0;
            o_mem_lsh         <= 0;
            o_mem_loadsignext <= 0;
            // Data
            o_mem_data        <= 'b0;
            o_mem_rd          <= 'b0;
            o_mem_dmem        <= 'b0;
            stop_core_q       <= 'b0;
        end

        else
        begin
        // Control signals
        o_mem_mem2reg     <= i_exe_mem2reg;
        o_mem_wmem        <= i_exe_wmem;
        o_mem_wreg        <= i_exe_wreg;
        o_mem_lsb         <= i_exe_lsb;
        o_mem_lsh         <= i_exe_lsh;
        o_mem_loadsignext <= i_exe_loadsignext;
        // Data
        o_mem_data        <= i_exe_data;
        o_mem_rd          <= i_exe_rd;
        o_mem_dmem        <= i_exe_dmem;
        //stop core
        stop_core_q       <= stop_core_d;
        end
    end
    always@(i_exe_mem2reg or i_exe_wmem or i_exe_wreg or i_exe_lsb or i_exe_lsh or i_exe_loadsignext or i_exe_rd or i_exe_data or i_exe_dmem or instr_rvalid_i or instr_gnt_i) 
    begin
        stop_core_d = stop_core_q;
        if ((o_mem_data > 32'h20000) & (o_mem_data < 32'h20FFF) & (o_mem_wmem == 1) & (o_mem_dmem != 0)) 
        begin
            stop_core_d = 1'b1; 
        end
    end



endmodule
