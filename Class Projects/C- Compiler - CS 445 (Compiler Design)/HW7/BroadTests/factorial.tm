* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  factorial.c-
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
* FUNCTION factorial
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable i
 45:     ST  3,-4(1)	Store variable f
* WHILE
 46:     LD  3,-3(1)	Load variable i
 47:     ST  3,-5(1)	Save left side 
 48:     LD  3,-2(1)	Load variable n
 49:     LD  4,-5(1)	Load left into ac1 
 50:    TLE  3,4,3	Op <= 
 51:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 53:     ST  1,-5(1)	Store fp in ghost frame for output
* PARAM 1
 54:     LD  3,-3(1)	Load variable i
 55:     ST  3,-7(1)	Store parameter 
* END PARAM output
 56:    LDA  1,-5(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-53(7)	CALL output
 59:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
 60:     LD  3,-4(1)	Load variable f
 61:     ST  3,-6(1)	Save left side 
 62:     LD  3,-3(1)	Load variable i
 63:     LD  4,-6(1)	Load left into ac1 
 64:    MUL  3,4,3	Op * 
 65:     ST  3,-4(1)	Store variable f
* EXPRESSION
 66:     LD  3,-3(1)	load lhs variable i
 67:    LDA  3,1(3)	increment value of i
 68:     ST  3,-3(1)	Store variable i
* END COMPOUND
 69:    LDA  7,-24(7)	go to beginning of loop 
 52:    LDA  7,17(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
 70:     LD  3,-4(1)	Load variable f
 71:    LDA  2,0(3)	Copy result to rt register 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 75:    LDC  2,0(6)	Set return value to 0 
 76:     LD  3,-1(1)	Load return address 
 77:     LD  1,0(1)	Adjust fp 
 78:    LDA  7,0(3)	Return 
* END FUNCTION factorial
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 79:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL input
 80:     ST  1,-4(1)	Store fp in ghost frame for input
* END PARAM input
 81:    LDA  1,-4(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-83(7)	CALL input
 84:    LDA  3,0(2)	Save the result in ac 
* END CALL input
 85:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL factorial
 86:     ST  1,-4(1)	Store fp in ghost frame for factorial
* PARAM 1
 87:     LD  3,-2(1)	Load variable n
 88:     ST  3,-6(1)	Store parameter 
* END PARAM factorial
 89:    LDA  1,-4(1)	Load address of new frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    LDA  7,-50(7)	CALL factorial
 92:    LDA  3,0(2)	Save the result in ac 
* END CALL factorial
 93:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL output
 94:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 95:     LD  3,-2(1)	Load variable n
 96:     ST  3,-5(1)	Store parameter 
* END PARAM output
 97:    LDA  1,-3(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
101:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
102:    LDA  1,-3(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-68(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
106:    LDC  2,0(6)	Set return value to 0 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,109(7)	Jump to init [backpatch] 
* INIT
110:     LD  0,0(0)	Set the global pointer 
111:    LDA  1,0(0)	set first frame at end of globals 
112:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-36(7)	Jump to main 
115:   HALT  0,0,0	DONE! 
* END INIT
