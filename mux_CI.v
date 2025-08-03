module mux_CI (
    in0,in1,out
);
    parameter Width=1;
    parameter CARRYINSEL="OPMODE5";
    input [Width-1:0]in0,in1;
    output reg [Width-1:0] out;
    always @(*) begin
        case (CARRYINSEL)
        "CARRYIN":out=in0;
        "OPMODE5":out=in1;
        default:out=0;
        endcase
    end
endmodule