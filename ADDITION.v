module ADDITION(
    XOUT,ZOUT,opmode7,CIN,CYO,P
);
    input [47:0] XOUT,ZOUT;
    input  opmode7;
    input CIN;
    output  [47:0] P;
    output  CYO;
    wire [48:0] buffer;
    assign buffer = (opmode7 == 1'b0) ? (XOUT + ZOUT + CIN) : (ZOUT - XOUT - CIN);
    assign P = buffer[47:0];
    assign CYO = buffer[48];

endmodule
