* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tiny3.c-
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
* FUNCTION wolf
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* RETURN
 43:     LD  3,-2(1)	Load variable garion
 44:     ST  3,-4(1)	Save left side 
 45:     LD  3,0(0)	Load variable g
 46:     LD  4,-4(1)	Load left into ac1 
 47:    ADD  3,4,3	Op + 
 48:    LDA  2,0(3)	Copy result to rt register 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 52:    LDC  2,0(6)	Set return value to 0 
 53:     LD  3,-1(1)	Load return address 
 54:     LD  1,0(1)	Adjust fp 
 55:    LDA  7,0(3)	Return 
* END FUNCTION wolf
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION polgara
 56:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* RETURN
 57:     LD  3,-2(1)	Load variable silk
 58:     ST  3,-4(1)	Save left side 
 59:    LDC  3,1(6)	Load integer constant 
 60:     LD  4,-4(1)	Load left into ac1 
 61:    ADD  3,4,3	Op + 
 62:    LDA  2,0(3)	Copy result to rt register 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    LDA  7,0(3)	Return 
* END FUNCTION polgara
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 70:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
 71:    LDC  3,33(6)	Load integer constant 
 72:     ST  3,0(0)	Store variable g
* EXPRESSION
 73:    LDC  3,666(6)	Load integer constant 
 74:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL wolf
 75:     ST  1,-4(1)	Store fp in ghost frame for wolf
* PARAM 1
* CALL polgara
 76:     ST  1,-6(1)	Store fp in ghost frame for polgara
* PARAM 1
 77:     LD  3,-2(1)	Load variable x
 78:     ST  3,-8(1)	Store parameter 
* END PARAM polgara
 79:    LDA  1,-6(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-26(7)	CALL polgara
 82:    LDA  3,0(2)	Save the result in ac 
* END CALL polgara
 83:     ST  3,-6(1)	Store parameter 
* END PARAM wolf
 84:    LDA  1,-4(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-45(7)	CALL wolf
 87:    LDA  3,0(2)	Save the result in ac 
* END CALL wolf
 88:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 89:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 90:     LD  3,-2(1)	Load variable x
 91:     ST  3,-5(1)	Store parameter 
* END PARAM output
 92:    LDA  1,-3(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-89(7)	CALL output
 95:    LDA  3,0(2)	Save the result in ac 
* END CALL output
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
101:    LDA  1,-1(0)	set first frame at end of globals 
102:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-35(7)	Jump to main 
105:   HALT  0,0,0	DONE! 
* END INIT
