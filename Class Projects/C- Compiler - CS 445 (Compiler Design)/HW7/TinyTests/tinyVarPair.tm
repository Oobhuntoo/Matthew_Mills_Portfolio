* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyVarPair.c-
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
* FUNCTION fred
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* Compound Body
* EXPRESSION
 45:    LDC  3,111(6)	Load integer constant 
 46:     ST  3,0(0)	Store variable gx
* EXPRESSION
 47:     LD  3,0(0)	Load variable gx
 48:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
 49:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
 50:     LD  3,0(0)	Load variable gx
 51:     ST  3,-18(1)	Store parameter 
* END PARAM output
 52:    LDA  1,-16(1)	Load address of new frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    LDA  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
 56:    LDC  3,9(6)	Load integer constant 
 57:     ST  3,-16(1)	Save index 
 58:    LDC  3,222(6)	Load integer constant 
 59:     LD  4,-16(1)	Restore index 
 60:    LDA  5,-2(0)	Load address of base of array gy
 61:    SUB  5,5,4	Compute offset of value 
 62:     ST  3,0(5)	Store variable gy
* EXPRESSION
 63:    LDC  3,9(6)	Load integer constant 
 64:     ST  3,-16(1)	Save index 
 65:    LDA  3,-2(0)	Load address of base of array gy
 66:     ST  3,-17(1)	Save left side 
 67:    LDC  3,9(6)	Load integer constant 
 68:     LD  4,-17(1)	Load left into ac1 
 69:    SUB  3,4,3	compute location from index 
 70:     LD  3,0(3)	Load array element 
 71:     LD  4,-16(1)	Restore index 
 72:    LDA  5,-2(0)	Load address of base of array gy
 73:    SUB  5,5,4	Compute offset of value 
 74:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
 75:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
 76:    LDA  3,-2(0)	Load address of base of array gy
 77:     ST  3,-18(1)	Save left side 
 78:    LDC  3,9(6)	Load integer constant 
 79:     LD  4,-18(1)	Load left into ac1 
 80:    SUB  3,4,3	compute location from index 
 81:     LD  3,0(3)	Load array element 
 82:     ST  3,-18(1)	Store parameter 
