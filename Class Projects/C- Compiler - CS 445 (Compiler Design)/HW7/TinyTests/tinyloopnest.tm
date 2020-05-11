* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyloopnest.c-
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
 44:     ST  3,-5(1)	save starting value in index variable 
 45:    LDC  3,8(6)	Load integer constant 
 46:     ST  3,-6(1)	save ending value 
 47:    LDC  3,1(6)	Load integer constant 
 48:     ST  3,-7(1)	save increment values 
 49:     LD  4,-5(1)	loop index 
 50:     LD  5,-6(1)	ending value 
 51:     LD  3,-7(1)	increment value 
 52:    SLT  3,4,5	Op < 
 53:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
 55:     ST  1,-8(1)	Store fp in ghost frame for output
* PARAM 1
 56:     LD  3,-5(1)	Load variable j
 57:     ST  3,-10(1)	Store parameter 
* END PARAM output
 58:    LDA  1,-8(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP INC AND JMP
 62:     LD  3,-5(1)	Load index 
 63:     LD  5,-7(1)	Load increment 
 64:    ADD  3,3,5	increment 
 65:     ST  3,-5(1)	store into index 
 66:    LDA  7,-18(7)	go to beginning of loop 
 54:    LDA  7,12(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL outnl
 67:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 68:    LDA  1,-5(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-34(7)	CALL outnl
 71:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* LOOP
 72:    LDC  3,8(6)	Load integer constant 
 73:     ST  3,-5(1)	save starting value in index variable 
 74:    LDC  3,0(6)	Load integer constant 
 75:     ST  3,-6(1)	save ending value 
 76:    LDC  3,1(6)	Load integer constant 
 77:    LDC  4,0(6)	Load 0 
 78:    SUB  3,4,3	Op unary - 
 79:     ST  3,-7(1)	save increment values 
 80:     LD  4,-5(1)	loop index 
 81:     LD  5,-6(1)	ending value 
 82:     LD  3,-7(1)	increment value 
 83:    SLT  3,4,5	Op < 
 84:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
 86:     ST  1,-8(1)	Store fp in ghost frame for output
* PARAM 1
 87:     LD  3,-5(1)	Load variable j
 88:     ST  3,-10(1)	Store parameter 
* END PARAM output
 89:    LDA  1,-8(1)	Load address of new frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    LDA  7,-86(7)	CALL output
 92:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP INC AND JMP
 93:     LD  3,-5(1)	Load index 
 94:     LD  5,-7(1)	Load increment 
 95:    ADD  3,3,5	increment 
 96:     ST  3,-5(1)	store into index 
 97:    LDA  7,-18(7)	go to beginning of loop 
 85:    LDA  7,12(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL outnl
 98:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 99:    LDA  1,-5(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-65(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
103:     ST  1,-5(1)	Store fp in ghost frame for output
* PARAM 1
104:    LDC  3,666(6)	Load integer constant 
105:     ST  3,-7(1)	Store parameter 
* END PARAM output
106:    LDA  1,-5(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
110:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
111:    LDA  1,-5(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-77(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* LOOP
115:    LDC  3,0(6)	Load integer constant 
116:     ST  3,-5(1)	save starting value in index variable 
117:    LDC  3,5(6)	Load integer constant 
118:     ST  3,-6(1)	save ending value 
119:    LDC  3,1(6)	Load integer constant 
120:     ST  3,-7(1)	save increment values 
121:     LD  4,-5(1)	loop index 
122:     LD  5,-6(1)	ending value 
123:     LD  3,-7(1)	increment value 
124:    SLT  3,4,5	Op < 
125:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
127:     ST  1,-8(1)	Store fp in ghost frame for output
* PARAM 1
128:     LD  3,-5(1)	Load variable i
129:     ST  3,-10(1)	Store parameter 
* END PARAM output
130:    LDA  1,-8(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP
134:    LDC  3,0(6)	Load integer constant 
135:     ST  3,-8(1)	save starting value in index variable 
136:    LDC  3,4(6)	Load integer constant 
137:     ST  3,-9(1)	save ending value 
138:    LDC  3,1(6)	Load integer constant 
139:     ST  3,-10(1)	save increment values 
140:     LD  4,-8(1)	loop index 
141:     LD  5,-9(1)	ending value 
142:     LD  3,-10(1)	increment value 
143:    SLT  3,4,5	Op < 
144:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
146:     ST  1,-11(1)	Store fp in ghost frame for output
* PARAM 1
147:     LD  3,-8(1)	Load variable j
148:     ST  3,-13(1)	Store parameter 
* END PARAM output
149:    LDA  1,-11(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-146(7)	CALL output
152:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP INC AND JMP
153:     LD  3,-8(1)	Load index 
154:     LD  5,-10(1)	Load increment 
155:    ADD  3,3,5	increment 
156:     ST  3,-8(1)	store into index 
157:    LDA  7,-18(7)	go to beginning of loop 
145:    LDA  7,12(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL outnl
158:     ST  1,-8(1)	Store fp in ghost frame for outnl
* END PARAM outnl
159:    LDA  1,-8(1)	Load address of new frame 
160:    LDA  3,1(7)	Return address in ac 
161:    LDA  7,-125(7)	CALL outnl
162:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* LOOP INC AND JMP
163:     LD  3,-5(1)	Load index 
164:     LD  5,-7(1)	Load increment 
165:    ADD  3,3,5	increment 
166:     ST  3,-5(1)	store into index 
167:    LDA  7,-47(7)	go to beginning of loop 
126:    LDA  7,41(7)	Jump past loop [backpatch] 
* END LOOP
* LOOP
168:    LDC  3,0(6)	Load integer constant 
169:     ST  3,-5(1)	save starting value in index variable 
170:    LDC  3,5(6)	Load integer constant 
171:     ST  3,-6(1)	save ending value 
172:    LDC  3,1(6)	Load integer constant 
173:     ST  3,-7(1)	save increment values 
174:     LD  4,-5(1)	loop index 
175:     LD  5,-6(1)	ending value 
176:     LD  3,-7(1)	increment value 
177:    SLT  3,4,5	Op < 
178:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
180:     ST  1,-8(1)	Store fp in ghost frame for output
* PARAM 1
181:     LD  3,-5(1)	Load variable i
182:     ST  3,-10(1)	Store parameter 
* END PARAM output
183:    LDA  1,-8(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-180(7)	CALL output
186:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP
187:     LD  3,-5(1)	Load variable i
188:     ST  3,-8(1)	save starting value in index variable 
189:    LDC  3,4(6)	Load integer constant 
190:     ST  3,-9(1)	save ending value 
191:    LDC  3,1(6)	Load integer constant 
192:     ST  3,-10(1)	save increment values 
193:     LD  4,-8(1)	loop index 
194:     LD  5,-9(1)	ending value 
195:     LD  3,-10(1)	increment value 
196:    SLT  3,4,5	Op < 
197:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
199:     ST  1,-11(1)	Store fp in ghost frame for output
* PARAM 1
200:     LD  3,-8(1)	Load variable j
201:     ST  3,-13(1)	Store parameter 
* END PARAM output
202:    LDA  1,-11(1)	Load address of new frame 
203:    LDA  3,1(7)	Return address in ac 
204:    LDA  7,-199(7)	CALL output
205:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP INC AND JMP
206:     LD  3,-8(1)	Load index 
207:     LD  5,-10(1)	Load increment 
208:    ADD  3,3,5	increment 
209:     ST  3,-8(1)	store into index 
210:    LDA  7,-18(7)	go to beginning of loop 
198:    LDA  7,12(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL outnl
211:     ST  1,-8(1)	Store fp in ghost frame for outnl
* END PARAM outnl
212:    LDA  1,-8(1)	Load address of new frame 
213:    LDA  3,1(7)	Return address in ac 
214:    LDA  7,-178(7)	CALL outnl
215:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* LOOP INC AND JMP
216:     LD  3,-5(1)	Load index 
217:     LD  5,-7(1)	Load increment 
218:    ADD  3,3,5	increment 
219:     ST  3,-5(1)	store into index 
220:    LDA  7,-47(7)	go to beginning of loop 
179:    LDA  7,41(7)	Jump past loop [backpatch] 
* END LOOP
* LOOP
221:    LDC  3,0(6)	Load integer constant 
222:     ST  3,-5(1)	save starting value in index variable 
223:    LDC  3,5(6)	Load integer constant 
224:     ST  3,-6(1)	save ending value 
225:    LDC  3,1(6)	Load integer constant 
226:     ST  3,-7(1)	save increment values 
227:     LD  4,-5(1)	loop index 
228:     LD  5,-6(1)	ending value 
229:     LD  3,-7(1)	increment value 
230:    SLT  3,4,5	Op < 
231:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
233:     ST  1,-8(1)	Store fp in ghost frame for output
* PARAM 1
234:     LD  3,-5(1)	Load variable i
235:     ST  3,-10(1)	Store parameter 
* END PARAM output
236:    LDA  1,-8(1)	Load address of new frame 
237:    LDA  3,1(7)	Return address in ac 
238:    LDA  7,-233(7)	CALL output
239:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP
240:    LDC  3,4(6)	Load integer constant 
241:     ST  3,-8(1)	save starting value in index variable 
242:     LD  3,-5(1)	Load variable i
243:     ST  3,-9(1)	save ending value 
244:    LDC  3,1(6)	Load integer constant 
245:    LDC  4,0(6)	Load 0 
246:    SUB  3,4,3	Op unary - 
247:     ST  3,-10(1)	save increment values 
248:     LD  4,-8(1)	loop index 
249:     LD  5,-9(1)	ending value 
250:     LD  3,-10(1)	increment value 
251:    SLT  3,4,5	Op < 
252:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
254:     ST  1,-11(1)	Store fp in ghost frame for output
* PARAM 1
255:     LD  3,-8(1)	Load variable j
256:     ST  3,-13(1)	Store parameter 
* END PARAM output
257:    LDA  1,-11(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-254(7)	CALL output
260:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* LOOP INC AND JMP
261:     LD  3,-8(1)	Load index 
262:     LD  5,-10(1)	Load increment 
263:    ADD  3,3,5	increment 
264:     ST  3,-8(1)	store into index 
265:    LDA  7,-18(7)	go to beginning of loop 
253:    LDA  7,12(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL outnl
266:     ST  1,-8(1)	Store fp in ghost frame for outnl
* END PARAM outnl
267:    LDA  1,-8(1)	Load address of new frame 
268:    LDA  3,1(7)	Return address in ac 
269:    LDA  7,-233(7)	CALL outnl
270:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* LOOP INC AND JMP
271:     LD  3,-5(1)	Load index 
272:     LD  5,-7(1)	Load increment 
273:    ADD  3,3,5	increment 
274:     ST  3,-5(1)	store into index 
275:    LDA  7,-49(7)	go to beginning of loop 
232:    LDA  7,43(7)	Jump past loop [backpatch] 
* END LOOP
* END COMPOUND
* Add standard closing in case there is no return statement
276:    LDC  2,0(6)	Set return value to 0 
277:     LD  3,-1(1)	Load return address 
278:     LD  1,0(1)	Adjust fp 
279:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,279(7)	Jump to init [backpatch] 
* INIT
280:     LD  0,0(0)	Set the global pointer 
281:    LDA  1,0(0)	set first frame at end of globals 
282:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
283:    LDA  3,1(7)	Return address in ac 
284:    LDA  7,-243(7)	Jump to main 
285:   HALT  0,0,0	DONE! 
* END INIT
