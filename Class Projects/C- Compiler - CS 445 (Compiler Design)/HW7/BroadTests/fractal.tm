* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  fractal.c-
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
* FUNCTION Mandelbrot
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* WHILE
 43:     LD  3,0(0)	Load variable TOP
 44:     ST  3,-3(1)	Save left side 
 45:     LD  3,-7(0)	Load variable YMax
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 50:    LDC  3,512(6)	Load integer constant 
 51:    LDC  4,0(6)	Load 0 
 52:    SUB  3,4,3	Op unary - 
 53:     ST  3,-1(0)	Store variable LEFT
* WHILE
 54:     LD  3,-1(0)	Load variable LEFT
 55:     ST  3,-3(1)	Save left side 
 56:     LD  3,-6(0)	Load variable XMax
 57:     LD  4,-3(1)	Load left into ac1 
 58:    TLT  3,4,3	Op < 
 59:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 61:     LD  3,-1(0)	Load variable LEFT
 62:     ST  3,-5(1)	Store variable A
* EXPRESSION
 63:     LD  3,0(0)	Load variable TOP
 64:     ST  3,-4(1)	Store variable Bi
* EXPRESSION
 65:     LD  3,-5(1)	Load variable A
 66:     ST  3,-9(1)	Save left side 
 67:     LD  3,-5(1)	Load variable A
 68:     LD  4,-9(1)	Load left into ac1 
 69:    MUL  3,4,3	Op * 
 70:     ST  3,-9(1)	Save left side 
 71:    LDC  3,256(6)	Load integer constant 
 72:     LD  4,-9(1)	Load left into ac1 
 73:    DIV  3,4,3	Op / 
 74:     ST  3,-6(1)	Store variable NextA
* EXPRESSION
 75:     LD  3,-4(1)	Load variable Bi
 76:     ST  3,-9(1)	Save left side 
 77:     LD  3,-4(1)	Load variable Bi
 78:     LD  4,-9(1)	Load left into ac1 
 79:    MUL  3,4,3	Op * 
 80:     ST  3,-9(1)	Save left side 
 81:    LDC  3,256(6)	Load integer constant 
 82:     LD  4,-9(1)	Load left into ac1 
 83:    DIV  3,4,3	Op / 
 84:     ST  3,-7(1)	Store variable NextBi
* EXPRESSION
 85:     LD  3,-6(1)	Load variable NextA
 86:     ST  3,-9(1)	Save left side 
 87:     LD  3,-7(1)	Load variable NextBi
 88:     LD  4,-9(1)	Load left into ac1 
 89:    ADD  3,4,3	Op + 
 90:     ST  3,-3(1)	Store variable Len
* EXPRESSION
 91:    LDC  3,0(6)	Load integer constant 
 92:     ST  3,-8(0)	Store variable iter
* WHILE
 93:     LD  3,-3(1)	Load variable Len
 94:     ST  3,-8(1)	Save left side 
 95:    LDC  3,1024(6)	Load integer constant 
 96:     LD  4,-8(1)	Load left into ac1 
 97:    TLE  3,4,3	Op <= 
 98:     ST  3,-8(1)	Save left side 
 99:     LD  3,-8(0)	Load variable iter
