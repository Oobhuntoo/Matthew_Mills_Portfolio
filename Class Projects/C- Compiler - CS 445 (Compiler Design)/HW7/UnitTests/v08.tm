* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  v08.c-
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
* EXPRESSION
 43:    LDC  3,723(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* LOOP
 45:    LDC  3,0(6)	Load integer constant 
 46:     ST  3,-3(1)	save starting value in index variable 
 47:    LDC  3,50(6)	Load integer constant 
 48:     ST  3,-4(1)	save ending value 
 49:    LDC  3,7(6)	Load integer constant 
 50:     ST  3,-5(1)	save increment values 
 51:     LD  4,-3(1)	loop index 
 52:     LD  5,-4(1)	ending value 
 53:     LD  3,-5(1)	increment value 
 54:    SLT  3,4,5	Op < 
 55:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 57:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
 58:     LD  3,-3(1)	Load variable i
 59:     ST  3,-8(1)	Store parameter 
* END PARAM output
 60:    LDA  1,-6(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
 64:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 65:    LDA  1,-6(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-31(7)	CALL outnl
 68:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* LOOP INC AND JMP
 69:     LD  3,-3(1)	Load index 
 70:     LD  5,-5(1)	Load increment 
 71:    ADD  3,3,5	increment 
 72:     ST  3,-3(1)	store into index 
 73:    LDA  7,-23(7)	go to beginning of loop 
 56:    LDA  7,17(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL output
 74:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 75:     LD  3,-2(1)	Load variable i
 76:     ST  3,-5(1)	Store parameter 
* END PARAM output
 77:    LDA  1,-3(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
 81:    LDC  2,0(6)	Set return value to 0 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,84(7)	Jump to init [backpatch] 
* INIT
 85:     LD  0,0(0)	Set the global pointer 
 86:    LDA  1,0(0)	set first frame at end of globals 
 87:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-48(7)	Jump to main 
 90:   HALT  0,0,0	DONE! 
* END INIT
