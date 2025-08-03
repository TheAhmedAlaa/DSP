module mux_4 (
    in0,in1,in2,in3,sel,out
);
parameter Width=1;
input [Width-1:0]in0,in1,in2,in3;
output reg [Width-1:0] out;
input [1:0]sel;
always @(*) begin
    case (sel)
        2'b00:out=in0;
        2'b01:out=in1;
        2'b10:out=in2;
        2'b11:out=in3;
    endcase
end
endmodule 