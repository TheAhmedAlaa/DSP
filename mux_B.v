module mux_B (
    in0,in1,out
);
    parameter Width=1;
    parameter B_INPUT="DIRECT";
    input [Width-1:0]in0,in1;
    output reg [Width-1:0] out;
    always @(*) begin
        case (B_INPUT)
        "DIRECT":out=in0;
        "CASCADE":out=in1;
        default:out=0;
        endcase
    end
endmodule