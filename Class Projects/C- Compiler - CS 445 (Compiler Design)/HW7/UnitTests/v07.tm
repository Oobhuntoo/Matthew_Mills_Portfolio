* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  v07.c-
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
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* LOOP FOREVER
 45:    LDA  7,1(7)	jump to start of loop 
* COMPOUND
* Compound Body
* EXPRESSION
 47:     LD  3,-2(1)	Load variable i
 48:     ST  3,-4(1)	Save left side 
 49:    LDC  3,1(6)	Load integer constant 
 50:     LD  4,-4(1)	Load left into ac1 
 51:    ADD  3,4,3	Op + 
 52:     ST  3,-2(1)	Store variable i
* EXPRESSION
* CALL output
 53:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 54:     LD  3,-2(1)	Load variable i
 55:     ST  3,-5(1)	Store parameter 
* END PARAM output
 56:    LDA  1,-3(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-53(7)	CALL output
 59:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
 60:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 61:    LDA  1,-3(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-27(7)	CALL outnl
 64:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* IF
 65:     LD  3,-2(1)	Load variable i
 66:     ST  3,-3(1)	Save left side 
 67:    LDC  3,10(6)	Load integer constant 
 68:     LD  4,-3(1)	Load left into ac1 
 69:    TEQ  3,4,3	Op == 
* THEN
* BREAK
 71:    LDA  7,-26(7)	break 
 70:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* END COMPOUND
 72:    LDA  7,-26(7)	go to beginning of loop 
 46:    LDA  7,26(7)	Jump past loop [backpatch] 
* END LOOP FOREVER
* END COMPOUND
* Add standard closing in case there is no return statement
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,76(7)	Jump to init [backpatch] 
* INIT
 77:     LD  0,0(0)	Set the global pointer 
 78:    LDA  1,0(0)	set first frame at end of globals 
 79:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-40(7)	Jump to main 
 82:   HALT  0,0,0	DONE! 
* END INIT
