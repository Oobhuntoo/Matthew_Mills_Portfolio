* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  t02.c-
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
* IF
 43:     LD  3,-2(1)	Load variable n
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,2(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
 49:     LD  3,-2(1)	Load variable n
 50:     ST  3,-3(1)	Save index 
 51:    LDC  3,1(6)	Load integer constant 
 52:     LD  4,-3(1)	Restore index 
 53:    LDA  5,-1(0)	Load address of base of array k
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable k
* END COMPOUND
 48:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
 57:     LD  3,-2(1)	Load variable n
 58:     ST  3,-3(1)	Save index 
 59:     LD  3,-2(1)	Load variable n
 60:     ST  3,-4(1)	Save left side 
* CALL factorial
 61:     ST  1,-5(1)	Store fp in ghost frame for factorial
* PARAM 1
 62:     LD  3,-2(1)	Load variable n
 63:     ST  3,-7(1)	Save left side 
 64:    LDC  3,1(6)	Load integer constant 
 65:     LD  4,-7(1)	Load left into ac1 
 66:    SUB  3,4,3	Op - 
 67:     ST  3,-7(1)	Store parameter 
* END PARAM factorial
 68:    LDA  1,-5(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-29(7)	CALL factorial
 71:    LDA  3,0(2)	Save the result in ac 
* END CALL factorial
 72:     LD  4,-4(1)	Load left into ac1 
 73:    MUL  3,4,3	Op * 
 74:     LD  4,-3(1)	Restore index 
 75:    LDA  5,-1(0)	Load address of base of array k
 76:    SUB  5,5,4	Compute offset of value 
 77:     ST  3,0(5)	Store variable k
* END COMPOUND
 56:    LDA  7,21(7)	Jump around the ELSE [backpatch] 
* END IF
* RETURN
 78:    LDA  3,-1(0)	Load address of base of array k
 79:     ST  3,-3(1)	Save left side 
 80:     LD  3,-2(1)	Load variable n
 81:     LD  4,-3(1)	Load left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
 84:    LDA  2,0(3)	Copy result to rt register 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    LDA  7,0(3)	Return 
* END FUNCTION factorial
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 92:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
 93:    LDC  3,10(6)	Load integer constant 
 94:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL factorial
 95:     ST  1,-4(1)	Store fp in ghost frame for factorial
* PARAM 1
 96:     LD  3,-2(1)	Load variable n
 97:     ST  3,-6(1)	Store parameter 
* END PARAM factorial
 98:    LDA  1,-4(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-59(7)	CALL factorial
101:    LDA  3,0(2)	Save the result in ac 
* END CALL factorial
102:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL output
103:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
104:     LD  3,-2(1)	Load variable n
105:     ST  3,-5(1)	Store parameter 
* END PARAM output
106:    LDA  1,-3(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
110:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
111:    LDA  1,-3(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-77(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
115:    LDC  2,0(6)	Set return value to 0 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,118(7)	Jump to init [backpatch] 
* INIT
119:     LD  0,0(0)	Set the global pointer 
120:    LDA  1,-21(0)	set first frame at end of globals 
121:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
122:    LDC  3,20(6)	load size of array k
123:     ST  3,0(0)	save size of array k
* END INIT GLOBALS AND STATICS
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-34(7)	Jump to main 
126:   HALT  0,0,0	DONE! 
* END INIT
