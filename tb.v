`timescale 1ns/1ps

module tb();

reg [3:0] num1;
reg [3:0] num2;
wire [3:0] out;
wire cout;

add u0 (
    .num1 (num1),
    .num2 (num2),
    .out  (out),
    .cout (cout)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    // Teste 1: 0 + 0 = 0
    num1 = 4'b0000;
    num2 = 4'b0000;
    #10;
    if (out == 4'b0000 && cout == 1'b0) begin
        $display("Teste 1 (0+0): OK");
    end else begin
        $display("Teste 1 (0+0): ERRO - Esperado out=0, cout=0, Obtido out=%b, cout=%b", out, cout);
    end

    // Teste 2: 1 + 1 = 2
    num1 = 4'b0001;
    num2 = 4'b0001;
    #10;
    if (out == 4'b0010 && cout == 1'b0) begin
        $display("Teste 2 (1+1): OK");
    end else begin
        $display("Teste 2 (1+1): ERRO - Esperado out=2, cout=0, Obtido out=%b, cout=%b", out, cout);
    end

    // Teste 3: 5 + 3 = 8
    num1 = 4'b0101;
    num2 = 4'b0011;
    #10;
    if (out == 4'b1000 && cout == 1'b0) begin
        $display("Teste 3 (5+3): OK");
    end else begin
        $display("Teste 3 (5+3): ERRO - Esperado out=8, cout=0, Obtido out=%b, cout=%b", out, cout);
    end

    // Teste 4: 15 + 1 = 0 (com carry out)
    num1 = 4'b1111;
    num2 = 4'b0001;
    #10;
    if (out == 4'b0000 && cout == 1'b1) begin
        $display("Teste 4 (15+1): OK");
    end else begin
        $display("Teste 4 (15+1): ERRO - Esperado out=0, cout=1, Obtido out=%b, cout=%b", out, cout);
    end

    // Teste 5: 7 + 8 = 15
    num1 = 4'b0111;
    num2 = 4'b1000;
    #10;
    if (out == 4'b1111 && cout == 1'b0) begin
        $display("Teste 5 (7+8): OK");
    end else begin
        $display("Teste 5 (7+8): ERRO - Esperado out=15, cout=0, Obtido out=%b, cout=%b", out, cout);
    end

    // Teste 6: 10 + 10 = 4 (com carry out)
    num1 = 4'b1010;
    num2 = 4'b1010;
    #10;
    if (out == 4'b0100 && cout == 1'b1) begin
        $display("Teste 6 (10+10): OK");
    end else begin
        $display("Teste 6 (10+10): ERRO - Esperado out=4, cout=1, Obtido out=%b, cout=%b", out, cout);
    end

    $finish;
end

endmodule
