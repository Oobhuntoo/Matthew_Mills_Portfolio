* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyArray.c-
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
 43:    LDC  3,22(6)	load size of array b
 44:     ST  3,-2(1)	save size of array b
* Compound Body
* EXPRESSION
 45:    LDA  3,-13(0)	Load address of base of array c
 46:     ST  3,-25(1)	Save left side 
 47:    LDC  3,22(6)	Load integer constant 
 48:     LD  4,-25(1)	Load left into ac1 
 49:    SUB  3,4,3	compute location from index 
 50:     LD  3,0(3)	Load array element 
* EXPRESSION
 51:    LDC  3,999(6)	Load integer constant 
* EXPRESSION
* CALL output
 52:     ST  1,-25(1)	Store fp in ghost frame for output
* PARAM 1
 53:    LDA  3,-1(0)	Load address of base of array a
 54:     LD  3,1(3)	Load array size 
 55:     ST  3,-27(1)	Store parameter 
* END PARAM output
 56:    LDA  1,-25(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-53(7)	CALL output
 59:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
 60:     ST  1,-25(1)	Store fp in ghost frame for output
* PARAM 1
 61:    LDA  3,-3(1)	Load address of base of array b
 62:     LD  3,1(3)	Load array size 
 63:     ST  3,-27(1)	Store parameter 
* END PARAM output
 64:    LDA  1,-25(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
 68:     ST  1,-25(1)	Store fp in ghost frame for output
* PARAM 1
 69:    LDA  3,-13(0)	Load address of base of array c
 70:     LD  3,1(3)	Load array size 
 71:     ST  3,-27(1)	Store parameter 
* END PARAM output
 72:    LDA  1,-25(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6)	Set return value to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,79(7)	Jump to init [backpatch] 
* INIT
 80:     LD  0,0(0)	Set the global pointer 
 81:    LDA  1,-46(0)	set first frame at end of globals 
 82:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 83:    LDC  3,11(6)	load size of array a
 84:     ST  3,0(0)	save size of array a
 85:    LDC  3,33(6)	load size of array c
 86:     ST  3,-12(0)	save size of array c
* END INIT GLOBALS AND STATICS
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-47(7)	Jump to main 
 89:   HALT  0,0,0	DONE! 
* END INIT
