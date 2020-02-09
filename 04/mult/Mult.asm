// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// i = 0
// product = 0
//
// LOOP:
//   if i > R1; goto end
//   product = product + R0
//   goto LOOP
//
// END:
//   goto END
//

@i
M=1

@product
M=0

(LOOP)
// Check if we should end the program
@i
D=M // D=i
@R1
D=D-M // D=i-R1
@ASSIGN
D;JGT // if (i=R1)>0 goto END

// Add the number to the product
@R0
D=M // D=R0
@product
M=D+M // product = product + R0

// Increment the counter
@i
M=M+1 // i=i+1
@LOOP
0;JMP

(ASSIGN)
@product
D=M
@R2
M=D

(END)
@END