100:     ST  3,-9(1)	Save left side 
101:    LDC  3,11(6)	Load integer constant 
102:     LD  4,-9(1)	Load left into ac1 
103:    TLT  3,4,3	Op < 
104:     LD  4,-8(1)	Load left into ac1 
105:    AND  3,4,3	Op AND 
106:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
108:    LDC  3,2(6)	Load integer constant 
109:     ST  3,-9(1)	Save left side 
110:     LD  3,-5(1)	Load variable A
111:     ST  3,-10(1)	Save left side 
112:     LD  3,-4(1)	Load variable Bi
113:     LD  4,-10(1)	Load left into ac1 
114:    MUL  3,4,3	Op * 
115:     LD  4,-9(1)	Load left into ac1 
116:    MUL  3,4,3	Op * 
117:     ST  3,-9(1)	Save left side 
118:    LDC  3,256(6)	Load integer constant 
119:     LD  4,-9(1)	Load left into ac1 
120:    DIV  3,4,3	Op / 
121:     ST  3,-9(1)	Save left side 
122:     LD  3,0(0)	Load variable TOP
123:     LD  4,-9(1)	Load left into ac1 
124:    ADD  3,4,3	Op + 
125:     ST  3,-4(1)	Store variable Bi
* EXPRESSION
126:     LD  3,-6(1)	Load variable NextA
127:     ST  3,-9(1)	Save left side 
128:     LD  3,-7(1)	Load variable NextBi
129:     LD  4,-9(1)	Load left into ac1 
130:    SUB  3,4,3	Op - 
131:     ST  3,-9(1)	Save left side 
132:     LD  3,-1(0)	Load variable LEFT
133:     LD  4,-9(1)	Load left into ac1 
134:    ADD  3,4,3	Op + 
135:     ST  3,-5(1)	Store variable A
* EXPRESSION
136:     LD  3,-5(1)	Load variable A
137:     ST  3,-9(1)	Save left side 
138:     LD  3,-5(1)	Load variable A
139:     LD  4,-9(1)	Load left into ac1 
140:    MUL  3,4,3	Op * 
141:     ST  3,-9(1)	Save left side 
142:    LDC  3,256(6)	Load integer constant 
143:     LD  4,-9(1)	Load left into ac1 
144:    DIV  3,4,3	Op / 
145:     ST  3,-6(1)	Store variable NextA
* EXPRESSION
146:     LD  3,-4(1)	Load variable Bi
147:     ST  3,-9(1)	Save left side 
148:     LD  3,-4(1)	Load variable Bi
149:     LD  4,-9(1)	Load left into ac1 
150:    MUL  3,4,3	Op * 
151:     ST  3,-9(1)	Save left side 
152:    LDC  3,256(6)	Load integer constant 
153:     LD  4,-9(1)	Load left into ac1 
154:    DIV  3,4,3	Op / 
155:     ST  3,-7(1)	Store variable NextBi
* EXPRESSION
156:     LD  3,-6(1)	Load variable NextA
157:     ST  3,-9(1)	Save left side 
158:     LD  3,-7(1)	Load variable NextBi
159:     LD  4,-9(1)	Load left into ac1 
160:    ADD  3,4,3	Op + 
161:     ST  3,-3(1)	Store variable Len
* EXPRESSION
162:     LD  3,-8(0)	load lhs variable iter
163:    LDA  3,1(3)	increment value of iter
164:     ST  3,-8(0)	Store variable iter
* END COMPOUND
165:    LDA  7,-73(7)	go to beginning of loop 
107:    LDA  7,58(7)	Jump past loop [backpatch] 
* END WHILE
* IF
166:     LD  3,-8(0)	Load variable iter
167:     ST  3,-8(1)	Save left side 
168:    LDC  3,12(6)	Load integer constant 
169:     LD  4,-8(1)	Load left into ac1 
170:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
* CALL outputc
172:     ST  1,-8(1)	Store fp in ghost frame for outputc
* PARAM 1
173:    LDA  3,-10(0)	Load address of base of array grayScale
174:     ST  3,-10(1)	Save left side 
175:     LD  3,-8(0)	Load variable iter
176:     LD  4,-10(1)	Load left into ac1 
177:    SUB  3,4,3	compute location from index 
178:     LD  3,0(3)	Load array element 
179:     ST  3,-10(1)	Store parameter 
* END PARAM outputc
180:    LDA  1,-8(1)	Load address of new frame 
181:    LDA  3,1(7)	Return address in ac 
182:    LDA  7,-153(7)	CALL outputc
183:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputc
184:     ST  1,-8(1)	Store fp in ghost frame for outputc
* PARAM 1
185:    LDC  3,32(6)	Load char constant 
186:     ST  3,-10(1)	Store parameter 
* END PARAM outputc
187:    LDA  1,-8(1)	Load address of new frame 
188:    LDA  3,1(7)	Return address in ac 
189:    LDA  7,-160(7)	CALL outputc
190:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* END COMPOUND
171:    JZR  3,19(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
191:     LD  3,-8(0)	Load variable iter
192:     ST  3,-8(1)	Save left side 
193:    LDC  3,11(6)	Load integer constant 
194:     LD  4,-8(1)	Load left into ac1 
195:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
197:    LDC  3,0(6)	Load integer constant 
198:     ST  3,-8(1)	Save index 
199:     LD  3,-1(0)	Load variable LEFT
200:     LD  4,-8(1)	Restore index 
201:     LD  5,-2(1)	Load address of base of array JuliaVals
202:    SUB  5,5,4	Compute offset of value 
203:     ST  3,0(5)	Store variable JuliaVals
* EXPRESSION
204:    LDC  3,1(6)	Load integer constant 
205:     ST  3,-8(1)	Save index 
206:     LD  3,0(0)	Load variable TOP
207:     LD  4,-8(1)	Restore index 
208:     LD  5,-2(1)	Load address of base of array JuliaVals
209:    SUB  5,5,4	Compute offset of value 
210:     ST  3,0(5)	Store variable JuliaVals
* END COMPOUND
196:    JZR  3,14(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
211:     LD  3,-4(0)	Load variable XStep
212:     LD  4,-1(0)	load lhs variable LEFT
213:    ADD  3,4,3	op += 
214:     ST  3,-1(0)	Store variable LEFT
* END COMPOUND
215:    LDA  7,-162(7)	go to beginning of loop 
 60:    LDA  7,155(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
216:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
217:    LDA  1,-3(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-183(7)	CALL outnl
220:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
221:     LD  3,-5(0)	Load variable YStep
222:     LD  4,0(0)	load lhs variable TOP
223:    ADD  3,4,3	op += 
224:     ST  3,0(0)	Store variable TOP
* END COMPOUND
225:    LDA  7,-183(7)	go to beginning of loop 
 49:    LDA  7,176(7)	Jump past loop [backpatch] 
* END WHILE
* END COMPOUND
* Add standard closing in case there is no return statement
226:    LDC  2,0(6)	Set return value to 0 
227:     LD  3,-1(1)	Load return address 
228:     LD  1,0(1)	Adjust fp 
229:    LDA  7,0(3)	Return 
* END FUNCTION Mandelbrot
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Julia
230:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* WHILE
231:     LD  3,0(0)	Load variable TOP
232:     ST  3,-4(1)	Save left side 
233:     LD  3,-7(0)	Load variable YMax
234:     LD  4,-4(1)	Load left into ac1 
235:    TLT  3,4,3	Op < 
236:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
238:    LDC  3,512(6)	Load integer constant 
239:    LDC  4,0(6)	Load 0 
240:    SUB  3,4,3	Op unary - 
241:     ST  3,-1(0)	Store variable LEFT
* WHILE
242:     LD  3,-1(0)	Load variable LEFT
243:     ST  3,-4(1)	Save left side 
244:     LD  3,-6(0)	Load variable XMax
245:     LD  4,-4(1)	Load left into ac1 
246:    TLT  3,4,3	Op < 
247:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
249:     LD  3,-1(0)	Load variable LEFT
250:     ST  3,-6(1)	Store variable A
* EXPRESSION
251:     LD  3,0(0)	Load variable TOP
252:     ST  3,-5(1)	Store variable Bi
* EXPRESSION
253:     LD  3,-6(1)	Load variable A
254:     ST  3,-10(1)	Save left side 
255:     LD  3,-6(1)	Load variable A
256:     LD  4,-10(1)	Load left into ac1 
257:    MUL  3,4,3	Op * 
258:     ST  3,-10(1)	Save left side 
259:    LDC  3,256(6)	Load integer constant 
260:     LD  4,-10(1)	Load left into ac1 
261:    DIV  3,4,3	Op / 
262:     ST  3,-7(1)	Store variable NextA
* EXPRESSION
263:     LD  3,-5(1)	Load variable Bi
264:     ST  3,-10(1)	Save left side 
265:     LD  3,-5(1)	Load variable Bi
266:     LD  4,-10(1)	Load left into ac1 
267:    MUL  3,4,3	Op * 
268:     ST  3,-10(1)	Save left side 
269:    LDC  3,256(6)	Load integer constant 
270:     LD  4,-10(1)	Load left into ac1 
271:    DIV  3,4,3	Op / 
272:     ST  3,-8(1)	Store variable NextBi
* EXPRESSION
273:     LD  3,-7(1)	Load variable NextA
274:     ST  3,-10(1)	Save left side 
275:     LD  3,-8(1)	Load variable NextBi
276:     LD  4,-10(1)	Load left into ac1 
277:    ADD  3,4,3	Op + 
278:     ST  3,-4(1)	Store variable Len
* EXPRESSION
279:    LDC  3,0(6)	Load integer constant 
280:     ST  3,-8(0)	Store variable iter
* WHILE
281:     LD  3,-4(1)	Load variable Len
282:     ST  3,-9(1)	Save left side 
283:    LDC  3,1024(6)	Load integer constant 
284:     LD  4,-9(1)	Load left into ac1 
285:    TLE  3,4,3	Op <= 
286:     ST  3,-9(1)	Save left side 
287:     LD  3,-8(0)	Load variable iter
288:     ST  3,-10(1)	Save left side 
289:    LDC  3,11(6)	Load integer constant 
290:     LD  4,-10(1)	Load left into ac1 
291:    TLT  3,4,3	Op < 
292:     LD  4,-9(1)	Load left into ac1 
293:    AND  3,4,3	Op AND 
294:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
296:    LDC  3,2(6)	Load integer constant 
297:     ST  3,-10(1)	Save left side 
298:     LD  3,-6(1)	Load variable A
299:     ST  3,-11(1)	Save left side 
300:     LD  3,-5(1)	Load variable Bi
301:     LD  4,-11(1)	Load left into ac1 
302:    MUL  3,4,3	Op * 
303:     LD  4,-10(1)	Load left into ac1 
304:    MUL  3,4,3	Op * 
305:     ST  3,-10(1)	Save left side 
306:    LDC  3,256(6)	Load integer constant 
307:     LD  4,-10(1)	Load left into ac1 
308:    DIV  3,4,3	Op / 
309:     ST  3,-10(1)	Save left side 
310:     LD  3,-3(1)	Load variable CBi
311:     LD  4,-10(1)	Load left into ac1 
312:    ADD  3,4,3	Op + 
313:     ST  3,-5(1)	Store variable Bi
* EXPRESSION
314:     LD  3,-7(1)	Load variable NextA
315:     ST  3,-10(1)	Save left side 
316:     LD  3,-8(1)	Load variable NextBi
317:     LD  4,-10(1)	Load left into ac1 
318:    SUB  3,4,3	Op - 
319:     ST  3,-10(1)	Save left side 
320:     LD  3,-2(1)	Load variable CA
321:     LD  4,-10(1)	Load left into ac1 
322:    ADD  3,4,3	Op + 
323:     ST  3,-6(1)	Store variable A
* EXPRESSION
324:     LD  3,-6(1)	Load variable A
325:     ST  3,-10(1)	Save left side 
326:     LD  3,-6(1)	Load variable A
327:     LD  4,-10(1)	Load left into ac1 
328:    MUL  3,4,3	Op * 
329:     ST  3,-10(1)	Save left side 
330:    LDC  3,256(6)	Load integer constant 
331:     LD  4,-10(1)	Load left into ac1 
332:    DIV  3,4,3	Op / 
333:     ST  3,-7(1)	Store variable NextA
* EXPRESSION
334:     LD  3,-5(1)	Load variable Bi
335:     ST  3,-10(1)	Save left side 
336:     LD  3,-5(1)	Load variable Bi
337:     LD  4,-10(1)	Load left into ac1 
338:    MUL  3,4,3	Op * 
339:     ST  3,-10(1)	Save left side 
340:    LDC  3,256(6)	Load integer constant 
341:     LD  4,-10(1)	Load left into ac1 
342:    DIV  3,4,3	Op / 
343:     ST  3,-8(1)	Store variable NextBi
* EXPRESSION
344:     LD  3,-7(1)	Load variable NextA
345:     ST  3,-10(1)	Save left side 
346:     LD  3,-8(1)	Load variable NextBi
347:     LD  4,-10(1)	Load left into ac1 
348:    ADD  3,4,3	Op + 
349:     ST  3,-4(1)	Store variable Len
* EXPRESSION
350:     LD  3,-8(0)	load lhs variable iter
351:    LDA  3,1(3)	increment value of iter
352:     ST  3,-8(0)	Store variable iter
* END COMPOUND
353:    LDA  7,-73(7)	go to beginning of loop 
295:    LDA  7,58(7)	Jump past loop [backpatch] 
* END WHILE
* IF
354:     LD  3,-8(0)	Load variable iter
355:     ST  3,-9(1)	Save left side 
356:    LDC  3,10(6)	Load integer constant 
357:     LD  4,-9(1)	Load left into ac1 
358:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
* CALL outputc
360:     ST  1,-9(1)	Store fp in ghost frame for outputc
* PARAM 1
361:    LDA  3,-10(0)	Load address of base of array grayScale
362:     ST  3,-11(1)	Save left side 
363:     LD  3,-8(0)	Load variable iter
364:     LD  4,-11(1)	Load left into ac1 
365:    SUB  3,4,3	compute location from index 
366:     LD  3,0(3)	Load array element 
367:     ST  3,-11(1)	Store parameter 
* END PARAM outputc
368:    LDA  1,-9(1)	Load address of new frame 
369:    LDA  3,1(7)	Return address in ac 
370:    LDA  7,-341(7)	CALL outputc
371:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputc
372:     ST  1,-9(1)	Store fp in ghost frame for outputc
* PARAM 1
373:    LDC  3,32(6)	Load char constant 
374:     ST  3,-11(1)	Store parameter 
* END PARAM outputc
375:    LDA  1,-9(1)	Load address of new frame 
376:    LDA  3,1(7)	Return address in ac 
377:    LDA  7,-348(7)	CALL outputc
378:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* END COMPOUND
359:    JZR  3,20(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputb
380:     ST  1,-9(1)	Store fp in ghost frame for outputb
* PARAM 1
381:     LD  3,-8(0)	Load variable iter
382:     ST  3,-11(1)	Save left side 
383:    LDC  3,11(6)	Load integer constant 
384:     LD  4,-11(1)	Load left into ac1 
385:    TEQ  3,4,3	Op == 
386:     ST  3,-11(1)	Store parameter 
* END PARAM outputb
387:    LDA  1,-9(1)	Load address of new frame 
388:    LDA  3,1(7)	Return address in ac 
389:    LDA  7,-372(7)	CALL outputb
390:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
379:    LDA  7,11(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
391:     LD  3,-4(0)	Load variable XStep
392:     LD  4,-1(0)	load lhs variable LEFT
393:    ADD  3,4,3	op += 
394:     ST  3,-1(0)	Store variable LEFT
* END COMPOUND
395:    LDA  7,-154(7)	go to beginning of loop 
248:    LDA  7,147(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
396:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
397:    LDA  1,-4(1)	Load address of new frame 
398:    LDA  3,1(7)	Return address in ac 
399:    LDA  7,-363(7)	CALL outnl
400:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
401:     LD  3,-5(0)	Load variable YStep
402:     LD  4,0(0)	load lhs variable TOP
403:    ADD  3,4,3	op += 
404:     ST  3,0(0)	Store variable TOP
* END COMPOUND
405:    LDA  7,-175(7)	go to beginning of loop 
237:    LDA  7,168(7)	Jump past loop [backpatch] 
* END WHILE
* END COMPOUND
* Add standard closing in case there is no return statement
406:    LDC  2,0(6)	Set return value to 0 
407:     LD  3,-1(1)	Load return address 
408:     LD  1,0(1)	Adjust fp 
409:    LDA  7,0(3)	Return 
* END FUNCTION Julia
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
410:     ST  3,-1(1)	Store return address 
* COMPOUND
411:    LDC  3,2(6)	load size of array JuliaVals
412:     ST  3,-2(1)	save size of array JuliaVals
* Compound Body
* EXPRESSION
413:    LDC  3,0(6)	Load integer constant 
414:     ST  3,-5(1)	Save index 
415:    LDC  3,32(6)	Load char constant 
416:     LD  4,-5(1)	Restore index 
417:    LDA  5,-10(0)	Load address of base of array grayScale
418:    SUB  5,5,4	Compute offset of value 
419:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
420:    LDC  3,1(6)	Load integer constant 
421:     ST  3,-5(1)	Save index 
422:    LDC  3,46(6)	Load char constant 
423:     LD  4,-5(1)	Restore index 
424:    LDA  5,-10(0)	Load address of base of array grayScale
425:    SUB  5,5,4	Compute offset of value 
426:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
427:    LDC  3,2(6)	Load integer constant 
428:     ST  3,-5(1)	Save index 
429:    LDC  3,58(6)	Load char constant 
430:     LD  4,-5(1)	Restore index 
431:    LDA  5,-10(0)	Load address of base of array grayScale
432:    SUB  5,5,4	Compute offset of value 
433:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
434:    LDC  3,3(6)	Load integer constant 
435:     ST  3,-5(1)	Save index 
436:    LDC  3,59(6)	Load char constant 
437:     LD  4,-5(1)	Restore index 
438:    LDA  5,-10(0)	Load address of base of array grayScale
439:    SUB  5,5,4	Compute offset of value 
440:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
441:    LDC  3,4(6)	Load integer constant 
442:     ST  3,-5(1)	Save index 
443:    LDC  3,45(6)	Load char constant 
444:     LD  4,-5(1)	Restore index 
445:    LDA  5,-10(0)	Load address of base of array grayScale
446:    SUB  5,5,4	Compute offset of value 
447:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
448:    LDC  3,5(6)	Load integer constant 
449:     ST  3,-5(1)	Save index 
450:    LDC  3,43(6)	Load char constant 
451:     LD  4,-5(1)	Restore index 
452:    LDA  5,-10(0)	Load address of base of array grayScale
453:    SUB  5,5,4	Compute offset of value 
454:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
455:    LDC  3,6(6)	Load integer constant 
456:     ST  3,-5(1)	Save index 
457:    LDC  3,73(6)	Load char constant 
458:     LD  4,-5(1)	Restore index 
459:    LDA  5,-10(0)	Load address of base of array grayScale
460:    SUB  5,5,4	Compute offset of value 
461:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
462:    LDC  3,7(6)	Load integer constant 
463:     ST  3,-5(1)	Save index 
464:    LDC  3,79(6)	Load char constant 
465:     LD  4,-5(1)	Restore index 
466:    LDA  5,-10(0)	Load address of base of array grayScale
467:    SUB  5,5,4	Compute offset of value 
468:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
469:    LDC  3,8(6)	Load integer constant 
470:     ST  3,-5(1)	Save index 
471:    LDC  3,86(6)	Load char constant 
472:     LD  4,-5(1)	Restore index 
473:    LDA  5,-10(0)	Load address of base of array grayScale
474:    SUB  5,5,4	Compute offset of value 
475:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
476:    LDC  3,9(6)	Load integer constant 
477:     ST  3,-5(1)	Save index 
478:    LDC  3,87(6)	Load char constant 
479:     LD  4,-5(1)	Restore index 
480:    LDA  5,-10(0)	Load address of base of array grayScale
481:    SUB  5,5,4	Compute offset of value 
482:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
483:    LDC  3,10(6)	Load integer constant 
484:     ST  3,-5(1)	Save index 
485:    LDC  3,35(6)	Load char constant 
486:     LD  4,-5(1)	Restore index 
487:    LDA  5,-10(0)	Load address of base of array grayScale
488:    SUB  5,5,4	Compute offset of value 
489:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
490:    LDC  3,11(6)	Load integer constant 
491:     ST  3,-5(1)	Save index 
492:    LDC  3,64(6)	Load char constant 
493:     LD  4,-5(1)	Restore index 
494:    LDA  5,-10(0)	Load address of base of array grayScale
495:    SUB  5,5,4	Compute offset of value 
496:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
497:    LDC  3,320(6)	Load integer constant 
498:    LDC  4,0(6)	Load 0 
499:    SUB  3,4,3	Op unary - 
500:     ST  3,0(0)	Store variable TOP
* EXPRESSION
501:    LDC  3,512(6)	Load integer constant 
502:    LDC  4,0(6)	Load 0 
503:    SUB  3,4,3	Op unary - 
504:     ST  3,-1(0)	Store variable LEFT
* EXPRESSION
505:    LDC  3,640(6)	Load integer constant 
506:     ST  3,-2(0)	Store variable HEIGHT
* EXPRESSION
507:    LDC  3,716(6)	Load integer constant 
508:     ST  3,-3(0)	Store variable WIDTH
* EXPRESSION
509:     LD  3,-3(0)	Load variable WIDTH
510:     ST  3,-6(1)	Save left side 
511:    LDC  3,40(6)	Load integer constant 
512:     LD  4,-6(1)	Load left into ac1 
513:    DIV  3,4,3	Op / 
514:     ST  3,-4(0)	Store variable XStep
* EXPRESSION
515:     LD  3,-2(0)	Load variable HEIGHT
516:     ST  3,-6(1)	Save left side 
517:    LDC  3,36(6)	Load integer constant 
518:     LD  4,-6(1)	Load left into ac1 
519:    DIV  3,4,3	Op / 
520:     ST  3,-5(0)	Store variable YStep
* EXPRESSION
521:     LD  3,-1(0)	Load variable LEFT
522:     ST  3,-6(1)	Save left side 
523:     LD  3,-3(0)	Load variable WIDTH
524:     LD  4,-6(1)	Load left into ac1 
525:    ADD  3,4,3	Op + 
526:     ST  3,-6(0)	Store variable XMax
* EXPRESSION
527:     LD  3,0(0)	Load variable TOP
528:     ST  3,-6(1)	Save left side 
529:     LD  3,-2(0)	Load variable HEIGHT
530:     LD  4,-6(1)	Load left into ac1 
531:    ADD  3,4,3	Op + 
532:     ST  3,-7(0)	Store variable YMax
* EXPRESSION
* CALL Mandelbrot
533:     ST  1,-5(1)	Store fp in ghost frame for Mandelbrot
* PARAM 1
534:    LDA  3,-3(1)	Load address of base of array JuliaVals
535:     ST  3,-7(1)	Store parameter 
* END PARAM Mandelbrot
536:    LDA  1,-5(1)	Load address of new frame 
537:    LDA  3,1(7)	Return address in ac 
538:    LDA  7,-497(7)	CALL Mandelbrot
539:    LDA  3,0(2)	Save the result in ac 
* END CALL Mandelbrot
* EXPRESSION
* CALL outnl
540:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
541:    LDA  1,-5(1)	Load address of new frame 
542:    LDA  3,1(7)	Return address in ac 
543:    LDA  7,-507(7)	CALL outnl
544:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
545:    LDC  3,320(6)	Load integer constant 
546:    LDC  4,0(6)	Load 0 
547:    SUB  3,4,3	Op unary - 
548:     ST  3,0(0)	Store variable TOP
* EXPRESSION
549:    LDC  3,512(6)	Load integer constant 
550:    LDC  4,0(6)	Load 0 
551:    SUB  3,4,3	Op unary - 
552:     ST  3,-1(0)	Store variable LEFT
* EXPRESSION
553:    LDC  3,640(6)	Load integer constant 
554:     ST  3,-2(0)	Store variable HEIGHT
* EXPRESSION
555:    LDC  3,716(6)	Load integer constant 
556:     ST  3,-3(0)	Store variable WIDTH
* EXPRESSION
557:     LD  3,-3(0)	Load variable WIDTH
558:     ST  3,-6(1)	Save left side 
559:    LDC  3,40(6)	Load integer constant 
560:     LD  4,-6(1)	Load left into ac1 
561:    DIV  3,4,3	Op / 
562:     ST  3,-4(0)	Store variable XStep
* EXPRESSION
563:     LD  3,-2(0)	Load variable HEIGHT
564:     ST  3,-6(1)	Save left side 
565:    LDC  3,36(6)	Load integer constant 
566:     LD  4,-6(1)	Load left into ac1 
567:    DIV  3,4,3	Op / 
568:     ST  3,-5(0)	Store variable YStep
* EXPRESSION
569:     LD  3,-1(0)	Load variable LEFT
570:     ST  3,-6(1)	Save left side 
571:     LD  3,-3(0)	Load variable WIDTH
572:     LD  4,-6(1)	Load left into ac1 
573:    ADD  3,4,3	Op + 
574:     ST  3,-6(0)	Store variable XMax
* EXPRESSION
575:     LD  3,0(0)	Load variable TOP
576:     ST  3,-6(1)	Save left side 
577:     LD  3,-2(0)	Load variable HEIGHT
578:     LD  4,-6(1)	Load left into ac1 
579:    ADD  3,4,3	Op + 
580:     ST  3,-7(0)	Store variable YMax
* EXPRESSION
* CALL Julia
581:     ST  1,-5(1)	Store fp in ghost frame for Julia
* PARAM 1
582:    LDA  3,-3(1)	Load address of base of array JuliaVals
583:     ST  3,-7(1)	Save left side 
584:    LDC  3,0(6)	Load integer constant 
585:     LD  4,-7(1)	Load left into ac1 
586:    SUB  3,4,3	compute location from index 
587:     LD  3,0(3)	Load array element 
588:     ST  3,-7(1)	Store parameter 
* PARAM 2
589:    LDA  3,-3(1)	Load address of base of array JuliaVals
590:     ST  3,-8(1)	Save left side 
591:    LDC  3,1(6)	Load integer constant 
592:     LD  4,-8(1)	Load left into ac1 
593:    SUB  3,4,3	compute location from index 
594:     LD  3,0(3)	Load array element 
595:     ST  3,-8(1)	Store parameter 
* END PARAM Julia
596:    LDA  1,-5(1)	Load address of new frame 
597:    LDA  3,1(7)	Return address in ac 
598:    LDA  7,-369(7)	CALL Julia
599:    LDA  3,0(2)	Save the result in ac 
* END CALL Julia
* END COMPOUND
* Add standard closing in case there is no return statement
600:    LDC  2,0(6)	Set return value to 0 
601:     LD  3,-1(1)	Load return address 
602:     LD  1,0(1)	Adjust fp 
603:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,603(7)	Jump to init [backpatch] 
* INIT
604:     LD  0,0(0)	Set the global pointer 
605:    LDA  1,-22(0)	set first frame at end of globals 
606:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
607:    LDC  3,12(6)	load size of array grayScale
608:     ST  3,-9(0)	save size of array grayScale
* END INIT GLOBALS AND STATICS
609:    LDA  3,1(7)	Return address in ac 
610:    LDA  7,-201(7)	Jump to main 
611:   HALT  0,0,0	DONE! 
* END INIT
