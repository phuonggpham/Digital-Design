module if_id_reg(
    input i_clk, i_resetn, i_we, i_flush,
    input [31:0] i_if_p4, i_if_pc, i_if_instr,
    output reg  [31:0] o_id_p4, o_id_pc, 
    output reg [31:0] o_id_instr
);

    reg [31:0] id_instr;

    always @(posedge i_clk or negedge i_resetn)
    begin
        if(!i_resetn)
        begin
            o_id_p4    <= 1'b0;
            o_id_pc    <= 1'b0;
            o_id_instr <= 1'b0;
        end

        else if ((i_flush == 1) & (i_if_instr[6:0] != 7'b0010111))
        begin
            o_id_p4    <= 1'b0;
            o_id_pc    <= 1'b0; 
            o_id_instr <= 32'h00007013; // andi x0, x0, 0
        end

        else
        begin
            if(i_we)
            begin
                o_id_p4    <= i_if_p4;
                o_id_pc    <= i_if_pc;
                o_id_instr <= i_if_instr;
            end
        end
    end

    // assign o_id_instr = (i_flush) ? 32'h00007013 : id_instr; // if flush -> andi x0, x0, 0 | else -> id instr gets if instr

endmodule
