module block (
    in,out,clk,rst,ce,sel
);
input clk,rst,ce,sel;
parameter Width = 1;
parameter RSTTYPE = "SYNC";
input [Width-1:0] in;
output [Width-1:0] out;
wire [Width-1:0] reg_out;
Reg #(.Width(Width),.RSTTYPE(RSTTYPE)) M_REG(.clk(clk),.D(in),.rst(rst),.out(reg_out),.ce(ce));
mux #(.Width(Width)) reg_mux(.in0(in),.in1(reg_out),.sel(sel),.out(out));

endmodule //block