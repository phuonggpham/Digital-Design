module adder (
    input [31:0] a, b,
    input stop_core,
    output reg [31:0] sum
);
always@(*) begin
    if (stop_core) sum = a;
    else sum = a + b;
end

endmodule