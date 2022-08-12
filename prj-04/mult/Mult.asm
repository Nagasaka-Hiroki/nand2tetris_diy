// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//R0とR1に値が格納されている。
//それぞれRAMの最初と2番目に格納されている。

//現在のCPUはメモリとメモリの演算はできない。
//ゆえにメモリの内容を片方レジスタに代入する必要がある。
//R0,R1は入力
//R2は出力

//出力を0に明示的にしておく（この後足していくので）
    @R2
    M=0
//どちらかが0ならいきなりENDに飛ぶ
    @R0
    D=M
    @END
    D;JEQ
    @R1
    D=M
    @END
    D;JEQ

//絶対値を計算する
    //R0の絶対値をR3に格納する。
    @R0
    D=M
    @ABS_R0
    D;JLT
    @R3
    M=D
    @GOTO_R1
    0;JMP
(ABS_R0)
    D=-D
    @R3
    M=D
(GOTO_R1)
    //R1の絶対値をR4に格納する。
    @R1
    D=M
    @ABS_R1
    D;JLT
    @R4
    M=D
    @GOTO_LOOP
    0;JMP
(ABS_R1)
    D=-D
    @R4
    M=D
(GOTO_LOOP)

//この段階では、すべての数が正の数になっているので、正×正の演算をする。
(LOOP)
    @R4
    D=M
    @SIGN
    D;JEQ

//R4が0になるまで足し続ける。
    @R3
    D=M
    @R2
    M=D+M
    @R4
    M=M-1
    @LOOP
    0;JMP

//符号をつける
(SIGN)
    @R0
    D=M
    @NEXT_SIGN
    D;JGE
    @R2
    M=-M
(NEXT_SIGN)
    @R1
    D=M
    @END
    D;JGE
    @R2
    M=-M
//Hackコンピュータでは最後は無限ループにする。
(END)
    @END
    0;JMP