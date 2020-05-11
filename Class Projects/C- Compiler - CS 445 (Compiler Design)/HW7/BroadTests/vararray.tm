* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  vararray.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address 
* EXPRESSION
* CALL output
 43:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 44:     LD  3,-2(1)	Load address of base of array q
 45:     ST  3,-5(1)	Save left side 
 46:    LDC  3,10(6)	Load integer constant 
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
* Add standard closing in case there is no return statement
 55:    LDC  2,0(6)	Set return value to 0 
 56:     LD  3,-1(1)	Load return address 
 57:     LD  1,0(1)	Adjust fp 
 58:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 59:     ST  3,-1(1)	Store return address 
* COMPOUND
 60:    LDC  3,9(6)	load size of array y
 61:     ST  3,-3(1)	save size of array y
* Compound Body
* EXPRESSION
* CALL output
 62:     ST  1,-13(1)	Store fp in ghost frame for output
* PARAM 1
 63:     LD  3,-2(1)	Load address of base of array x
 64:     LD  3,1(3)	Load array size 
 65:     ST  3,-15(1)	Store parameter 
* END PARAM output
 66:    LDA  1,-13(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
 70:     ST  1,-13(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 71:    LDA  1,-13(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-37(7)	CALL outnl
 74:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
 75:     ST  1,-13(1)	Store fp in ghost frame for output
* PARAM 1
 76:     LD  3,-2(1)	Load address of base of array x
 77:     ST  3,-15(1)	Save left side 
 78:    LDC  3,10(6)	Load integer constant 
 79:     LD  4,-15(1)	Load left into ac1 
 80:    SUB  3,4,3	compute location from index 
 81:     LD  3,0(3)	Load array element 
 82:     ST  3,-15(1)	Store parameter 
* END PARAM output
 83:    LDA  1,-13(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL cat
 87:     ST  1,-13(1)	Store fp in ghost frame for cat
* PARAM 1
 88:     LD  3,-2(1)	Load address of base of array x
 89:     ST  3,-15(1)	Store parameter 
* END PARAM cat
 90:    LDA  1,-13(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	CALL cat
 93:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
* EXPRESSION
* CALL outnl
 94:     ST  1,-13(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 95:    LDA  1,-13(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-61(7)	CALL outnl
 98:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
 99:    LDC  3,5(6)	Load integer constant 
100:     ST  3,-13(1)	Save index 
101:    LDA  3,-4(1)	Load address of base of array y
102:     ST  3,-14(1)	Save left side 
103:    LDC  3,5(6)	Load integer constant 
104:     LD  4,-14(1)	Load left into ac1 
105:    SUB  3,4,3	compute location from index 
106:     LD  3,0(3)	Load array element 
107:     LD  4,-13(1)	Restore index 
108:     LD  5,-2(1)	Load address of base of array x
109:    SUB  5,5,4	Compute offset of value 
110:     ST  3,0(5)	Store variable x
* EXPRESSION
111:    LDC  3,6(6)	Load integer constant 
112:     ST  3,-13(1)	Save index 
113:    LDA  3,-1(0)	Load address of base of array g
114:     ST  3,-14(1)	Save left side 
115:    LDC  3,6(6)	Load integer constant 
116:     LD  4,-14(1)	Load left into ac1 
117:    SUB  3,4,3	compute location from index 
118:     LD  3,0(3)	Load array element 
119:     LD  4,-13(1)	Restore index 
120:    LDA  5,-14(0)	Load address of base of array z
121:    SUB  5,5,4	Compute offset of value 
122:     ST  3,0(5)	Store variable z
* RETURN
123:    LDA  3,-14(0)	Load address of base of array z
124:     ST  3,-13(1)	Save left side 
125:    LDC  3,4(6)	Load integer constant 
126:     LD  4,-13(1)	Load left into ac1 
127:    SUB  3,4,3	compute location from index 
128:     LD  3,0(3)	Load array element 
129:    LDA  2,0(3)	Copy result to rt register 
130:     LD  3,-1(1)	Load return address 
131:     LD  1,0(1)	Adjust fp 
132:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
133:    LDC  2,0(6)	Set return value to 0 
134:     LD  3,-1(1)	Load return address 
135:     LD  1,0(1)	Adjust fp 
136:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
137:     ST  3,-1(1)	Store return address 
* COMPOUND
138:    LDC  3,11(6)	load size of array m
139:     ST  3,-2(1)	save size of array m
* Compound Body
* EXPRESSION
140:    LDC  3,10(6)	Load integer constant 
141:     ST  3,-14(1)	Save index 
142:    LDC  3,111(6)	Load integer constant 
143:     LD  4,-14(1)	Restore index 
144:    LDA  5,-3(1)	Load address of base of array m
145:    SUB  5,5,4	Compute offset of value 
146:     ST  3,0(5)	Store variable m
* EXPRESSION
* CALL dog
147:     ST  1,-14(1)	Store fp in ghost frame for dog
* PARAM 1
148:    LDA  3,-3(1)	Load address of base of array m
149:     ST  3,-16(1)	Store parameter 
* END PARAM dog
150:    LDA  1,-14(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-94(7)	CALL dog
153:    LDA  3,0(2)	Save the result in ac 
* END CALL dog
* EXPRESSION
* CALL output
154:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
155:    LDA  3,-3(1)	Load address of base of array m
156:     ST  3,-16(1)	Save left side 
157:    LDC  3,10(6)	Load integer constant 
158:     LD  4,-16(1)	Load left into ac1 
159:    SUB  3,4,3	compute location from index 
160:     LD  3,0(3)	Load array element 
161:     ST  3,-16(1)	Store parameter 
* END PARAM output
162:    LDA  1,-14(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-159(7)	CALL output
165:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
166:    LDC  3,10(6)	Load integer constant 
167:     ST  3,-14(1)	Save index 
168:    LDC  3,222(6)	Load integer constant 
169:     LD  4,-14(1)	Restore index 
170:    LDA  5,-1(0)	Load address of base of array g
171:    SUB  5,5,4	Compute offset of value 
172:     ST  3,0(5)	Store variable g
* EXPRESSION
* CALL dog
173:     ST  1,-14(1)	Store fp in ghost frame for dog
* PARAM 1
174:    LDA  3,-1(0)	Load address of base of array g
175:     ST  3,-16(1)	Store parameter 
* END PARAM dog
176:    LDA  1,-14(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-120(7)	CALL dog
179:    LDA  3,0(2)	Save the result in ac 
* END CALL dog
* EXPRESSION
* CALL output
180:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
181:    LDA  3,-1(0)	Load address of base of array g
182:     ST  3,-16(1)	Save left side 
183:    LDC  3,10(6)	Load integer constant 
184:     LD  4,-16(1)	Load left into ac1 
185:    SUB  3,4,3	compute location from index 
186:     LD  3,0(3)	Load array element 
187:     ST  3,-16(1)	Store parameter 
* END PARAM output
188:    LDA  1,-14(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-185(7)	CALL output
191:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
192:    LDC  3,10(6)	Load integer constant 
193:     ST  3,-14(1)	Save index 
194:    LDC  3,333(6)	Load integer constant 
195:     LD  4,-14(1)	Restore index 
196:    LDA  5,-25(0)	Load address of base of array z
197:    SUB  5,5,4	Compute offset of value 
198:     ST  3,0(5)	Store variable z
* EXPRESSION
* CALL dog
199:     ST  1,-14(1)	Store fp in ghost frame for dog
* PARAM 1
200:    LDA  3,-25(0)	Load address of base of array z
201:     ST  3,-16(1)	Store parameter 
* END PARAM dog
202:    LDA  1,-14(1)	Load address of new frame 
203:    LDA  3,1(7)	Return address in ac 
204:    LDA  7,-146(7)	CALL dog
205:    LDA  3,0(2)	Save the result in ac 
* END CALL dog
* EXPRESSION
* CALL output
206:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
207:    LDA  3,-25(0)	Load address of base of array z
208:     ST  3,-16(1)	Save left side 
209:    LDC  3,10(6)	Load integer constant 
210:     LD  4,-16(1)	Load left into ac1 
211:    SUB  3,4,3	compute location from index 
212:     LD  3,0(3)	Load array element 
213:     ST  3,-16(1)	Store parameter 
* END PARAM output
214:    LDA  1,-14(1)	Load address of new frame 
215:    LDA  3,1(7)	Return address in ac 
216:    LDA  7,-211(7)	CALL output
217:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
218:    LDC  2,0(6)	Set return value to 0 
219:     LD  3,-1(1)	Load return address 
220:     LD  1,0(1)	Adjust fp 
221:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,221(7)	Jump to init [backpatch] 
* INIT
222:     LD  0,0(0)	Set the global pointer 
223:    LDA  1,-38(0)	set first frame at end of globals 
224:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
225:    LDC  3,12(6)	load size of array g
226:     ST  3,0(0)	save size of array g
227:    LDC  3,10(6)	load size of array z
228:     ST  3,-13(0)	save size of array z
229:    LDC  3,13(6)	load size of array z
230:     ST  3,-24(0)	save size of array z
* END INIT GLOBALS AND STATICS
231:    LDA  3,1(7)	Return address in ac 
232:    LDA  7,-96(7)	Jump to main 
233:   HALT  0,0,0	DONE! 
* END INIT
