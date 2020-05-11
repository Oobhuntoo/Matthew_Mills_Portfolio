* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  v05.c-
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    LDA  7,0(3)	Return 
* END FUNCTION input
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:    LDC  2,0(6)	Set return to 0 
 10:     LD  3,-1(1)	Load return address 
 11:     LD  1,0(1)	Adjust fp 
 12:    LDA  7,0(3)	Return 
* END FUNCTION output
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputb
 13:     ST  3,-1(1)	Store return address 
 14:    INB  2,2,2	Grab bool input 
 15:     LD  3,-1(1)	Load return address 
 16:     LD  1,0(1)	Adjust fp 
 17:    LDA  7,0(3)	Return 
* END FUNCTION inputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputb
 18:     ST  3,-1(1)	Store return address 
 19:     LD  3,-2(1)	Load parameter 
 20:   OUTB  3,3,3	Output bool 
 21:    LDC  2,0(6)	Set return to 0 
 22:     LD  3,-1(1)	Load return address 
 23:     LD  1,0(1)	Adjust fp 
 24:    LDA  7,0(3)	Return 
* END FUNCTION outputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputc
 25:     ST  3,-1(1)	Store return address 
 26:    INC  2,2,2	Grab char input 
 27:     LD  3,-1(1)	Load return address 
 28:     LD  1,0(1)	Adjust fp 
 29:    LDA  7,0(3)	Return 
* END FUNCTION inputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputc
 30:     ST  3,-1(1)	Store return address 
 31:     LD  3,-2(1)	Load parameter 
 32:   OUTC  3,3,3	Output char 
 33:    LDC  2,0(6)	Set return to 0 
 34:     LD  3,-1(1)	Load return address 
 35:     LD  1,0(1)	Adjust fp 
 36:    LDA  7,0(3)	Return 
* END FUNCTION outputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outnl
 37:     ST  3,-1(1)	Store return address 
 38:  OUTNL  3,3,3	Output a newline 
 39:     LD  3,-1(1)	Load return address 
 40:     LD  1,0(1)	Adjust fp 
 41:    LDA  7,0(3)	Return 
* END FUNCTION outnl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* LOOP
 43:    LDC  3,3(6)	Load integer constant 
 44:    LDC  4,0(6)	Load 0 
 45:    SUB  3,4,3	Op unary - 
 46:     ST  3,-2(1)	save starting value in index variable 
 47:    LDC  3,10(6)	Load integer constant 
 48:    LDC  4,0(6)	Load 0 
 49:    SUB  3,4,3	Op unary - 
 50:     ST  3,-3(1)	save ending value 
 51:    LDC  3,1(6)	Load integer constant 
 52:    LDC  4,0(6)	Load 0 
 53:    SUB  3,4,3	Op unary - 
 54:     ST  3,-4(1)	save increment values 
 55:     LD  4,-2(1)	loop index 
 56:     LD  5,-3(1)	ending value 
 57:     LD  3,-4(1)	increment value 
 58:    SLT  3,4,5	Op < 
 59:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
 61:     ST  1,-5(1)	Store fp in ghost frame for output
* PARAM 1
 62:     LD  3,-2(1)	Load variable i
 63:     ST  3,-7(1)	Store parameter 
* END PARAM output
 64:    LDA  1,-5(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP INC AND JMP
 68:     LD  3,-2(1)	Load index 
 69:     LD  5,-4(1)	Load increment 
 70:    ADD  3,3,5	increment 
 71:     ST  3,-2(1)	store into index 
 72:    LDA  7,-18(7)	go to beginning of loop 
 60:    LDA  7,12(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL output
 73:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 74:    LDC  3,666(6)	Load integer constant 
 75:     ST  3,-4(1)	Store parameter 
* END PARAM output
 76:    LDA  1,-2(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,83(7)	Jump to init [backpatch] 
* INIT
 84:     LD  0,0(0)	Set the global pointer 
 85:    LDA  1,0(0)	set first frame at end of globals 
 86:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-47(7)	Jump to main 
 89:   HALT  0,0,0	DONE! 
* END INIT