* END PARAM output
 83:    LDA  1,-16(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
 87:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 88:    LDA  1,-16(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-54(7)	CALL outnl
 91:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
 92:    LDC  3,333(6)	Load integer constant 
 93:     ST  3,-4(1)	Store variable x
* EXPRESSION
 94:     LD  3,-4(1)	Load variable x
 95:     ST  3,-4(1)	Store variable x
* EXPRESSION
* CALL output
 96:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
 97:     LD  3,-4(1)	Load variable x
 98:     ST  3,-18(1)	Store parameter 
* END PARAM output
 99:    LDA  1,-16(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
103:    LDC  3,9(6)	Load integer constant 
104:     ST  3,-16(1)	Save index 
105:    LDC  3,444(6)	Load integer constant 
106:     LD  4,-16(1)	Restore index 
107:    LDA  5,-6(1)	Load address of base of array y
108:    SUB  5,5,4	Compute offset of value 
109:     ST  3,0(5)	Store variable y
* EXPRESSION
110:    LDC  3,9(6)	Load integer constant 
111:     ST  3,-16(1)	Save index 
112:    LDA  3,-6(1)	Load address of base of array y
113:     ST  3,-17(1)	Save left side 
114:    LDC  3,9(6)	Load integer constant 
115:     LD  4,-17(1)	Load left into ac1 
116:    SUB  3,4,3	compute location from index 
117:     LD  3,0(3)	Load array element 
118:     LD  4,-16(1)	Restore index 
119:    LDA  5,-6(1)	Load address of base of array y
120:    SUB  5,5,4	Compute offset of value 
121:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
122:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
123:    LDA  3,-6(1)	Load address of base of array y
124:     ST  3,-18(1)	Save left side 
125:    LDC  3,9(6)	Load integer constant 
126:     LD  4,-18(1)	Load left into ac1 
127:    SUB  3,4,3	compute location from index 
128:     LD  3,0(3)	Load array element 
129:     ST  3,-18(1)	Store parameter 
* END PARAM output
130:    LDA  1,-16(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
134:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
135:    LDA  1,-16(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-101(7)	CALL outnl
138:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
139:    LDC  3,555(6)	Load integer constant 
140:     ST  3,-2(1)	Store variable px
* EXPRESSION
141:     LD  3,-2(1)	Load variable px
142:     ST  3,-2(1)	Store variable px
* EXPRESSION
* CALL output
143:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
144:     LD  3,-2(1)	Load variable px
145:     ST  3,-18(1)	Store parameter 
* END PARAM output
146:    LDA  1,-16(1)	Load address of new frame 
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-143(7)	CALL output
149:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
150:    LDC  3,9(6)	Load integer constant 
151:     ST  3,-16(1)	Save index 
152:    LDC  3,666(6)	Load integer constant 
153:     LD  4,-16(1)	Restore index 
154:     LD  5,-3(1)	Load address of base of array py
155:    SUB  5,5,4	Compute offset of value 
156:     ST  3,0(5)	Store variable py
* EXPRESSION
157:    LDC  3,9(6)	Load integer constant 
158:     ST  3,-16(1)	Save index 
159:     LD  3,-3(1)	Load address of base of array py
160:     ST  3,-17(1)	Save left side 
161:    LDC  3,9(6)	Load integer constant 
162:     LD  4,-17(1)	Load left into ac1 
163:    SUB  3,4,3	compute location from index 
164:     LD  3,0(3)	Load array element 
165:     LD  4,-16(1)	Restore index 
166:     LD  5,-3(1)	Load address of base of array py
167:    SUB  5,5,4	Compute offset of value 
168:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL output
169:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
170:     LD  3,-3(1)	Load address of base of array py
171:     ST  3,-18(1)	Save left side 
172:    LDC  3,9(6)	Load integer constant 
173:     LD  4,-18(1)	Load left into ac1 
174:    SUB  3,4,3	compute location from index 
175:     LD  3,0(3)	Load array element 
176:     ST  3,-18(1)	Store parameter 
* END PARAM output
177:    LDA  1,-16(1)	Load address of new frame 
178:    LDA  3,1(7)	Return address in ac 
179:    LDA  7,-174(7)	CALL output
180:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
181:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
182:    LDA  1,-16(1)	Load address of new frame 
183:    LDA  3,1(7)	Return address in ac 
184:    LDA  7,-148(7)	CALL outnl
185:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
186:    LDC  3,777(6)	Load integer constant 
187:     ST  3,-12(0)	Store variable sx
* EXPRESSION
188:     LD  3,-12(0)	Load variable sx
189:     ST  3,-12(0)	Store variable sx
* EXPRESSION
* CALL output
190:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
191:     LD  3,-12(0)	Load variable sx
192:     ST  3,-18(1)	Store parameter 
* END PARAM output
193:    LDA  1,-16(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-190(7)	CALL output
196:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
197:    LDC  3,9(6)	Load integer constant 
198:     ST  3,-16(1)	Save index 
199:    LDC  3,888(6)	Load integer constant 
200:     LD  4,-16(1)	Restore index 
201:    LDA  5,-14(0)	Load address of base of array sy
202:    SUB  5,5,4	Compute offset of value 
203:     ST  3,0(5)	Store variable sy
* EXPRESSION
204:    LDC  3,9(6)	Load integer constant 
205:     ST  3,-16(1)	Save index 
206:    LDA  3,-14(0)	Load address of base of array sy
207:     ST  3,-17(1)	Save left side 
208:    LDC  3,9(6)	Load integer constant 
209:     LD  4,-17(1)	Load left into ac1 
210:    SUB  3,4,3	compute location from index 
211:     LD  3,0(3)	Load array element 
212:     LD  4,-16(1)	Restore index 
213:    LDA  5,-14(0)	Load address of base of array sy
214:    SUB  5,5,4	Compute offset of value 
215:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL output
216:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
217:    LDA  3,-14(0)	Load address of base of array sy
218:     ST  3,-18(1)	Save left side 
219:    LDC  3,9(6)	Load integer constant 
220:     LD  4,-18(1)	Load left into ac1 
221:    SUB  3,4,3	compute location from index 
222:     LD  3,0(3)	Load array element 
223:     ST  3,-18(1)	Store parameter 
* END PARAM output
224:    LDA  1,-16(1)	Load address of new frame 
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-221(7)	CALL output
227:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
228:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
229:    LDA  1,-16(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-195(7)	CALL outnl
232:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
233:    LDC  2,0(6)	Set return value to 0 
234:     LD  3,-1(1)	Load return address 
235:     LD  1,0(1)	Adjust fp 
236:    LDA  7,0(3)	Return 
* END FUNCTION fred
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
237:     ST  3,-1(1)	Store return address 
* COMPOUND
238:    LDC  3,10(6)	load size of array ly
239:     ST  3,-3(1)	save size of array ly
* Compound Body
* EXPRESSION
240:    LDC  3,0(6)	Load integer constant 
241:     ST  3,-15(1)	Save index 
242:    LDC  3,111(6)	Load integer constant 
243:     LD  4,-15(1)	Restore index 
244:    LDA  5,-4(1)	Load address of base of array ly
245:    SUB  5,5,4	Compute offset of value 
246:     ST  3,0(5)	Store variable ly
247:     ST  3,-2(1)	Store variable lx
* EXPRESSION
* CALL fred
248:     ST  1,-14(1)	Store fp in ghost frame for fred
* PARAM 1
249:     LD  3,0(0)	Load variable gx
250:     ST  3,-16(1)	Store parameter 
* PARAM 2
251:    LDA  3,-2(0)	Load address of base of array gy
252:     ST  3,-17(1)	Store parameter 
* END PARAM fred
253:    LDA  1,-14(1)	Load address of new frame 
254:    LDA  3,1(7)	Return address in ac 
255:    LDA  7,-214(7)	CALL fred
256:    LDA  3,0(2)	Save the result in ac 
* END CALL fred
* EXPRESSION
* CALL fred
257:     ST  1,-14(1)	Store fp in ghost frame for fred
* PARAM 1
258:     LD  3,-2(1)	Load variable lx
259:     ST  3,-16(1)	Store parameter 
* PARAM 2
260:    LDA  3,-4(1)	Load address of base of array ly
261:     ST  3,-17(1)	Store parameter 
* END PARAM fred
262:    LDA  1,-14(1)	Load address of new frame 
263:    LDA  3,1(7)	Return address in ac 
264:    LDA  7,-223(7)	CALL fred
265:    LDA  3,0(2)	Save the result in ac 
* END CALL fred
* END COMPOUND
* Add standard closing in case there is no return statement
266:    LDC  2,0(6)	Set return value to 0 
267:     LD  3,-1(1)	Load return address 
268:     LD  1,0(1)	Adjust fp 
269:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,269(7)	Jump to init [backpatch] 
* INIT
270:     LD  0,0(0)	Set the global pointer 
271:    LDA  1,-24(0)	set first frame at end of globals 
272:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
273:    LDC  3,10(6)	load size of array gy
274:     ST  3,-1(0)	save size of array gy
275:    LDC  3,10(6)	load size of array sy
276:     ST  3,-13(0)	save size of array sy
* END INIT GLOBALS AND STATICS
277:    LDA  3,1(7)	Return address in ac 
278:    LDA  7,-42(7)	Jump to main 
279:   HALT  0,0,0	DONE! 
* END INIT
