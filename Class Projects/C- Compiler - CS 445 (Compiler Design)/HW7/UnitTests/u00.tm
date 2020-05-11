* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  u00.c-
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
 54:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
 63:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 64:    LDC  3,105(6)	Load integer constant 
 65:     ST  3,-4(1)	Store parameter 
* END PARAM output
 66:    LDA  1,-2(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 62:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* END ELSIF
 52:    LDA  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
 70:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 72:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 73:    LDC  3,101(6)	Load integer constant 
 74:     ST  3,-4(1)	Store parameter 
* END PARAM output
 75:    LDA  1,-2(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 71:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
 80:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 82:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 83:    LDC  3,103(6)	Load integer constant 
 84:     ST  3,-4(1)	Store parameter 
* END PARAM output
 85:    LDA  1,-2(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 81:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
 90:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
 91:    LDC  3,105(6)	Load integer constant 
 92:     ST  3,-4(1)	Store parameter 
* END PARAM output
 93:    LDA  1,-2(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 89:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* END ELSIF
 79:    LDA  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
 97:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 99:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
100:    LDC  3,101(6)	Load integer constant 
101:     ST  3,-4(1)	Store parameter 
* END PARAM output
102:    LDA  1,-2(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
* END CALL output
 98:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
107:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
109:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
110:    LDC  3,103(6)	Load integer constant 
111:     ST  3,-4(1)	Store parameter 
* END PARAM output
112:    LDA  1,-2(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-109(7)	CALL output
115:    LDA  3,0(2)	Save the result in ac 
* END CALL output
108:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
117:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
118:    LDC  3,105(6)	Load integer constant 
119:     ST  3,-4(1)	Store parameter 
* END PARAM output
120:    LDA  1,-2(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-117(7)	CALL output
123:    LDA  3,0(2)	Save the result in ac 
* END CALL output
116:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* END ELSIF
106:    LDA  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
124:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
126:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
127:    LDC  3,101(6)	Load integer constant 
128:     ST  3,-4(1)	Store parameter 
* END PARAM output
129:    LDA  1,-2(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-126(7)	CALL output
132:    LDA  3,0(2)	Save the result in ac 
* END CALL output
125:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
134:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
136:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
137:    LDC  3,103(6)	Load integer constant 
138:     ST  3,-4(1)	Store parameter 
* END PARAM output
139:    LDA  1,-2(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-136(7)	CALL output
142:    LDA  3,0(2)	Save the result in ac 
* END CALL output
135:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
144:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
145:    LDC  3,105(6)	Load integer constant 
146:     ST  3,-4(1)	Store parameter 
* END PARAM output
147:    LDA  1,-2(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
* END CALL output
143:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* END ELSIF
133:    LDA  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* END COMPOUND
* Add standard closing in case there is no return statement
151:    LDC  2,0(6)	Set return value to 0 
152:     LD  3,-1(1)	Load return address 
153:     LD  1,0(1)	Adjust fp 
154:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,154(7)	Jump to init [backpatch] 
* INIT
155:     LD  0,0(0)	Set the global pointer 
156:    LDA  1,0(0)	set first frame at end of globals 
157:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-118(7)	Jump to main 
160:   HALT  0,0,0	DONE! 
* END INIT
