// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//実装の方針入力があれば画面を黒く塗る
//入力がない状態は'\0'(Asciiコードからそう思ったがあってる？)であるはずなので、0か非ゼロで判定して処理する。
//キーボード入力はRAM[24576]に現れる。
//スクリーンの先頭アドレスは16384で

//無限ループではさむ
(LOOP)
//キーボード入力を受け付ける
    @KBD
    D=M
    @BLACK
    D;JNE
    @R0
    M=0
    @PRINT
    0;JMP
(BLACK)
    @R0
    M=-1

(PRINT)
//スクリーンの先頭アドレスをR1にメモする
//スクリーンを塗る色はR0にメモしてある
    @SCREEN
    D=A
    @R1
    M=D
(print_loop)
//色を取得する
    @R0
    D=M
//描画するスクリーンの画素を取得し色を塗る
    @R1
    A=M
    M=D
//スクリーンのアドレスを1つ進め、その結果をR1に保存して更新する
    @R1
    M=M+1
//スクリーンの末尾の番号と引く
    @R1
    D=M
    @KBD
    D=D-A
    @print_loop
    D;JLT

//繰り返す
    @LOOP
    0;JMP