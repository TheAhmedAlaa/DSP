module Reg (
    clk,D,out,rst,ce
);
parameter Width=1;
parameter RSTTYPE="SYNC";
input [Width-1:0] D;
input clk,rst,ce;
output reg [Width-1:0] out;
generate
if (RSTTYPE=="ASYNC") begin
    always @(posedge clk or posedge rst) begin
    if (rst) begin
        out<=0;
    end
 else if(ce) out<=D;
end
end
else 
always @(posedge clk) begin
    if (rst) begin
        out<=0;
    end
 else if(ce) out<=D;
end
endgenerate
endmodule 