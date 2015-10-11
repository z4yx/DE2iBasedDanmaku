`timescale 1 us/ 1 us

module scdt_test(

);

wire scdt;
reg de,odck,rst;

tfp401a tfp401a_inst(
    .rst(rst),
    .odck_in(odck),
    .de_in(de),
    .scdt_o(scdt)
);

reg inactive;
initial begin
rst=0;
odck=0;
de=0;
inactive=0;
#10 rst=1;
#40000 inactive=1;
end

always begin
    if(!inactive) begin
        #1600 de=1;
        #1600 de=0;
    end
end

always begin
    #1 odck = ~odck;
end
endmodule