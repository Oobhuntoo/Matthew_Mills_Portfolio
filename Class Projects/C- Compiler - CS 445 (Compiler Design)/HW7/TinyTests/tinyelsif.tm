* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyelsif.c-
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
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-2(1)	save starting value in index variable 
 45:    LDC  3,7(6)	Load integer constant 
 46:     ST  3,-3(1)	save ending value 
 47:    LDC  3,1(6)	Load integer constant 
 48:     ST  3,-4(1)	save increment values 
 49:     LD  4,-2(1)	loop index 
 50:     LD  5,-3(1)	ending value 
 51:     LD  3,-4(1)	increment value 
 52:    SLT  3,4,5	Op < 
 53:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 55:     ST  1,-5(1)	Store fp in ghost frame for output
* PARAM 1
 56:     LD  3,-2(1)	Load variable x
 57:     ST  3,-7(1)	Store parameter 
* END PARAM output
 58:    LDA  1,-5(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* IF
 62:     LD  3,-2(1)	Load variable x
 63:     ST  3,-5(1)	Save left side 
 64:    LDC  3,1(6)	Load integer constant 
 65:     LD  4,-5(1)	Load left into ac1 
 66:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 68:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 69:    LDC  3,65(6)	Load char constant 
 70:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 71:    LDA  1,-5(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-44(7)	CALL outputc
 74:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
 67:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
 76:     LD  3,-2(1)	Load variable x
 77:     ST  3,-5(1)	Save left side 
 78:    LDC  3,2(6)	Load integer constant 
 79:     LD  4,-5(1)	Load left into ac1 
 80:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 82:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 83:    LDC  3,66(6)	Load char constant 
 84:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 85:    LDA  1,-5(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-58(7)	CALL outputc
 88:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
 81:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
 90:     LD  3,-2(1)	Load variable x
 91:     ST  3,-5(1)	Save left side 
 92:    LDC  3,3(6)	Load integer constant 
 93:     LD  4,-5(1)	Load left into ac1 
 94:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 96:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 97:    LDC  3,67(6)	Load char constant 
 98:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 99:    LDA  1,-5(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-72(7)	CALL outputc
102:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
 95:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
104:     LD  3,-2(1)	Load variable x
105:     ST  3,-5(1)	Save left side 
106:    LDC  3,4(6)	Load integer constant 
107:     LD  4,-5(1)	Load left into ac1 
108:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
110:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
111:    LDC  3,68(6)	Load char constant 
112:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
113:    LDA  1,-5(1)	Load address of new frame 
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-86(7)	CALL outputc
116:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
109:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputc
118:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
119:    LDC  3,69(6)	Load char constant 
120:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
121:    LDA  1,-5(1)	Load address of new frame 
122:    LDA  3,1(7)	Return address in ac 
123:    LDA  7,-94(7)	CALL outputc
124:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
117:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* END ELSIF
103:    LDA  7,21(7)	Jump around the ELSE [backpatch] 
* END ELSIF
 89:    LDA  7,35(7)	Jump around the ELSE [backpatch] 
* END ELSIF
 75:    LDA  7,49(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
125:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
126:    LDA  1,-5(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-92(7)	CALL outnl
129:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* LOOP INC AND JMP
130:     LD  3,-2(1)	Load index 
131:     LD  5,-4(1)	Load increment 
132:    ADD  3,3,5	increment 
133:     ST  3,-2(1)	store into index 
134:    LDA  7,-86(7)	go to beginning of loop 
 54:    LDA  7,80(7)	Jump past loop [backpatch] 
* END LOOP
* END COMPOUND
* Add standard closing in case there is no return statement
135:    LDC  2,0(6)	Set return value to 0 
136:     LD  3,-1(1)	Load return address 
137:     LD  1,0(1)	Adjust fp 
138:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,138(7)	Jump to init [backpatch] 
* INIT
139:     LD  0,0(0)	Set the global pointer 
140:    LDA  1,0(0)	set first frame at end of globals 
141:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-102(7)	Jump to main 
144:   HALT  0,0,0	DONE! 
* END INIT
