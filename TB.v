module TB ();
reg [17:0] A,B,D;
reg [47:0] C,PCIN;
reg [7:0] opmode_b;
reg clk,carryin,BCIN,RSTA,RSTB,RSTP,RSTM,RSTC,RSTD,RSTCARRYIN,RSTOPMODE
,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE;
wire [47:0] PCOUT,P;
wire [17:0] BCOUT;
wire [35:0] M;
wire CARRYOUT,CARRYOUTF;
integer i;
main DUT(A,B,C,D,clk,carryin,opmode_b,BCIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,
CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE,PCIN,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);
initial begin
    clk=0;
    forever 
    #1 clk=~clk;
end
initial begin
    RSTA=1;
    RSTB=1;
    RSTC=1;
    RSTCARRYIN=1;
    RSTD=1;
    RSTM=1;
    RSTOPMODE=1;
    RSTP=1;
    for (i=0; i<30; i=i+1) begin
    A=$random;
    B=$random;
    D=$random;
    C=$random;
    carryin=$random;
    opmode_b=$random;
    BCIN=$random;
    CEA=$random;
    CEB=$random;
    CEM=$random;
    CEP=$random;
    CEC=$random;
    CED=$random;
    CECARRYIN=$random;
    CEOPMODE=$random;
    PCIN=$random;
    @(negedge clk);
    if (~BCOUT&~PCOUT&~P&~M&~CARRYOUT&~CARRYOUTF) $display("Correct 2.1 TB");
    else $display ("Wrong 2.1 TB");
    end
    for(i=0;i<30;i=i+1) begin
    RSTA=0;
    RSTB=0;
    RSTC=0;
    RSTCARRYIN=0;
    RSTD=0;
    RSTM=0;
    RSTOPMODE=0;
    RSTP=0;
    CEA=1;
    CEB=1;
    CEM=1;
    CEP=1;
    CEC=1;
    CED=1;
    CECARRYIN=1;
    CEOPMODE=1;
    opmode_b=8'b11011101;
    A=18'd20;
    B=18'd10;
    D=18'd25;
    C=48'd350;
    carryin=$random;
    BCIN=$random;
    PCIN=$random;  
    repeat(4) @(negedge clk);
    if (BCOUT=='hf &&M=='h12c && P=='h32 && PCOUT=='h32 && ~CARRYOUT && ~CARRYOUTF ) $display ("Correct 2.2 TB");
    else $display ("Wrong 2.2 TB ");
    end
    for(i=0;i<30;i=i+1) begin
    RSTA=0;
    RSTB=0;
    RSTC=0;
    RSTCARRYIN=0;
    RSTD=0;
    RSTM=0;
    RSTOPMODE=0;
    RSTP=0;
    CEA=1;
    CEB=1;
    CEM=1;
    CEP=1;
    CEC=1;
    CED=1;
    CECARRYIN=1;
    CEOPMODE=1;
    opmode_b=8'b00010000;
    A=18'd20;
    B=18'd10;
    D=18'd25;
    C=48'd350;
    carryin=$random;
    BCIN=$random;
    PCIN=$random;  
    repeat(3) @(negedge clk);
    if (BCOUT=='h23 &&M=='h2bc && P==0 && PCOUT==0 && ~CARRYOUT && ~CARRYOUTF ) $display ("Correct 2.3 TB");
    else $display ("Wrong 2.3 TB ");
    end
    for(i=0;i<30;i=i+1) begin
    RSTA=0;
    RSTB=0;
    RSTC=0;
    RSTCARRYIN=0;
    RSTD=0;
    RSTM=0;
    RSTOPMODE=0;
    RSTP=0;
    CEA=1;
    CEB=1;
    CEM=1;
    CEP=1;
    CEC=1;
    CED=1;
    CECARRYIN=1;
    CEOPMODE=1;
    opmode_b=8'b00001010;
    A=18'd20;
    B=18'd10;
    D=18'd25;
    C=48'd350;
    carryin=$random;
    BCIN=$random;
    PCIN=$random;  
    repeat(3) @(negedge clk);
    if (BCOUT=='ha &&M=='hc8 && P==PCOUT && CARRYOUT==CARRYOUTF ) $display ("Correct 2.4 TB");
    else $display ("Wrong 2.4 TB ");
    end
    for(i=0;i<30;i=i+1) begin
    RSTA=0;
    RSTB=0;
    RSTC=0;
    RSTCARRYIN=0;
    RSTD=0;
    RSTM=0;
    RSTOPMODE=0;
    RSTP=0;
    CEA=1;
    CEB=1;
    CEM=1;
    CEP=1;
    CEC=1;
    CED=1;
    CECARRYIN=1;
    CEOPMODE=1;
    opmode_b=8'b10100111;
    A=18'd5;
    B=18'd6;
    D=18'd25;
    C=48'd350;
    carryin=$random;
    BCIN=$random;
    PCIN=3000;  
    repeat(3) @(negedge clk);
    if (BCOUT=='h6 &&M=='h1e && P=='hfe6fffec0bb1 && PCOUT=='hfe6fffec0bb1 && CARRYOUT&& CARRYOUTF ) $display ("Correct 2.5 TB");
    else $display ("Wrong 2.5 TB ");
    end
    end
    
endmodule