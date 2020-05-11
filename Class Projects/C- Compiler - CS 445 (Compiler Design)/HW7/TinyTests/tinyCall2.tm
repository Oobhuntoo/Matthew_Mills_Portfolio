* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyCall2.c-
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
* FUNCTION three
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 43:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 44:     LD  3,-2(1)	Load address of base of array z
 45:     ST  3,-5(1)	Save left side 
 46:    LDC  3,7(6)	Load integer constant 
 47:     LD  4,-5(1)	Load left into ac1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
 50:     ST  3,-5(1)	Store parameter 
* END PARAM output
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
 55:    LDC  3,7(6)	Load integer constant 
 56:     ST  3,-3(1)	Save index 
 57:    LDC  3,666(6)	Load integer constant 
 58:     LD  4,-3(1)	Restore index 
 59:     LD  5,-2(1)	Load address of base of array z
 60:    SUB  5,5,4	Compute offset of value 
 61:     ST  3,0(5)	Store variable z
* EXPRESSION
* CALL outnl
 62:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 63:    LDA  1,-3(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-29(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    LDA  7,0(3)	Return 
* END FUNCTION three
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION two
 71:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 72:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 73:     LD  3,-2(1)	Load address of base of array y
 74:     ST  3,-5(1)	Save left side 
 75:    LDC  3,7(6)	Load integer constant 
 76:     LD  4,-5(1)	Load left into ac1 
 77:    SUB  3,4,3	compute location from index 
 78:     LD  3,0(3)	Load array element 
 79:     ST  3,-5(1)	Store parameter 
* END PARAM output
 80:    LDA  1,-3(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL three
 84:     ST  1,-3(1)	Store fp in ghost frame for three
* PARAM 1
 85:     LD  3,-2(1)	Load address of base of array y
 86:     ST  3,-5(1)	Store parameter 
* END PARAM three
 87:    LDA  1,-3(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-48(7)	CALL three
 90:    LDA  3,0(2)	Save the result in ac 
* END CALL three
* EXPRESSION
* CALL output
 91:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 92:     LD  3,-2(1)	Load address of base of array y
 93:     ST  3,-5(1)	Save left side 
 94:    LDC  3,7(6)	Load integer constant 
 95:     LD  4,-5(1)	Load left into ac1 
 96:    SUB  3,4,3	compute location from index 
 97:     LD  3,0(3)	Load array element 
 98:     ST  3,-5(1)	Store parameter 
* END PARAM output
 99:    LDA  1,-3(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
103:    LDC  2,0(6)	Set return value to 0 
104:     LD  3,-1(1)	Load return address 
105:     LD  1,0(1)	Adjust fp 
106:    LDA  7,0(3)	Return 
* END FUNCTION two
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION one
107:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
108:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
109:     LD  3,-2(1)	Load address of base of array x
110:     ST  3,-5(1)	Save left side 
111:    LDC  3,7(6)	Load integer constant 
112:     LD  4,-5(1)	Load left into ac1 
113:    SUB  3,4,3	compute location from index 
114:     LD  3,0(3)	Load array element 
115:     ST  3,-5(1)	Store parameter 
* END PARAM output
116:    LDA  1,-3(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-113(7)	CALL output
119:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL two
120:     ST  1,-3(1)	Store fp in ghost frame for two
* PARAM 1
121:     LD  3,-2(1)	Load address of base of array x
122:     ST  3,-5(1)	Store parameter 
* END PARAM two
123:    LDA  1,-3(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-55(7)	CALL two
126:    LDA  3,0(2)	Save the result in ac 
* END CALL two
* EXPRESSION
* CALL output
127:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
128:     LD  3,-2(1)	Load address of base of array x
129:     ST  3,-5(1)	Save left side 
130:    LDC  3,7(6)	Load integer constant 
131:     LD  4,-5(1)	Load left into ac1 
132:    SUB  3,4,3	compute location from index 
133:     LD  3,0(3)	Load array element 
134:     ST  3,-5(1)	Store parameter 
* END PARAM output
135:    LDA  1,-3(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
139:    LDC  2,0(6)	Set return value to 0 
140:     LD  3,-1(1)	Load return address 
141:     LD  1,0(1)	Adjust fp 
142:    LDA  7,0(3)	Return 
* END FUNCTION one
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
143:     ST  3,-1(1)	Store return address 
* COMPOUND
144:    LDC  3,10(6)	load size of array w
145:     ST  3,-2(1)	save size of array w
* Compound Body
* EXPRESSION
146:    LDC  3,7(6)	Load integer constant 
147:     ST  3,-13(1)	Save index 
148:    LDC  3,42(6)	Load integer constant 
149:     LD  4,-13(1)	Restore index 
150:    LDA  5,-3(1)	Load address of base of array w
151:    SUB  5,5,4	Compute offset of value 
152:     ST  3,0(5)	Store variable w
* EXPRESSION
* CALL one
153:     ST  1,-13(1)	Store fp in ghost frame for one
* PARAM 1
154:    LDA  3,-3(1)	Load address of base of array w
155:     ST  3,-15(1)	Store parameter 
* END PARAM one
156:    LDA  1,-13(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-52(7)	CALL one
159:    LDA  3,0(2)	Save the result in ac 
* END CALL one
* EXPRESSION
* CALL output
160:     ST  1,-13(1)	Store fp in ghost frame for output
* PARAM 1
161:    LDA  3,-3(1)	Load address of base of array w
162:     ST  3,-15(1)	Save left side 
163:    LDC  3,7(6)	Load integer constant 
164:     LD  4,-15(1)	Load left into ac1 
165:    SUB  3,4,3	compute location from index 
166:     LD  3,0(3)	Load array element 
167:     ST  3,-15(1)	Store parameter 
* END PARAM output
168:    LDA  1,-13(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-165(7)	CALL output
171:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
172:     ST  1,-13(1)	Store fp in ghost frame for outnl
* END PARAM outnl
173:    LDA  1,-13(1)	Load address of new frame 
174:    LDA  3,1(7)	Return address in ac 
175:    LDA  7,-139(7)	CALL outnl
176:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
177:    LDC  2,0(6)	Set return value to 0 
178:     LD  3,-1(1)	Load return address 
179:     LD  1,0(1)	Adjust fp 
180:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,180(7)	Jump to init [backpatch] 
* INIT
181:     LD  0,0(0)	Set the global pointer 
182:    LDA  1,0(0)	set first frame at end of globals 
183:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-43(7)	Jump to main 
186:   HALT  0,0,0	DONE! 
* END INIT
