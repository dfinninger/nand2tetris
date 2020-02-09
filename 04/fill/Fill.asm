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

// LOOP:
//   @SCREEN
//   D=M
//   JEQ CLEAR
//   JMP FILL
//
// CLEAR:
//   @SCREEN
//   M=0
//   JMP LOOP
//
// FILL:
//   @SCREEN
//   M=-1
//   JMP LOOP

// Clear register and set a definite initial value
@fill_value
M=0

// current address holder
@address
M=0

// Main Program loop
// ==================
(MAINLOOP)
@KBD
D=M // load key pressed
@CLEAR
D;JEQ // clear if zero
@FILL
D;JNE // fill if not zero

// Set our register to 0's
// ========================
(CLEAR)
@fill_value
M=0
@APPLY
0;JMP

// Set our register to 1's
// ========================
(FILL)
@fill_value
M=-1
@APPLY
0;JMP

// Apply the "color" to the screen
// ================================
(APPLY)
// set our address pointer to the initial position of the screen
@SCREEN
D=A
@address
M=D

// Inner loop that traverses the SCREEN space
// ===========================================
(APPLYLOOP)
// decide whether or not to loop
@address
D=M
@KBD // KBD is the end of the SCREEN space
D=A-D // diff = screen_end - address

// if diff == 0; goto MAINLOOP (we've reached the end of the screen space)
@MAINLOOP
D;JEQ

@fill_value
D=M // load the chosen "color"
@address
A=M // access the pointer
M=D // apply the "color" to the word

// increment the address position
@1
D=A
@address
M=M+D

@APPLYLOOP
0;JMP // keep looping
