`include "soma.v"
`include "multiplica.v"

module ULA( // MUX com entradas A e B e saída C;
            // Retorna C = A+B se o seletor for 0. 
            // Retorna C = A*B se o seletor for 1;
            // Retorna o sinal de overflow para a operação de soma;

    input [15:0] A,B,
    input [0:0] SEL,
    output [15:0] C,
    output [0:0] overflow

);

    wire [15:0] D,E;
    wire [0:0] F,G;
    SOMA s0(A,B,D,overflow);
    multiplica m0(A,B,E);
    mux2x1_16b mux0(D,E,SEL,C);

endmodule
