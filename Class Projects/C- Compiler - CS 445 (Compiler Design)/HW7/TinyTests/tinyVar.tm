* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyVar.c-
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
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* Compound Body
* EXPRESSION
 45:     LD  3,0(0)	Load variable gx
* EXPRESSION
 46:    LDA  3,-2(0)	Load address of base of array gy
 47:     ST  3,-16(1)	Save left side 
 48:    LDC  3,9(6)	Load integer constant 
 49:     LD  4,-16(1)	Load left into ac1 
 50:    SUB  3,4,3	compute location from index 
 51:     LD  3,0(3)	Load array element 
* EXPRESSION
 52:    LDA  3,-2(0)	Load address of base of array gy
 53:     LD  3,1(3)	Load array size 
* EXPRESSION
 54:     LD  3,-4(1)	Load variable x
* EXPRESSION
 55:    LDA  3,-6(1)	Load address of base of array y
 56:     ST  3,-16(1)	Save left side 
 57:    LDC  3,9(6)	Load integer constant 
 58:     LD  4,-16(1)	Load left into ac1 
 59:    SUB  3,4,3	compute location from index 
 60:     LD  3,0(3)	Load array element 
* EXPRESSION
 61:    LDA  3,-6(1)	Load address of base of array y
 62:     LD  3,1(3)	Load array size 
* EXPRESSION
 63:     LD  3,-2(1)	Load variable px
* EXPRESSION
 64:     LD  3,-3(1)	Load address of base of array py
 65:     ST  3,-16(1)	Save left side 
 66:    LDC  3,9(6)	Load integer constant 
 67:     LD  4,-16(1)	Load left into ac1 
 68:    SUB  3,4,3	compute location from index 
 69:     LD  3,0(3)	Load array element 
* EXPRESSION
 70:     LD  3,-3(1)	Load address of base of array py
 71:     LD  3,1(3)	Load array size 
* EXPRESSION
 72:     LD  3,-12(0)	Load variable sx
* EXPRESSION
 73:    LDA  3,-14(0)	Load address of base of array sy
 74:     ST  3,-16(1)	Save left side 
 75:    LDC  3,9(6)	Load integer constant 
 76:     LD  4,-16(1)	Load left into ac1 
 77:    SUB  3,4,3	compute location from index 
 78:     LD  3,0(3)	Load array element 
* EXPRESSION
 79:    LDA  3,-14(0)	Load address of base of array sy
 80:     LD  3,1(3)	Load array size 
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
 86:    LDA  1,-24(0)	set first frame at end of globals 
 87:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 88:    LDC  3,10(6)	load size of array gy
 89:     ST  3,-1(0)	save size of array gy
 90:    LDC  3,10(6)	load size of array sy
 91:     ST  3,-13(0)	save size of array sy
* END INIT GLOBALS AND STATICS
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-52(7)	Jump to main 
 94:   HALT  0,0,0	DONE! 
* END INIT
