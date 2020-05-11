* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  v01.c-
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
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-2(1)	save starting value in index variable 
 45:    LDC  3,1(6)	Load integer constant 
 46:     ST  3,-3(1)	save ending value 
 47:    LDC  3,1(6)	Load integer constant 
 48:     ST  3,-4(1)	save increment values 
 49:     LD  4,-2(1)	loop index 
 50:     LD  5,-3(1)	ending value 
 51:     LD  3,-4(1)	increment value 
 52:    SLT  3,4,5	Op < 
 53:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
 55:     ST  1,-5(1)	Store fp in ghost frame for output
* PARAM 1
 56:     LD  3,-2(1)	Load variable i
 57:     ST  3,-7(1)	Store parameter 
* END PARAM output
 58:    LDA  1,-5(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP INC AND JMP
 62:     LD  3,-2(1)	Load index 
 63:     LD  5,-4(1)	Load increment 
 64:    ADD  3,3,5	increment 
 65:     ST  3,-2(1)	store into index 
 66:    LDA  7,-18(7)	go to beginning of loop 
 54:    LDA  7,12(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL output
 67:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 68:    LDC  3,666(6)	Load integer constant 
 69:     ST  3,-4(1)	Store parameter 
* END PARAM output
 70:    LDA  1,-2(1)	Load address of new frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    LDA  7,-67(7)	CALL output
 73:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,77(7)	Jump to init [backpatch] 
* INIT
 78:     LD  0,0(0)	Set the global pointer 
 79:    LDA  1,0(0)	set first frame at end of globals 
 80:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-41(7)	Jump to main 
 83:   HALT  0,0,0	DONE! 
* END INIT
