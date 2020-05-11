* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  u01.c-
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
* IF
 43:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 45:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 46:    LDC  3,101(6)	Load integer constant 
 47:     ST  3,-4(1)	Store parameter 
* END PARAM output
 48:    LDA  1,-2(1)	Load address of new frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    LDA  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 44:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
 53:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 55:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 56:    LDC  3,103(6)	Load integer constant 
 57:     ST  3,-4(1)	Store parameter 
* END PARAM output
 58:    LDA  1,-2(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 54:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END ELSIF
 52:    LDA  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
 62:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 63:    LDC  3,105(6)	Load integer constant 
 64:     ST  3,-4(1)	Store parameter 
* END PARAM output
 65:    LDA  1,-2(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* IF
 69:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 71:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 72:    LDC  3,101(6)	Load integer constant 
 73:     ST  3,-4(1)	Store parameter 
* END PARAM output
 74:    LDA  1,-2(1)	Load address of new frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    LDA  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 70:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
 79:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 81:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 82:    LDC  3,103(6)	Load integer constant 
 83:     ST  3,-4(1)	Store parameter 
* END PARAM output
 84:    LDA  1,-2(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-81(7)	CALL output
 87:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 80:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END ELSIF
 78:    LDA  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
 88:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 89:    LDC  3,105(6)	Load integer constant 
 90:     ST  3,-4(1)	Store parameter 
* END PARAM output
 91:    LDA  1,-2(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-88(7)	CALL output
 94:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* IF
 95:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 97:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 98:    LDC  3,101(6)	Load integer constant 
 99:     ST  3,-4(1)	Store parameter 
* END PARAM output
100:    LDA  1,-2(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-97(7)	CALL output
103:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 96:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
105:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
107:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
108:    LDC  3,103(6)	Load integer constant 
109:     ST  3,-4(1)	Store parameter 
* END PARAM output
110:    LDA  1,-2(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-107(7)	CALL output
113:    LDA  3,0(2)	Save the result in ac 
* END CALL output
106:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END ELSIF
104:    LDA  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
114:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
115:    LDC  3,105(6)	Load integer constant 
116:     ST  3,-4(1)	Store parameter 
* END PARAM output
117:    LDA  1,-2(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* IF
121:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
123:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
124:    LDC  3,101(6)	Load integer constant 
125:     ST  3,-4(1)	Store parameter 
* END PARAM output
126:    LDA  1,-2(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-123(7)	CALL output
129:    LDA  3,0(2)	Save the result in ac 
* END CALL output
122:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
131:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
133:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
134:    LDC  3,103(6)	Load integer constant 
135:     ST  3,-4(1)	Store parameter 
* END PARAM output
136:    LDA  1,-2(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
* END CALL output
132:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END ELSIF
130:    LDA  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
140:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
141:    LDC  3,105(6)	Load integer constant 
142:     ST  3,-4(1)	Store parameter 
* END PARAM output
143:    LDA  1,-2(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-140(7)	CALL output
146:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
147:    LDC  2,0(6)	Set return value to 0 
148:     LD  3,-1(1)	Load return address 
149:     LD  1,0(1)	Adjust fp 
150:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,150(7)	Jump to init [backpatch] 
* INIT
151:     LD  0,0(0)	Set the global pointer 
152:    LDA  1,0(0)	set first frame at end of globals 
153:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-114(7)	Jump to main 
156:   HALT  0,0,0	DONE! 
* END INIT
