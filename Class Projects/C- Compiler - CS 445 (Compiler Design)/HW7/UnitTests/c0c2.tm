* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  c0c2.c-
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
 43:    LDC  3,65(6)	Load char constant 
 44:     ST  3,-2(1)	Store variable x
* EXPRESSION
 45:    LDC  3,66(6)	Load char constant 
 46:     ST  3,-3(1)	Store variable y
* EXPRESSION
* CALL outputc
 47:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 48:     LD  3,-2(1)	Load variable x
 49:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 50:    LDA  1,-5(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-23(7)	CALL outputc
 53:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputc
 54:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 55:     LD  3,-3(1)	Load variable y
 56:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 57:    LDA  1,-5(1)	Load address of new frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    LDA  7,-30(7)	CALL outputc
 60:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputc
 61:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 62:     LD  3,-3(1)	Load variable y
 63:     ST  3,-2(1)	Store variable x
 64:     ST  3,-4(1)	Store variable z
 65:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 66:    LDA  1,-5(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-39(7)	CALL outputc
 69:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputc
 70:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 71:     LD  3,-2(1)	Load variable x
 72:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 73:    LDA  1,-5(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-46(7)	CALL outputc
 76:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputc
 77:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 78:     LD  3,-3(1)	Load variable y
 79:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 80:    LDA  1,-5(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-53(7)	CALL outputc
 83:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputc
 84:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 85:     LD  3,-4(1)	Load variable z
 86:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 87:    LDA  1,-5(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-60(7)	CALL outputc
 90:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outnl
 91:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 92:    LDA  1,-5(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-58(7)	CALL outnl
 95:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 96:    LDC  2,0(6)	Set return value to 0 
 97:     LD  3,-1(1)	Load return address 
 98:     LD  1,0(1)	Adjust fp 
 99:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,99(7)	Jump to init [backpatch] 
* INIT
100:     LD  0,0(0)	Set the global pointer 
101:    LDA  1,0(0)	set first frame at end of globals 
102:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-63(7)	Jump to main 
105:   HALT  0,0,0	DONE! 
* END INIT
