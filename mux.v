module mux (
    in0,in1,sel,out
);
    parameter Width=1;
    input [Width-1:0]in0,in1;
    input sel;
    output [Width-1:0] out;
    assign out = sel? in1:in0;
endmodule