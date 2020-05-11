* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyCall3.c-
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
* RETURN
 67:     LD  3,-2(1)	Load address of base of array z
 68:     ST  3,-3(1)	Save left side 
 69:    LDC  3,7(6)	Load integer constant 
 70:     LD  4,-3(1)	Load left into ac1 
 71:    SUB  3,4,3	compute location from index 
 72:     LD  3,0(3)	Load array element 
 73:    LDA  2,0(3)	Copy result to rt register 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    LDA  7,0(3)	Return 
* END FUNCTION three
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION two
 81:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 82:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 83:     LD  3,-2(1)	Load address of base of array y
 84:     ST  3,-5(1)	Save left side 
 85:    LDC  3,7(6)	Load integer constant 
 86:     LD  4,-5(1)	Load left into ac1 
 87:    SUB  3,4,3	compute location from index 
 88:     LD  3,0(3)	Load array element 
 89:     ST  3,-5(1)	Store parameter 
* END PARAM output
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL three
 94:     ST  1,-3(1)	Store fp in ghost frame for three
* PARAM 1
 95:     LD  3,-2(1)	Load address of base of array y
 96:     ST  3,-5(1)	Store parameter 
* END PARAM three
 97:    LDA  1,-3(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-58(7)	CALL three
100:    LDA  3,0(2)	Save the result in ac 
* END CALL three
* EXPRESSION
* CALL output
101:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
102:     LD  3,-2(1)	Load address of base of array y
103:     ST  3,-5(1)	Save left side 
104:    LDC  3,7(6)	Load integer constant 
105:     LD  4,-5(1)	Load left into ac1 
106:    SUB  3,4,3	compute location from index 
107:     LD  3,0(3)	Load array element 
108:     ST  3,-5(1)	Store parameter 
* END PARAM output
109:    LDA  1,-3(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* RETURN
113:     LD  3,-2(1)	Load address of base of array y
114:     ST  3,-3(1)	Save left side 
115:    LDC  3,7(6)	Load integer constant 
116:     LD  4,-3(1)	Load left into ac1 
117:    SUB  3,4,3	compute location from index 
118:     LD  3,0(3)	Load array element 
119:    LDA  2,0(3)	Copy result to rt register 
120:     LD  3,-1(1)	Load return address 
121:     LD  1,0(1)	Adjust fp 
122:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
123:    LDC  2,0(6)	Set return value to 0 
124:     LD  3,-1(1)	Load return address 
125:     LD  1,0(1)	Adjust fp 
126:    LDA  7,0(3)	Return 
* END FUNCTION two
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION one
127:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
128:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
129:     LD  3,-2(1)	Load address of base of array x
130:     ST  3,-5(1)	Save left side 
131:    LDC  3,7(6)	Load integer constant 
132:     LD  4,-5(1)	Load left into ac1 
133:    SUB  3,4,3	compute location from index 
134:     LD  3,0(3)	Load array element 
135:     ST  3,-5(1)	Store parameter 
* END PARAM output
136:    LDA  1,-3(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL two
140:     ST  1,-3(1)	Store fp in ghost frame for two
* PARAM 1
141:     LD  3,-2(1)	Load address of base of array x
142:     ST  3,-5(1)	Store parameter 
* END PARAM two
143:    LDA  1,-3(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-65(7)	CALL two
146:    LDA  3,0(2)	Save the result in ac 
* END CALL two
* EXPRESSION
* CALL output
147:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
148:     LD  3,-2(1)	Load address of base of array x
149:     ST  3,-5(1)	Save left side 
150:    LDC  3,7(6)	Load integer constant 
151:     LD  4,-5(1)	Load left into ac1 
152:    SUB  3,4,3	compute location from index 
153:     LD  3,0(3)	Load array element 
154:     ST  3,-5(1)	Store parameter 
* END PARAM output
155:    LDA  1,-3(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-152(7)	CALL output
158:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* RETURN
159:     LD  3,-2(1)	Load address of base of array x
160:     ST  3,-3(1)	Save left side 
161:    LDC  3,7(6)	Load integer constant 
162:     LD  4,-3(1)	Load left into ac1 
163:    SUB  3,4,3	compute location from index 
164:     LD  3,0(3)	Load array element 
165:    LDA  2,0(3)	Copy result to rt register 
166:     LD  3,-1(1)	Load return address 
167:     LD  1,0(1)	Adjust fp 
168:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
169:    LDC  2,0(6)	Set return value to 0 
170:     LD  3,-1(1)	Load return address 
171:     LD  1,0(1)	Adjust fp 
172:    LDA  7,0(3)	Return 
* END FUNCTION one
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
173:     ST  3,-1(1)	Store return address 
* COMPOUND
174:    LDC  3,10(6)	load size of array w
175:     ST  3,-2(1)	save size of array w
* Compound Body
* EXPRESSION
176:    LDC  3,7(6)	Load integer constant 
177:     ST  3,-13(1)	Save index 
178:    LDC  3,42(6)	Load integer constant 
179:     LD  4,-13(1)	Restore index 
180:    LDA  5,-3(1)	Load address of base of array w
181:    SUB  5,5,4	Compute offset of value 
182:     ST  3,0(5)	Store variable w
* EXPRESSION
* CALL output
183:     ST  1,-13(1)	Store fp in ghost frame for output
* PARAM 1
* CALL one
184:     ST  1,-15(1)	Store fp in ghost frame for one
* PARAM 1
185:    LDA  3,-3(1)	Load address of base of array w
186:     ST  3,-17(1)	Store parameter 
* END PARAM one
187:    LDA  1,-15(1)	Load address of new frame 
188:    LDA  3,1(7)	Return address in ac 
189:    LDA  7,-63(7)	CALL one
190:    LDA  3,0(2)	Save the result in ac 
* END CALL one
191:     ST  3,-15(1)	Store parameter 
* END PARAM output
192:    LDA  1,-13(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
196:     ST  1,-13(1)	Store fp in ghost frame for output
* PARAM 1
197:    LDA  3,-3(1)	Load address of base of array w
198:     ST  3,-15(1)	Save left side 
199:    LDC  3,7(6)	Load integer constant 
200:     LD  4,-15(1)	Load left into ac1 
201:    SUB  3,4,3	compute location from index 
202:     LD  3,0(3)	Load array element 
203:     ST  3,-15(1)	Store parameter 
* END PARAM output
204:    LDA  1,-13(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-201(7)	CALL output
207:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
208:     ST  1,-13(1)	Store fp in ghost frame for outnl
* END PARAM outnl
209:    LDA  1,-13(1)	Load address of new frame 
210:    LDA  3,1(7)	Return address in ac 
211:    LDA  7,-175(7)	CALL outnl
212:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
213:    LDC  2,0(6)	Set return value to 0 
214:     LD  3,-1(1)	Load return address 
215:     LD  1,0(1)	Adjust fp 
216:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,216(7)	Jump to init [backpatch] 
* INIT
217:     LD  0,0(0)	Set the global pointer 
218:    LDA  1,0(0)	set first frame at end of globals 
219:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
220:    LDA  3,1(7)	Return address in ac 
221:    LDA  7,-49(7)	Jump to main 
222:   HALT  0,0,0	DONE! 
* END INIT
