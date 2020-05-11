* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  j00.c-
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
* RETURN
 43:     LD  3,-2(1)	Load address of base of array x
 44:     ST  3,-4(1)	Save left side 
 45:     LD  3,-3(1)	Load variable i
 46:     LD  4,-4(1)	Load left into ac1 
 47:    SUB  3,4,3	compute location from index 
 48:     LD  3,0(3)	Load array element 
 49:    LDA  2,0(3)	Copy result to rt register 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 53:    LDC  2,0(6)	Set return value to 0 
 54:     LD  3,-1(1)	Load return address 
 55:     LD  1,0(1)	Adjust fp 
 56:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 57:     ST  3,-1(1)	Store return address 
* RETURN
* CALL cat
 58:     ST  1,-4(1)	Store fp in ghost frame for cat
* PARAM 1
 59:     LD  3,-2(1)	Load address of base of array x
 60:     ST  3,-6(1)	Store parameter 
* PARAM 2
 61:     LD  3,-3(1)	Load variable i
 62:     ST  3,-7(1)	Store parameter 
* END PARAM cat
 63:    LDA  1,-4(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-24(7)	CALL cat
 66:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
 67:    LDA  2,0(3)	Copy result to rt register 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fox
 75:     ST  3,-1(1)	Store return address 
* RETURN
* CALL dog
 76:     ST  1,-4(1)	Store fp in ghost frame for dog
* PARAM 1
 77:     LD  3,-2(1)	Load address of base of array x
 78:     ST  3,-6(1)	Store parameter 
* PARAM 2
 79:     LD  3,-3(1)	Load variable i
 80:     ST  3,-7(1)	Store parameter 
* END PARAM dog
 81:    LDA  1,-4(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-27(7)	CALL dog
 84:    LDA  3,0(2)	Save the result in ac 
* END CALL dog
 85:    LDA  2,0(3)	Copy result to rt register 
 86:     LD  3,-1(1)	Load return address 
 87:     LD  1,0(1)	Adjust fp 
 88:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6)	Set return value to 0 
 90:     LD  3,-1(1)	Load return address 
 91:     LD  1,0(1)	Adjust fp 
 92:    LDA  7,0(3)	Return 
* END FUNCTION fox
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 93:     ST  3,-1(1)	Store return address 
* COMPOUND
 94:    LDC  3,10(6)	load size of array h
 95:     ST  3,-3(1)	save size of array h
* Compound Body
* EXPRESSION
 96:    LDC  3,1(6)	Load integer constant 
 97:     ST  3,-2(1)	Store variable i
* WHILE
 98:     LD  3,-2(1)	Load variable i
 99:     ST  3,-14(1)	Save left side 
100:    LDC  3,10(6)	Load integer constant 
101:     LD  4,-14(1)	Load left into ac1 
102:    TLT  3,4,3	Op < 
103:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
105:     LD  3,-2(1)	Load variable i
106:     ST  3,-14(1)	Save index 
107:     LD  3,-2(1)	Load variable i
108:     ST  3,-15(1)	Save index 
109:     LD  3,-2(1)	Load variable i
110:     ST  3,-16(1)	Save index 
111:     LD  3,-2(1)	load lhs variable i
112:    LDA  3,1(3)	increment value of i
113:     ST  3,-2(1)	Store variable i
114:     LD  4,-16(1)	Restore index 
115:    LDA  5,-12(0)	Load address of base of array s
116:    SUB  5,5,4	Compute offset of value 
117:     ST  3,0(5)	Store variable s
118:     LD  4,-15(1)	Restore index 
119:    LDA  5,-1(0)	Load address of base of array g
120:    SUB  5,5,4	Compute offset of value 
121:     ST  3,0(5)	Store variable g
122:     LD  4,-14(1)	Restore index 
123:    LDA  5,-4(1)	Load address of base of array h
124:    SUB  5,5,4	Compute offset of value 
125:     ST  3,0(5)	Store variable h
126:    LDA  7,-29(7)	go to beginning of loop 
104:    LDA  7,22(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
127:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
128:    LDA  3,-1(0)	Load address of base of array g
129:     ST  3,-16(1)	Save left side 
130:    LDC  3,6(6)	Load integer constant 
131:     LD  4,-16(1)	Load left into ac1 
132:    SUB  3,4,3	compute location from index 
133:     LD  3,0(3)	Load array element 
134:     ST  3,-16(1)	Store parameter 
* END PARAM output
135:    LDA  1,-14(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
139:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
140:    LDA  3,-4(1)	Load address of base of array h
141:     ST  3,-16(1)	Save left side 
142:    LDC  3,6(6)	Load integer constant 
143:     LD  4,-16(1)	Load left into ac1 
144:    SUB  3,4,3	compute location from index 
145:     LD  3,0(3)	Load array element 
146:     ST  3,-16(1)	Store parameter 
* END PARAM output
147:    LDA  1,-14(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
151:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
152:    LDA  3,-12(0)	Load address of base of array s
153:     ST  3,-16(1)	Save left side 
154:    LDC  3,6(6)	Load integer constant 
155:     LD  4,-16(1)	Load left into ac1 
156:    SUB  3,4,3	compute location from index 
157:     LD  3,0(3)	Load array element 
158:     ST  3,-16(1)	Store parameter 
* END PARAM output
159:    LDA  1,-14(1)	Load address of new frame 
160:    LDA  3,1(7)	Return address in ac 
161:    LDA  7,-156(7)	CALL output
162:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
163:     ST  1,-14(1)	Store fp in ghost frame for outnl
* END PARAM outnl
164:    LDA  1,-14(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-130(7)	CALL outnl
167:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
168:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL cat
169:     ST  1,-16(1)	Store fp in ghost frame for cat
* PARAM 1
170:    LDA  3,-1(0)	Load address of base of array g
171:     ST  3,-18(1)	Store parameter 
* PARAM 2
172:    LDC  3,6(6)	Load integer constant 
173:     ST  3,-19(1)	Store parameter 
* END PARAM cat
174:    LDA  1,-16(1)	Load address of new frame 
175:    LDA  3,1(7)	Return address in ac 
176:    LDA  7,-135(7)	CALL cat
177:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
178:     ST  3,-16(1)	Store parameter 
* END PARAM output
179:    LDA  1,-14(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-176(7)	CALL output
182:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
183:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL cat
184:     ST  1,-16(1)	Store fp in ghost frame for cat
* PARAM 1
185:    LDA  3,-4(1)	Load address of base of array h
186:     ST  3,-18(1)	Store parameter 
* PARAM 2
187:    LDC  3,6(6)	Load integer constant 
188:     ST  3,-19(1)	Store parameter 
* END PARAM cat
189:    LDA  1,-16(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-150(7)	CALL cat
192:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
193:     ST  3,-16(1)	Store parameter 
* END PARAM output
194:    LDA  1,-14(1)	Load address of new frame 
195:    LDA  3,1(7)	Return address in ac 
196:    LDA  7,-191(7)	CALL output
197:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
198:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL cat
199:     ST  1,-16(1)	Store fp in ghost frame for cat
* PARAM 1
200:    LDA  3,-12(0)	Load address of base of array s
201:     ST  3,-18(1)	Store parameter 
* PARAM 2
202:    LDC  3,6(6)	Load integer constant 
203:     ST  3,-19(1)	Store parameter 
* END PARAM cat
204:    LDA  1,-16(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-165(7)	CALL cat
207:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
208:     ST  3,-16(1)	Store parameter 
* END PARAM output
209:    LDA  1,-14(1)	Load address of new frame 
210:    LDA  3,1(7)	Return address in ac 
211:    LDA  7,-206(7)	CALL output
212:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
213:     ST  1,-14(1)	Store fp in ghost frame for outnl
* END PARAM outnl
214:    LDA  1,-14(1)	Load address of new frame 
215:    LDA  3,1(7)	Return address in ac 
216:    LDA  7,-180(7)	CALL outnl
217:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
218:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL dog
219:     ST  1,-16(1)	Store fp in ghost frame for dog
* PARAM 1
220:    LDA  3,-1(0)	Load address of base of array g
221:     ST  3,-18(1)	Store parameter 
* PARAM 2
222:    LDC  3,6(6)	Load integer constant 
223:     ST  3,-19(1)	Store parameter 
* END PARAM dog
224:    LDA  1,-16(1)	Load address of new frame 
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-170(7)	CALL dog
227:    LDA  3,0(2)	Save the result in ac 
* END CALL dog
228:     ST  3,-16(1)	Store parameter 
* END PARAM output
229:    LDA  1,-14(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-226(7)	CALL output
232:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
233:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL dog
234:     ST  1,-16(1)	Store fp in ghost frame for dog
* PARAM 1
235:    LDA  3,-4(1)	Load address of base of array h
236:     ST  3,-18(1)	Store parameter 
* PARAM 2
237:    LDC  3,6(6)	Load integer constant 
238:     ST  3,-19(1)	Store parameter 
* END PARAM dog
239:    LDA  1,-16(1)	Load address of new frame 
240:    LDA  3,1(7)	Return address in ac 
241:    LDA  7,-185(7)	CALL dog
242:    LDA  3,0(2)	Save the result in ac 
* END CALL dog
243:     ST  3,-16(1)	Store parameter 
* END PARAM output
244:    LDA  1,-14(1)	Load address of new frame 
245:    LDA  3,1(7)	Return address in ac 
246:    LDA  7,-241(7)	CALL output
247:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
248:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL dog
249:     ST  1,-16(1)	Store fp in ghost frame for dog
* PARAM 1
250:    LDA  3,-12(0)	Load address of base of array s
251:     ST  3,-18(1)	Store parameter 
* PARAM 2
252:    LDC  3,6(6)	Load integer constant 
253:     ST  3,-19(1)	Store parameter 
* END PARAM dog
254:    LDA  1,-16(1)	Load address of new frame 
255:    LDA  3,1(7)	Return address in ac 
256:    LDA  7,-200(7)	CALL dog
257:    LDA  3,0(2)	Save the result in ac 
* END CALL dog
258:     ST  3,-16(1)	Store parameter 
* END PARAM output
259:    LDA  1,-14(1)	Load address of new frame 
260:    LDA  3,1(7)	Return address in ac 
261:    LDA  7,-256(7)	CALL output
262:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
263:     ST  1,-14(1)	Store fp in ghost frame for outnl
* END PARAM outnl
264:    LDA  1,-14(1)	Load address of new frame 
265:    LDA  3,1(7)	Return address in ac 
266:    LDA  7,-230(7)	CALL outnl
267:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
268:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL fox
269:     ST  1,-16(1)	Store fp in ghost frame for fox
* PARAM 1
270:    LDA  3,-1(0)	Load address of base of array g
271:     ST  3,-18(1)	Store parameter 
* PARAM 2
272:    LDC  3,6(6)	Load integer constant 
273:     ST  3,-19(1)	Store parameter 
* END PARAM fox
274:    LDA  1,-16(1)	Load address of new frame 
275:    LDA  3,1(7)	Return address in ac 
276:    LDA  7,-202(7)	CALL fox
277:    LDA  3,0(2)	Save the result in ac 
* END CALL fox
278:     ST  3,-16(1)	Store parameter 
* END PARAM output
279:    LDA  1,-14(1)	Load address of new frame 
280:    LDA  3,1(7)	Return address in ac 
281:    LDA  7,-276(7)	CALL output
282:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
283:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL fox
284:     ST  1,-16(1)	Store fp in ghost frame for fox
* PARAM 1
285:    LDA  3,-4(1)	Load address of base of array h
286:     ST  3,-18(1)	Store parameter 
* PARAM 2
287:    LDC  3,6(6)	Load integer constant 
288:     ST  3,-19(1)	Store parameter 
* END PARAM fox
289:    LDA  1,-16(1)	Load address of new frame 
290:    LDA  3,1(7)	Return address in ac 
291:    LDA  7,-217(7)	CALL fox
292:    LDA  3,0(2)	Save the result in ac 
* END CALL fox
293:     ST  3,-16(1)	Store parameter 
* END PARAM output
294:    LDA  1,-14(1)	Load address of new frame 
295:    LDA  3,1(7)	Return address in ac 
296:    LDA  7,-291(7)	CALL output
297:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
298:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
* CALL fox
299:     ST  1,-16(1)	Store fp in ghost frame for fox
* PARAM 1
300:    LDA  3,-12(0)	Load address of base of array s
301:     ST  3,-18(1)	Store parameter 
* PARAM 2
302:    LDC  3,6(6)	Load integer constant 
303:     ST  3,-19(1)	Store parameter 
* END PARAM fox
304:    LDA  1,-16(1)	Load address of new frame 
305:    LDA  3,1(7)	Return address in ac 
306:    LDA  7,-232(7)	CALL fox
307:    LDA  3,0(2)	Save the result in ac 
* END CALL fox
308:     ST  3,-16(1)	Store parameter 
* END PARAM output
309:    LDA  1,-14(1)	Load address of new frame 
310:    LDA  3,1(7)	Return address in ac 
311:    LDA  7,-306(7)	CALL output
312:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
313:     ST  1,-14(1)	Store fp in ghost frame for outnl
* END PARAM outnl
314:    LDA  1,-14(1)	Load address of new frame 
315:    LDA  3,1(7)	Return address in ac 
316:    LDA  7,-280(7)	CALL outnl
317:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
318:    LDC  2,0(6)	Set return value to 0 
319:     LD  3,-1(1)	Load return address 
320:     LD  1,0(1)	Adjust fp 
321:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,321(7)	Jump to init [backpatch] 
* INIT
322:     LD  0,0(0)	Set the global pointer 
323:    LDA  1,-22(0)	set first frame at end of globals 
324:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
325:    LDC  3,10(6)	load size of array g
326:     ST  3,0(0)	save size of array g
327:    LDC  3,10(6)	load size of array s
328:     ST  3,-11(0)	save size of array s
* END INIT GLOBALS AND STATICS
329:    LDA  3,1(7)	Return address in ac 
330:    LDA  7,-238(7)	Jump to main 
331:   HALT  0,0,0	DONE! 
* END INIT
