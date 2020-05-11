* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyOps.c-
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
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-6(1)	Save index 
 45:    LDC  3,50(6)	Load integer constant 
 46:     LD  4,-6(1)	Restore index 
 47:    LDA  5,-1(0)	Load address of base of array y
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable y
* EXPRESSION
 50:    LDC  3,5(6)	Load integer constant 
 51:     ST  3,-6(1)	Save index 
 52:    LDC  3,1(6)	Load integer constant 
 53:     LD  4,-6(1)	Restore index 
 54:    LDA  5,-1(0)	Load address of base of array y
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable y
* EXPRESSION
 57:    LDC  3,8(6)	Load integer constant 
 58:     ST  3,-6(1)	Save index 
 59:    LDC  3,2(6)	Load integer constant 
 60:     LD  4,-6(1)	Restore index 
 61:    LDA  5,-1(0)	Load address of base of array y
 62:    SUB  5,5,4	Compute offset of value 
 63:     ST  3,0(5)	Store variable y
* EXPRESSION
 64:    LDC  3,50(6)	Load integer constant 
 65:     ST  3,-2(1)	Store variable a
* EXPRESSION
 66:    LDC  3,1(6)	Load integer constant 
 67:     ST  3,-3(1)	Store variable b
* EXPRESSION
 68:    LDC  3,8(6)	Load integer constant 
 69:     ST  3,-4(1)	Store variable c
* EXPRESSION
 70:    LDC  3,0(6)	Load Boolean constant 
 71:     ST  3,-11(0)	Store variable x
* EXPRESSION
 72:    LDC  3,1(6)	Load Boolean constant 
 73:     ST  3,-5(1)	Store variable z
* EXPRESSION
* CALL outputb
 74:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
 75:     LD  3,-2(1)	Load variable a
 76:     ST  3,-8(1)	Save left side 
 77:    LDC  3,1(6)	Load integer constant 
 78:     LD  4,-8(1)	Load left into ac1 
 79:    TLE  3,4,3	Op <= 
 80:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
 81:    LDA  1,-6(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-66(7)	CALL outputb
 84:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
 85:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
 86:     LD  3,-3(1)	Load variable b
 87:     ST  3,-8(1)	Save left side 
 88:    LDC  3,50(6)	Load integer constant 
 89:     LD  4,-8(1)	Load left into ac1 
 90:    TLE  3,4,3	Op <= 
 91:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
 92:    LDA  1,-6(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-77(7)	CALL outputb
 95:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
 96:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
 97:    LDC  3,50(6)	Load integer constant 
 98:     ST  3,-8(1)	Save left side 
 99:    LDC  3,50(6)	Load integer constant 
100:     LD  4,-8(1)	Load left into ac1 
101:    TLE  3,4,3	Op <= 
102:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
103:    LDA  1,-6(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-88(7)	CALL outputb
106:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
107:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
108:    LDA  1,-6(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-74(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
112:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
113:    LDC  3,50(6)	Load integer constant 
114:     ST  3,-8(1)	Save left side 
115:    LDC  3,1(6)	Load integer constant 
116:     LD  4,-8(1)	Load left into ac1 
117:    TLT  3,4,3	Op < 
118:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
119:    LDA  1,-6(1)	Load address of new frame 
120:    LDA  3,1(7)	Return address in ac 
121:    LDA  7,-104(7)	CALL outputb
122:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
123:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
124:     LD  3,-3(1)	Load variable b
125:     ST  3,-8(1)	Save left side 
126:     LD  3,-2(1)	Load variable a
127:     LD  4,-8(1)	Load left into ac1 
128:    TLT  3,4,3	Op < 
129:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
130:    LDA  1,-6(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-115(7)	CALL outputb
133:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
134:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
135:     LD  3,-2(1)	Load variable a
136:     ST  3,-8(1)	Save left side 
137:     LD  3,-2(1)	Load variable a
138:     LD  4,-8(1)	Load left into ac1 
139:    TLT  3,4,3	Op < 
140:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
141:    LDA  1,-6(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-126(7)	CALL outputb
144:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
145:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
146:    LDA  1,-6(1)	Load address of new frame 
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-112(7)	CALL outnl
149:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
150:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
151:    LDC  3,50(6)	Load integer constant 
152:     ST  3,-8(1)	Save left side 
153:    LDC  3,1(6)	Load integer constant 
154:     LD  4,-8(1)	Load left into ac1 
155:    TGT  3,4,3	Op > 
156:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
157:    LDA  1,-6(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-142(7)	CALL outputb
160:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
161:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
162:    LDC  3,1(6)	Load integer constant 
163:     ST  3,-8(1)	Save left side 
164:    LDC  3,50(6)	Load integer constant 
165:     LD  4,-8(1)	Load left into ac1 
166:    TGT  3,4,3	Op > 
167:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
168:    LDA  1,-6(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-153(7)	CALL outputb
171:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
172:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
173:    LDC  3,50(6)	Load integer constant 
174:     ST  3,-8(1)	Save left side 
175:    LDC  3,50(6)	Load integer constant 
176:     LD  4,-8(1)	Load left into ac1 
177:    TGT  3,4,3	Op > 
178:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
179:    LDA  1,-6(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-164(7)	CALL outputb
182:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
183:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
184:    LDA  1,-6(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-150(7)	CALL outnl
187:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
188:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
189:    LDC  3,50(6)	Load integer constant 
190:     ST  3,-8(1)	Save left side 
191:    LDC  3,1(6)	Load integer constant 
192:     LD  4,-8(1)	Load left into ac1 
193:    TGE  3,4,3	Op >= 
194:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
195:    LDA  1,-6(1)	Load address of new frame 
196:    LDA  3,1(7)	Return address in ac 
197:    LDA  7,-180(7)	CALL outputb
198:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
199:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
200:    LDC  3,1(6)	Load integer constant 
201:     ST  3,-8(1)	Save left side 
202:    LDC  3,50(6)	Load integer constant 
203:     LD  4,-8(1)	Load left into ac1 
204:    TGE  3,4,3	Op >= 
205:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
206:    LDA  1,-6(1)	Load address of new frame 
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-191(7)	CALL outputb
209:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
210:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
211:    LDC  3,50(6)	Load integer constant 
212:     ST  3,-8(1)	Save left side 
213:    LDC  3,50(6)	Load integer constant 
214:     LD  4,-8(1)	Load left into ac1 
215:    TGE  3,4,3	Op >= 
216:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
217:    LDA  1,-6(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-202(7)	CALL outputb
220:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
221:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
222:    LDA  1,-6(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-188(7)	CALL outnl
225:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
226:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
227:    LDA  3,-1(0)	Load address of base of array y
228:     ST  3,-8(1)	Save left side 
229:    LDC  3,0(6)	Load integer constant 
230:     LD  4,-8(1)	Load left into ac1 
231:    SUB  3,4,3	compute location from index 
232:     LD  3,0(3)	Load array element 
233:     ST  3,-8(1)	Save left side 
234:     LD  3,-3(1)	Load variable b
235:     LD  4,-8(1)	Load left into ac1 
236:    TEQ  3,4,3	Op == 
237:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
238:    LDA  1,-6(1)	Load address of new frame 
239:    LDA  3,1(7)	Return address in ac 
240:    LDA  7,-223(7)	CALL outputb
241:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
242:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
243:     LD  3,-2(1)	Load variable a
244:     ST  3,-8(1)	Save left side 
245:     LD  3,-3(1)	Load variable b
246:     LD  4,-8(1)	Load left into ac1 
247:    TEQ  3,4,3	Op == 
248:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
249:    LDA  1,-6(1)	Load address of new frame 
250:    LDA  3,1(7)	Return address in ac 
251:    LDA  7,-234(7)	CALL outputb
252:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
253:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
254:     LD  3,-3(1)	Load variable b
255:     ST  3,-8(1)	Save left side 
256:     LD  3,-3(1)	Load variable b
257:     LD  4,-8(1)	Load left into ac1 
258:    TEQ  3,4,3	Op == 
259:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
260:    LDA  1,-6(1)	Load address of new frame 
261:    LDA  3,1(7)	Return address in ac 
262:    LDA  7,-245(7)	CALL outputb
263:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
264:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
265:    LDA  1,-6(1)	Load address of new frame 
266:    LDA  3,1(7)	Return address in ac 
267:    LDA  7,-231(7)	CALL outnl
268:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
269:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
270:    LDA  3,-1(0)	Load address of base of array y
271:     ST  3,-8(1)	Save left side 
272:    LDC  3,0(6)	Load integer constant 
273:     LD  4,-8(1)	Load left into ac1 
274:    SUB  3,4,3	compute location from index 
275:     LD  3,0(3)	Load array element 
276:     ST  3,-8(1)	Save left side 
277:     LD  3,-2(1)	Load variable a
278:     LD  4,-8(1)	Load left into ac1 
279:    TNE  3,4,3	Op != 
280:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
281:    LDA  1,-6(1)	Load address of new frame 
282:    LDA  3,1(7)	Return address in ac 
283:    LDA  7,-266(7)	CALL outputb
284:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
285:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
286:    LDA  3,-1(0)	Load address of base of array y
287:     ST  3,-8(1)	Save left side 
288:    LDC  3,0(6)	Load integer constant 
289:     LD  4,-8(1)	Load left into ac1 
290:    SUB  3,4,3	compute location from index 
291:     LD  3,0(3)	Load array element 
292:     ST  3,-8(1)	Save left side 
293:     LD  3,-3(1)	Load variable b
294:     LD  4,-8(1)	Load left into ac1 
295:    TNE  3,4,3	Op != 
296:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
297:    LDA  1,-6(1)	Load address of new frame 
298:    LDA  3,1(7)	Return address in ac 
299:    LDA  7,-282(7)	CALL outputb
300:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
301:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
302:     LD  3,-2(1)	Load variable a
303:     ST  3,-8(1)	Save left side 
304:     LD  3,-3(1)	Load variable b
305:     LD  4,-8(1)	Load left into ac1 
306:    TNE  3,4,3	Op != 
307:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
308:    LDA  1,-6(1)	Load address of new frame 
309:    LDA  3,1(7)	Return address in ac 
310:    LDA  7,-293(7)	CALL outputb
311:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
312:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
313:     LD  3,-3(1)	Load variable b
314:     ST  3,-8(1)	Save left side 
315:     LD  3,-3(1)	Load variable b
316:     LD  4,-8(1)	Load left into ac1 
317:    TNE  3,4,3	Op != 
318:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
319:    LDA  1,-6(1)	Load address of new frame 
320:    LDA  3,1(7)	Return address in ac 
321:    LDA  7,-304(7)	CALL outputb
322:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
323:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
324:    LDA  1,-6(1)	Load address of new frame 
325:    LDA  3,1(7)	Return address in ac 
326:    LDA  7,-290(7)	CALL outnl
327:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
328:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
329:    LDC  3,1(6)	Load Boolean constant 
330:     ST  3,-8(1)	Save left side 
331:    LDC  3,1(6)	Load Boolean constant 
332:     LD  4,-8(1)	Load left into ac1 
333:    AND  3,4,3	Op AND 
334:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
335:    LDA  1,-6(1)	Load address of new frame 
336:    LDA  3,1(7)	Return address in ac 
337:    LDA  7,-320(7)	CALL outputb
338:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
339:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
340:    LDC  3,1(6)	Load Boolean constant 
341:     ST  3,-8(1)	Save left side 
342:    LDC  3,0(6)	Load Boolean constant 
343:     LD  4,-8(1)	Load left into ac1 
344:    AND  3,4,3	Op AND 
345:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
346:    LDA  1,-6(1)	Load address of new frame 
347:    LDA  3,1(7)	Return address in ac 
348:    LDA  7,-331(7)	CALL outputb
349:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
350:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
351:    LDC  3,0(6)	Load Boolean constant 
352:     ST  3,-8(1)	Save left side 
353:    LDC  3,1(6)	Load Boolean constant 
354:     LD  4,-8(1)	Load left into ac1 
355:    AND  3,4,3	Op AND 
356:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
357:    LDA  1,-6(1)	Load address of new frame 
358:    LDA  3,1(7)	Return address in ac 
359:    LDA  7,-342(7)	CALL outputb
360:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
361:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
362:    LDC  3,0(6)	Load Boolean constant 
363:     ST  3,-8(1)	Save left side 
364:    LDC  3,0(6)	Load Boolean constant 
365:     LD  4,-8(1)	Load left into ac1 
366:    AND  3,4,3	Op AND 
367:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
368:    LDA  1,-6(1)	Load address of new frame 
369:    LDA  3,1(7)	Return address in ac 
370:    LDA  7,-353(7)	CALL outputb
371:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
372:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
373:    LDA  1,-6(1)	Load address of new frame 
374:    LDA  3,1(7)	Return address in ac 
375:    LDA  7,-339(7)	CALL outnl
376:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
377:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
378:    LDC  3,1(6)	Load Boolean constant 
379:     ST  3,-8(1)	Save left side 
380:    LDC  3,1(6)	Load Boolean constant 
381:     LD  4,-8(1)	Load left into ac1 
382:     OR  3,4,3	Op OR 
383:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
384:    LDA  1,-6(1)	Load address of new frame 
385:    LDA  3,1(7)	Return address in ac 
386:    LDA  7,-369(7)	CALL outputb
387:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
388:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
389:     LD  3,-5(1)	Load variable z
390:     ST  3,-8(1)	Save left side 
391:    LDC  3,0(6)	Load Boolean constant 
392:     LD  4,-8(1)	Load left into ac1 
393:     OR  3,4,3	Op OR 
394:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
395:    LDA  1,-6(1)	Load address of new frame 
396:    LDA  3,1(7)	Return address in ac 
397:    LDA  7,-380(7)	CALL outputb
398:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
399:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
400:    LDC  3,0(6)	Load Boolean constant 
401:     ST  3,-8(1)	Save left side 
402:    LDC  3,1(6)	Load Boolean constant 
403:     LD  4,-8(1)	Load left into ac1 
404:     OR  3,4,3	Op OR 
405:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
406:    LDA  1,-6(1)	Load address of new frame 
407:    LDA  3,1(7)	Return address in ac 
408:    LDA  7,-391(7)	CALL outputb
409:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
410:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
411:    LDC  3,0(6)	Load Boolean constant 
412:     ST  3,-8(1)	Save left side 
413:    LDC  3,0(6)	Load Boolean constant 
414:     LD  4,-8(1)	Load left into ac1 
415:     OR  3,4,3	Op OR 
416:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
417:    LDA  1,-6(1)	Load address of new frame 
418:    LDA  3,1(7)	Return address in ac 
419:    LDA  7,-402(7)	CALL outputb
420:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
421:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
422:    LDA  1,-6(1)	Load address of new frame 
423:    LDA  3,1(7)	Return address in ac 
424:    LDA  7,-388(7)	CALL outnl
425:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
426:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
427:    LDC  3,1(6)	Load Boolean constant 
428:    LDC  4,1(6)	Load 1 
429:    XOR  3,3,4	Op NOT 
430:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
431:    LDA  1,-6(1)	Load address of new frame 
432:    LDA  3,1(7)	Return address in ac 
433:    LDA  7,-416(7)	CALL outputb
434:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
435:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
436:    LDC  3,0(6)	Load Boolean constant 
437:    LDC  4,1(6)	Load 1 
438:    XOR  3,3,4	Op NOT 
439:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
440:    LDA  1,-6(1)	Load address of new frame 
441:    LDA  3,1(7)	Return address in ac 
442:    LDA  7,-425(7)	CALL outputb
443:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
444:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
445:     LD  3,-11(0)	Load variable x
446:    LDC  4,1(6)	Load 1 
447:    XOR  3,3,4	Op NOT 
448:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
449:    LDA  1,-6(1)	Load address of new frame 
450:    LDA  3,1(7)	Return address in ac 
451:    LDA  7,-434(7)	CALL outputb
452:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
453:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
454:     LD  3,-11(0)	Load variable x
455:    LDC  4,1(6)	Load 1 
456:    XOR  3,3,4	Op NOT 
457:    LDC  4,1(6)	Load 1 
458:    XOR  3,3,4	Op NOT 
459:    LDC  4,1(6)	Load 1 
460:    XOR  3,3,4	Op NOT 
461:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
462:    LDA  1,-6(1)	Load address of new frame 
463:    LDA  3,1(7)	Return address in ac 
464:    LDA  7,-447(7)	CALL outputb
465:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
466:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
467:    LDA  1,-6(1)	Load address of new frame 
468:    LDA  3,1(7)	Return address in ac 
469:    LDA  7,-433(7)	CALL outnl
470:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
471:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
472:    LDC  3,5(6)	Load integer constant 
473:     ST  3,-8(1)	Save left side 
474:    LDC  3,50(6)	Load integer constant 
475:     LD  4,-8(1)	Load left into ac1 
476:    ADD  3,4,3	Op + 
477:     ST  3,-8(1)	Store parameter 
* END PARAM output
478:    LDA  1,-6(1)	Load address of new frame 
479:    LDA  3,1(7)	Return address in ac 
480:    LDA  7,-475(7)	CALL output
481:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
482:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
483:    LDA  3,-1(0)	Load address of base of array y
484:     ST  3,-8(1)	Save left side 
485:     LD  3,-4(1)	Load variable c
486:     LD  4,-8(1)	Load left into ac1 
487:    SUB  3,4,3	compute location from index 
488:     LD  3,0(3)	Load array element 
489:     ST  3,-8(1)	Save left side 
490:    LDC  3,50(6)	Load integer constant 
491:     LD  4,-8(1)	Load left into ac1 
492:    ADD  3,4,3	Op + 
493:     ST  3,-8(1)	Store parameter 
* END PARAM output
494:    LDA  1,-6(1)	Load address of new frame 
495:    LDA  3,1(7)	Return address in ac 
496:    LDA  7,-491(7)	CALL output
497:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
498:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
499:    LDA  1,-6(1)	Load address of new frame 
500:    LDA  3,1(7)	Return address in ac 
501:    LDA  7,-465(7)	CALL outnl
502:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
503:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
504:    LDC  3,5(6)	Load integer constant 
505:     ST  3,-8(1)	Save left side 
506:    LDC  3,50(6)	Load integer constant 
507:     LD  4,-8(1)	Load left into ac1 
508:    SUB  3,4,3	Op - 
509:     ST  3,-8(1)	Store parameter 
* END PARAM output
510:    LDA  1,-6(1)	Load address of new frame 
511:    LDA  3,1(7)	Return address in ac 
512:    LDA  7,-507(7)	CALL output
513:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
514:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
515:    LDC  3,30(6)	Load integer constant 
516:     ST  3,-8(1)	Save left side 
517:    LDC  3,5(6)	Load integer constant 
518:     LD  4,-8(1)	Load left into ac1 
519:    SUB  3,4,3	Op - 
520:     ST  3,-8(1)	Save left side 
521:    LDC  3,50(6)	Load integer constant 
522:     LD  4,-8(1)	Load left into ac1 
523:    SUB  3,4,3	Op - 
524:     ST  3,-8(1)	Store parameter 
* END PARAM output
525:    LDA  1,-6(1)	Load address of new frame 
526:    LDA  3,1(7)	Return address in ac 
527:    LDA  7,-522(7)	CALL output
528:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
529:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
530:    LDA  1,-6(1)	Load address of new frame 
531:    LDA  3,1(7)	Return address in ac 
532:    LDA  7,-496(7)	CALL outnl
533:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
534:    LDC  3,50(6)	Load integer constant 
535:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL output
536:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
537:     LD  3,-2(1)	Load variable a
538:    LDC  4,0(6)	Load 0 
539:    SUB  3,4,3	Op unary - 
540:     ST  3,-8(1)	Store parameter 
* END PARAM output
541:    LDA  1,-6(1)	Load address of new frame 
542:    LDA  3,1(7)	Return address in ac 
543:    LDA  7,-538(7)	CALL output
544:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
545:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
546:     LD  3,-2(1)	Load variable a
547:    LDC  4,0(6)	Load 0 
548:    SUB  3,4,3	Op unary - 
549:    LDC  4,0(6)	Load 0 
550:    SUB  3,4,3	Op unary - 
551:     ST  3,-8(1)	Store parameter 
* END PARAM output
552:    LDA  1,-6(1)	Load address of new frame 
553:    LDA  3,1(7)	Return address in ac 
554:    LDA  7,-549(7)	CALL output
555:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
556:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
557:     LD  3,-2(1)	Load variable a
558:    LDC  4,0(6)	Load 0 
559:    SUB  3,4,3	Op unary - 
560:     ST  3,-8(1)	Store parameter 
* END PARAM output
561:    LDA  1,-6(1)	Load address of new frame 
562:    LDA  3,1(7)	Return address in ac 
563:    LDA  7,-558(7)	CALL output
564:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
565:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
566:    LDC  3,0(6)	Load integer constant 
567:    LDC  4,0(6)	Load 0 
568:    SUB  3,4,3	Op unary - 
569:     ST  3,-8(1)	Store parameter 
* END PARAM output
570:    LDA  1,-6(1)	Load address of new frame 
571:    LDA  3,1(7)	Return address in ac 
572:    LDA  7,-567(7)	CALL output
573:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
574:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
575:    LDC  3,1(6)	Load integer constant 
576:    LDC  4,0(6)	Load 0 
577:    SUB  3,4,3	Op unary - 
578:     ST  3,-8(1)	Store parameter 
* END PARAM output
579:    LDA  1,-6(1)	Load address of new frame 
580:    LDA  3,1(7)	Return address in ac 
581:    LDA  7,-576(7)	CALL output
582:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
583:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
584:    LDA  1,-6(1)	Load address of new frame 
585:    LDA  3,1(7)	Return address in ac 
586:    LDA  7,-550(7)	CALL outnl
587:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
588:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
589:    LDC  3,2(6)	Load integer constant 
590:     ST  3,-8(1)	Save left side 
591:    LDC  3,3(6)	Load integer constant 
592:     LD  4,-8(1)	Load left into ac1 
593:    MUL  3,4,3	Op * 
594:     ST  3,-8(1)	Save left side 
595:    LDC  3,5(6)	Load integer constant 
596:     LD  4,-8(1)	Load left into ac1 
597:    MUL  3,4,3	Op * 
598:     ST  3,-8(1)	Save left side 
599:    LDC  3,7(6)	Load integer constant 
600:     LD  4,-8(1)	Load left into ac1 
601:    MUL  3,4,3	Op * 
602:     ST  3,-8(1)	Save left side 
603:    LDC  3,11(6)	Load integer constant 
604:     LD  4,-8(1)	Load left into ac1 
605:    MUL  3,4,3	Op * 
606:     ST  3,-8(1)	Store parameter 
* END PARAM output
607:    LDA  1,-6(1)	Load address of new frame 
608:    LDA  3,1(7)	Return address in ac 
609:    LDA  7,-604(7)	CALL output
610:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
611:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
612:    LDC  3,50(6)	Load integer constant 
613:     ST  3,-8(1)	Save left side 
614:    LDA  3,-1(0)	Load address of base of array y
615:     ST  3,-9(1)	Save left side 
616:    LDC  3,8(6)	Load integer constant 
617:     LD  4,-9(1)	Load left into ac1 
618:    SUB  3,4,3	compute location from index 
619:     LD  3,0(3)	Load array element 
620:     LD  4,-8(1)	Load left into ac1 
621:    MUL  3,4,3	Op * 
622:     ST  3,-8(1)	Store parameter 
* END PARAM output
623:    LDA  1,-6(1)	Load address of new frame 
624:    LDA  3,1(7)	Return address in ac 
625:    LDA  7,-620(7)	CALL output
626:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
627:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
628:    LDA  3,-1(0)	Load address of base of array y
629:     ST  3,-8(1)	Save left side 
630:    LDC  3,8(6)	Load integer constant 
631:     LD  4,-8(1)	Load left into ac1 
632:    SUB  3,4,3	compute location from index 
633:     LD  3,0(3)	Load array element 
634:     ST  3,-8(1)	Save left side 
635:    LDC  3,50(6)	Load integer constant 
636:     LD  4,-8(1)	Load left into ac1 
637:    MUL  3,4,3	Op * 
638:     ST  3,-8(1)	Store parameter 
* END PARAM output
639:    LDA  1,-6(1)	Load address of new frame 
640:    LDA  3,1(7)	Return address in ac 
641:    LDA  7,-636(7)	CALL output
642:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
643:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
644:    LDA  1,-6(1)	Load address of new frame 
645:    LDA  3,1(7)	Return address in ac 
646:    LDA  7,-610(7)	CALL outnl
647:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
648:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
649:    LDC  3,50(6)	Load integer constant 
650:     ST  3,-8(1)	Save left side 
651:    LDA  3,-1(0)	Load address of base of array y
652:     ST  3,-9(1)	Save left side 
653:    LDC  3,8(6)	Load integer constant 
654:     LD  4,-9(1)	Load left into ac1 
655:    SUB  3,4,3	compute location from index 
656:     LD  3,0(3)	Load array element 
657:     LD  4,-8(1)	Load left into ac1 
658:    DIV  3,4,3	Op / 
659:     ST  3,-8(1)	Store parameter 
* END PARAM output
660:    LDA  1,-6(1)	Load address of new frame 
661:    LDA  3,1(7)	Return address in ac 
662:    LDA  7,-657(7)	CALL output
663:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
664:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
665:    LDA  3,-1(0)	Load address of base of array y
666:     ST  3,-8(1)	Save left side 
667:    LDC  3,8(6)	Load integer constant 
668:     LD  4,-8(1)	Load left into ac1 
669:    SUB  3,4,3	compute location from index 
670:     LD  3,0(3)	Load array element 
671:     ST  3,-8(1)	Save left side 
672:    LDC  3,50(6)	Load integer constant 
673:     LD  4,-8(1)	Load left into ac1 
674:    DIV  3,4,3	Op / 
675:     ST  3,-8(1)	Store parameter 
* END PARAM output
676:    LDA  1,-6(1)	Load address of new frame 
677:    LDA  3,1(7)	Return address in ac 
678:    LDA  7,-673(7)	CALL output
679:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
680:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
681:    LDA  3,-1(0)	Load address of base of array y
682:     ST  3,-8(1)	Save left side 
683:    LDC  3,8(6)	Load integer constant 
684:     LD  4,-8(1)	Load left into ac1 
685:    SUB  3,4,3	compute location from index 
686:     LD  3,0(3)	Load array element 
687:     ST  3,-8(1)	Save left side 
688:     LD  3,-3(1)	Load variable b
689:     LD  4,-8(1)	Load left into ac1 
690:    DIV  3,4,3	Op / 
691:     ST  3,-8(1)	Store parameter 
* END PARAM output
692:    LDA  1,-6(1)	Load address of new frame 
693:    LDA  3,1(7)	Return address in ac 
694:    LDA  7,-689(7)	CALL output
695:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
696:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
697:    LDC  3,210(6)	Load integer constant 
698:     ST  3,-8(1)	Save left side 
699:    LDC  3,7(6)	Load integer constant 
700:     LD  4,-8(1)	Load left into ac1 
701:    DIV  3,4,3	Op / 
702:     ST  3,-8(1)	Save left side 
703:    LDC  3,3(6)	Load integer constant 
704:     LD  4,-8(1)	Load left into ac1 
705:    DIV  3,4,3	Op / 
706:     ST  3,-8(1)	Store parameter 
* END PARAM output
707:    LDA  1,-6(1)	Load address of new frame 
708:    LDA  3,1(7)	Return address in ac 
709:    LDA  7,-704(7)	CALL output
710:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
711:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
712:    LDA  1,-6(1)	Load address of new frame 
713:    LDA  3,1(7)	Return address in ac 
714:    LDA  7,-678(7)	CALL outnl
715:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
716:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
717:    LDC  3,211(6)	Load integer constant 
718:     ST  3,-8(1)	Save left side 
719:    LDC  3,7(6)	Load integer constant 
720:     LD  4,-8(1)	Load left into ac1 
721:    DIV  5,4,3	Op % 
722:    MUL  5,5,3	 
723:    SUB  3,4,5	 
724:     ST  3,-8(1)	Store parameter 
* END PARAM output
725:    LDA  1,-6(1)	Load address of new frame 
726:    LDA  3,1(7)	Return address in ac 
727:    LDA  7,-722(7)	CALL output
728:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
729:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
730:    LDC  3,211(6)	Load integer constant 
731:     ST  3,-8(1)	Save left side 
732:    LDC  3,6(6)	Load integer constant 
733:     LD  4,-8(1)	Load left into ac1 
734:    DIV  5,4,3	Op % 
735:    MUL  5,5,3	 
736:    SUB  3,4,5	 
737:     ST  3,-8(1)	Store parameter 
* END PARAM output
738:    LDA  1,-6(1)	Load address of new frame 
739:    LDA  3,1(7)	Return address in ac 
740:    LDA  7,-735(7)	CALL output
741:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
742:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
743:    LDC  3,211(6)	Load integer constant 
744:     ST  3,-8(1)	Save left side 
745:    LDC  3,5(6)	Load integer constant 
746:     LD  4,-8(1)	Load left into ac1 
747:    DIV  5,4,3	Op % 
748:    MUL  5,5,3	 
749:    SUB  3,4,5	 
750:     ST  3,-8(1)	Store parameter 
* END PARAM output
751:    LDA  1,-6(1)	Load address of new frame 
752:    LDA  3,1(7)	Return address in ac 
753:    LDA  7,-748(7)	CALL output
754:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
755:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
756:    LDC  3,211(6)	Load integer constant 
757:     ST  3,-8(1)	Save left side 
758:    LDC  3,4(6)	Load integer constant 
759:     LD  4,-8(1)	Load left into ac1 
760:    DIV  5,4,3	Op % 
761:    MUL  5,5,3	 
762:    SUB  3,4,5	 
763:     ST  3,-8(1)	Store parameter 
* END PARAM output
764:    LDA  1,-6(1)	Load address of new frame 
765:    LDA  3,1(7)	Return address in ac 
766:    LDA  7,-761(7)	CALL output
767:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
768:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
769:    LDC  3,211(6)	Load integer constant 
770:     ST  3,-8(1)	Save left side 
771:    LDC  3,211(6)	Load integer constant 
772:     ST  3,-9(1)	Save left side 
773:    LDC  3,4(6)	Load integer constant 
774:     LD  4,-9(1)	Load left into ac1 
775:    DIV  3,4,3	Op / 
776:     ST  3,-9(1)	Save left side 
777:    LDC  3,4(6)	Load integer constant 
778:     LD  4,-9(1)	Load left into ac1 
779:    MUL  3,4,3	Op * 
780:     LD  4,-8(1)	Load left into ac1 
781:    SUB  3,4,3	Op - 
782:     ST  3,-8(1)	Store parameter 
* END PARAM output
783:    LDA  1,-6(1)	Load address of new frame 
784:    LDA  3,1(7)	Return address in ac 
785:    LDA  7,-780(7)	CALL output
786:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
787:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
788:    LDC  3,211(6)	Load integer constant 
789:     ST  3,-8(1)	Save left side 
790:    LDC  3,100(6)	Load integer constant 
791:     LD  4,-8(1)	Load left into ac1 
792:    DIV  5,4,3	Op % 
793:    MUL  5,5,3	 
794:    SUB  3,4,5	 
795:     ST  3,-8(1)	Save left side 
796:    LDC  3,3(6)	Load integer constant 
797:     LD  4,-8(1)	Load left into ac1 
798:    DIV  5,4,3	Op % 
799:    MUL  5,5,3	 
800:    SUB  3,4,5	 
801:     ST  3,-8(1)	Store parameter 
* END PARAM output
802:    LDA  1,-6(1)	Load address of new frame 
803:    LDA  3,1(7)	Return address in ac 
804:    LDA  7,-799(7)	CALL output
805:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
806:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
807:    LDA  1,-6(1)	Load address of new frame 
808:    LDA  3,1(7)	Return address in ac 
809:    LDA  7,-773(7)	CALL outnl
810:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
811:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
812:    LDC  3,43(6)	Load integer constant 
813:     ST  3,-4(1)	Store variable c
814:     ST  3,-3(1)	Store variable b
815:     ST  3,-2(1)	Store variable a
816:     ST  3,-8(1)	Store parameter 
* END PARAM output
817:    LDA  1,-6(1)	Load address of new frame 
818:    LDA  3,1(7)	Return address in ac 
819:    LDA  7,-814(7)	CALL output
820:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
821:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
822:     LD  3,-2(1)	Load variable a
823:     ST  3,-8(1)	Store parameter 
* END PARAM output
824:    LDA  1,-6(1)	Load address of new frame 
825:    LDA  3,1(7)	Return address in ac 
826:    LDA  7,-821(7)	CALL output
827:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
828:    LDC  3,3(6)	Load integer constant 
829:     ST  3,-3(1)	Store variable b
830:     ST  3,-7(1)	Save left side 
831:    LDC  3,4(6)	Load integer constant 
832:     ST  3,-4(1)	Store variable c
833:     LD  4,-7(1)	Load left into ac1 
834:    MUL  3,4,3	Op * 
835:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL output
836:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
837:     LD  3,-2(1)	Load variable a
838:     ST  3,-8(1)	Store parameter 
* END PARAM output
839:    LDA  1,-6(1)	Load address of new frame 
840:    LDA  3,1(7)	Return address in ac 
841:    LDA  7,-836(7)	CALL output
842:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
843:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
844:    LDA  1,-6(1)	Load address of new frame 
845:    LDA  3,1(7)	Return address in ac 
846:    LDA  7,-810(7)	CALL outnl
847:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
848:    LDC  3,44(6)	Load integer constant 
849:     ST  3,-2(1)	Store variable a
* EXPRESSION
850:    LDC  3,2(6)	Load integer constant 
851:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL output
852:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
853:     LD  3,-3(1)	Load variable b
854:     LD  4,-2(1)	load lhs variable a
855:    ADD  3,4,3	op += 
856:     ST  3,-2(1)	Store variable a
857:     ST  3,-8(1)	Store parameter 
* END PARAM output
858:    LDA  1,-6(1)	Load address of new frame 
859:    LDA  3,1(7)	Return address in ac 
860:    LDA  7,-855(7)	CALL output
861:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
862:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
863:     LD  3,-3(1)	Load variable b
864:     LD  4,-2(1)	load lhs variable a
865:    SUB  3,4,3	op -= 
866:     ST  3,-2(1)	Store variable a
867:     ST  3,-8(1)	Store parameter 
* END PARAM output
868:    LDA  1,-6(1)	Load address of new frame 
869:    LDA  3,1(7)	Return address in ac 
870:    LDA  7,-865(7)	CALL output
871:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
872:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
873:     LD  3,-2(1)	Load variable a
874:     LD  4,-2(1)	load lhs variable a
875:    SUB  3,4,3	op -= 
876:     ST  3,-2(1)	Store variable a
877:     ST  3,-8(1)	Store parameter 
* END PARAM output
878:    LDA  1,-6(1)	Load address of new frame 
879:    LDA  3,1(7)	Return address in ac 
880:    LDA  7,-875(7)	CALL output
881:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
882:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
883:    LDC  3,10(6)	Load integer constant 
884:     LD  4,-3(1)	load lhs variable b
885:    ADD  3,4,3	op += 
886:     ST  3,-3(1)	Store variable b
887:     LD  4,-2(1)	load lhs variable a
888:    ADD  3,4,3	op += 
889:     ST  3,-2(1)	Store variable a
890:     ST  3,-8(1)	Store parameter 
* END PARAM output
891:    LDA  1,-6(1)	Load address of new frame 
892:    LDA  3,1(7)	Return address in ac 
893:    LDA  7,-888(7)	CALL output
894:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
895:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
896:    LDA  1,-6(1)	Load address of new frame 
897:    LDA  3,1(7)	Return address in ac 
898:    LDA  7,-862(7)	CALL outnl
899:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
900:    LDC  3,44(6)	Load integer constant 
901:     ST  3,-2(1)	Store variable a
* EXPRESSION
902:    LDC  3,2(6)	Load integer constant 
903:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL output
904:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
905:     LD  3,-3(1)	Load variable b
906:     LD  4,-2(1)	load lhs variable a
907:    MUL  3,4,3	op *= 
908:     ST  3,-2(1)	Store variable a
909:     ST  3,-8(1)	Store parameter 
* END PARAM output
910:    LDA  1,-6(1)	Load address of new frame 
911:    LDA  3,1(7)	Return address in ac 
912:    LDA  7,-907(7)	CALL output
913:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
914:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
915:     LD  3,-3(1)	Load variable b
916:     LD  4,-2(1)	load lhs variable a
917:    DIV  3,4,3	op /= 
918:     ST  3,-2(1)	Store variable a
919:     ST  3,-8(1)	Store parameter 
* END PARAM output
920:    LDA  1,-6(1)	Load address of new frame 
921:    LDA  3,1(7)	Return address in ac 
922:    LDA  7,-917(7)	CALL output
923:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
924:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
925:    LDC  3,2(6)	Load integer constant 
926:     LD  4,-2(1)	load lhs variable a
927:    DIV  3,4,3	op /= 
928:     ST  3,-2(1)	Store variable a
929:     LD  4,-2(1)	load lhs variable a
930:    DIV  3,4,3	op /= 
931:     ST  3,-2(1)	Store variable a
932:     ST  3,-8(1)	Store parameter 
* END PARAM output
933:    LDA  1,-6(1)	Load address of new frame 
934:    LDA  3,1(7)	Return address in ac 
935:    LDA  7,-930(7)	CALL output
936:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
937:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
938:    LDC  3,10(6)	Load integer constant 
939:     LD  4,-3(1)	load lhs variable b
940:    MUL  3,4,3	op *= 
941:     ST  3,-3(1)	Store variable b
942:     LD  4,-2(1)	load lhs variable a
943:    MUL  3,4,3	op *= 
944:     ST  3,-2(1)	Store variable a
945:     ST  3,-8(1)	Store parameter 
* END PARAM output
946:    LDA  1,-6(1)	Load address of new frame 
947:    LDA  3,1(7)	Return address in ac 
948:    LDA  7,-943(7)	CALL output
949:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
950:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
951:    LDA  1,-6(1)	Load address of new frame 
952:    LDA  3,1(7)	Return address in ac 
953:    LDA  7,-917(7)	CALL outnl
954:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
955:    LDC  3,44(6)	Load integer constant 
956:     ST  3,-2(1)	Store variable a
* EXPRESSION
957:    LDC  3,2(6)	Load integer constant 
958:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL output
959:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
960:     LD  3,-2(1)	load lhs variable a
961:    LDA  3,1(3)	increment value of a
962:     ST  3,-2(1)	Store variable a
963:     ST  3,-8(1)	Store parameter 
* END PARAM output
964:    LDA  1,-6(1)	Load address of new frame 
965:    LDA  3,1(7)	Return address in ac 
966:    LDA  7,-961(7)	CALL output
967:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
968:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
969:     LD  3,-3(1)	load lhs variable b
970:    LDA  3,-1(3)	decrement value of b
971:     ST  3,-3(1)	Store variable b
972:     ST  3,-8(1)	Store parameter 
* END PARAM output
973:    LDA  1,-6(1)	Load address of new frame 
974:    LDA  3,1(7)	Return address in ac 
975:    LDA  7,-970(7)	CALL output
976:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
977:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
978:    LDA  1,-6(1)	Load address of new frame 
979:    LDA  3,1(7)	Return address in ac 
980:    LDA  7,-944(7)	CALL outnl
981:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
982:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
983:    LDC  3,3(6)	Load integer constant 
984:     ST  3,-8(1)	Save left side 
985:    LDC  3,4(6)	Load integer constant 
986:     LD  4,-8(1)	Load left into ac1 
987:    SUB  3,4,3	Op - 
988:     ST  3,-8(1)	Save left side 
989:    LDC  3,5(6)	Load integer constant 
990:     LD  4,-8(1)	Load left into ac1 
991:    SUB  3,4,3	Op - 
992:     ST  3,-8(1)	Store parameter 
* END PARAM output
993:    LDA  1,-6(1)	Load address of new frame 
994:    LDA  3,1(7)	Return address in ac 
995:    LDA  7,-990(7)	CALL output
996:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
997:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
998:    LDC  3,211(6)	Load integer constant 
999:     ST  3,-8(1)	Save left side 
1000:    LDC  3,17(6)	Load integer constant 
1001:     LD  4,-8(1)	Load left into ac1 
1002:    DIV  3,4,3	Op / 
1003:     ST  3,-8(1)	Save left side 
1004:    LDC  3,5(6)	Load integer constant 
1005:     LD  4,-8(1)	Load left into ac1 
1006:    DIV  3,4,3	Op / 
1007:     ST  3,-8(1)	Store parameter 
* END PARAM output
1008:    LDA  1,-6(1)	Load address of new frame 
1009:    LDA  3,1(7)	Return address in ac 
1010:    LDA  7,-1005(7)	CALL output
1011:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
1012:     ST  1,-6(1)	Store fp in ghost frame for output
* PARAM 1
1013:    LDC  3,211(6)	Load integer constant 
1014:     ST  3,-8(1)	Save left side 
1015:    LDC  3,17(6)	Load integer constant 
1016:     ST  3,-9(1)	Save left side 
1017:    LDC  3,5(6)	Load integer constant 
1018:     LD  4,-9(1)	Load left into ac1 
1019:    DIV  3,4,3	Op / 
1020:     LD  4,-8(1)	Load left into ac1 
1021:    DIV  3,4,3	Op / 
1022:     ST  3,-8(1)	Store parameter 
* END PARAM output
1023:    LDA  1,-6(1)	Load address of new frame 
1024:    LDA  3,1(7)	Return address in ac 
1025:    LDA  7,-1020(7)	CALL output
1026:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
1027:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
1028:    LDA  1,-6(1)	Load address of new frame 
1029:    LDA  3,1(7)	Return address in ac 
1030:    LDA  7,-994(7)	CALL outnl
1031:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
1032:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1033:    LDC  3,1(6)	Load Boolean constant 
1034:     ST  3,-8(1)	Save left side 
1035:    LDC  3,0(6)	Load Boolean constant 
1036:     LD  4,-8(1)	Load left into ac1 
1037:     OR  3,4,3	Op OR 
1038:     ST  3,-8(1)	Save left side 
1039:    LDC  3,0(6)	Load Boolean constant 
1040:     LD  4,-8(1)	Load left into ac1 
1041:    AND  3,4,3	Op AND 
1042:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1043:    LDA  1,-6(1)	Load address of new frame 
1044:    LDA  3,1(7)	Return address in ac 
1045:    LDA  7,-1028(7)	CALL outputb
1046:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1047:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1048:    LDC  3,1(6)	Load Boolean constant 
1049:     ST  3,-8(1)	Save left side 
1050:    LDC  3,0(6)	Load Boolean constant 
1051:     ST  3,-9(1)	Save left side 
1052:    LDC  3,0(6)	Load Boolean constant 
1053:     LD  4,-9(1)	Load left into ac1 
1054:    AND  3,4,3	Op AND 
1055:     LD  4,-8(1)	Load left into ac1 
1056:     OR  3,4,3	Op OR 
1057:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1058:    LDA  1,-6(1)	Load address of new frame 
1059:    LDA  3,1(7)	Return address in ac 
1060:    LDA  7,-1043(7)	CALL outputb
1061:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1062:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1063:    LDC  3,1(6)	Load Boolean constant 
1064:     ST  3,-8(1)	Save left side 
1065:    LDC  3,0(6)	Load Boolean constant 
1066:     ST  3,-9(1)	Save left side 
1067:    LDC  3,0(6)	Load Boolean constant 
1068:     LD  4,-9(1)	Load left into ac1 
1069:    AND  3,4,3	Op AND 
1070:     LD  4,-8(1)	Load left into ac1 
1071:     OR  3,4,3	Op OR 
1072:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1073:    LDA  1,-6(1)	Load address of new frame 
1074:    LDA  3,1(7)	Return address in ac 
1075:    LDA  7,-1058(7)	CALL outputb
1076:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
1077:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
1078:    LDA  1,-6(1)	Load address of new frame 
1079:    LDA  3,1(7)	Return address in ac 
1080:    LDA  7,-1044(7)	CALL outnl
1081:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
1082:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1083:    LDC  3,3(6)	Load integer constant 
1084:    RND  3,3,6	Op ? 
1085:     ST  3,-8(1)	Save left side 
1086:    LDC  3,3(6)	Load integer constant 
1087:     LD  4,-8(1)	Load left into ac1 
1088:    TLT  3,4,3	Op < 
1089:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1090:    LDA  1,-6(1)	Load address of new frame 
1091:    LDA  3,1(7)	Return address in ac 
1092:    LDA  7,-1075(7)	CALL outputb
1093:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1094:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1095:    LDC  3,3(6)	Load integer constant 
1096:    RND  3,3,6	Op ? 
1097:     ST  3,-8(1)	Save left side 
1098:    LDC  3,3(6)	Load integer constant 
1099:     LD  4,-8(1)	Load left into ac1 
1100:    TLT  3,4,3	Op < 
1101:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1102:    LDA  1,-6(1)	Load address of new frame 
1103:    LDA  3,1(7)	Return address in ac 
1104:    LDA  7,-1087(7)	CALL outputb
1105:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1106:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1107:    LDC  3,3(6)	Load integer constant 
1108:    RND  3,3,6	Op ? 
1109:     ST  3,-8(1)	Save left side 
1110:    LDC  3,3(6)	Load integer constant 
1111:     LD  4,-8(1)	Load left into ac1 
1112:    TLT  3,4,3	Op < 
1113:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1114:    LDA  1,-6(1)	Load address of new frame 
1115:    LDA  3,1(7)	Return address in ac 
1116:    LDA  7,-1099(7)	CALL outputb
1117:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1118:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1119:    LDC  3,3(6)	Load integer constant 
1120:    RND  3,3,6	Op ? 
1121:     ST  3,-8(1)	Save left side 
1122:    LDC  3,3(6)	Load integer constant 
1123:     LD  4,-8(1)	Load left into ac1 
1124:    TLT  3,4,3	Op < 
1125:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1126:    LDA  1,-6(1)	Load address of new frame 
1127:    LDA  3,1(7)	Return address in ac 
1128:    LDA  7,-1111(7)	CALL outputb
1129:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1130:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1131:    LDC  3,3(6)	Load integer constant 
1132:    RND  3,3,6	Op ? 
1133:     ST  3,-8(1)	Save left side 
1134:    LDC  3,3(6)	Load integer constant 
1135:     LD  4,-8(1)	Load left into ac1 
1136:    TLT  3,4,3	Op < 
1137:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1138:    LDA  1,-6(1)	Load address of new frame 
1139:    LDA  3,1(7)	Return address in ac 
1140:    LDA  7,-1123(7)	CALL outputb
1141:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1142:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1143:    LDC  3,3(6)	Load integer constant 
1144:    RND  3,3,6	Op ? 
1145:     ST  3,-8(1)	Save left side 
1146:    LDC  3,3(6)	Load integer constant 
1147:     LD  4,-8(1)	Load left into ac1 
1148:    TLT  3,4,3	Op < 
1149:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1150:    LDA  1,-6(1)	Load address of new frame 
1151:    LDA  3,1(7)	Return address in ac 
1152:    LDA  7,-1135(7)	CALL outputb
1153:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1154:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1155:    LDC  3,3(6)	Load integer constant 
1156:    RND  3,3,6	Op ? 
1157:     ST  3,-8(1)	Save left side 
1158:    LDC  3,3(6)	Load integer constant 
1159:     LD  4,-8(1)	Load left into ac1 
1160:    TLT  3,4,3	Op < 
1161:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1162:    LDA  1,-6(1)	Load address of new frame 
1163:    LDA  3,1(7)	Return address in ac 
1164:    LDA  7,-1147(7)	CALL outputb
1165:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1166:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1167:    LDC  3,3(6)	Load integer constant 
1168:    RND  3,3,6	Op ? 
1169:     ST  3,-8(1)	Save left side 
1170:    LDC  3,3(6)	Load integer constant 
1171:     LD  4,-8(1)	Load left into ac1 
1172:    TLT  3,4,3	Op < 
1173:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1174:    LDA  1,-6(1)	Load address of new frame 
1175:    LDA  3,1(7)	Return address in ac 
1176:    LDA  7,-1159(7)	CALL outputb
1177:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1178:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1179:    LDC  3,3(6)	Load integer constant 
1180:    RND  3,3,6	Op ? 
1181:     ST  3,-8(1)	Save left side 
1182:    LDC  3,3(6)	Load integer constant 
1183:     LD  4,-8(1)	Load left into ac1 
1184:    TLT  3,4,3	Op < 
1185:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1186:    LDA  1,-6(1)	Load address of new frame 
1187:    LDA  3,1(7)	Return address in ac 
1188:    LDA  7,-1171(7)	CALL outputb
1189:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1190:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1191:    LDC  3,3(6)	Load integer constant 
1192:    RND  3,3,6	Op ? 
1193:     ST  3,-8(1)	Save left side 
1194:    LDC  3,3(6)	Load integer constant 
1195:     LD  4,-8(1)	Load left into ac1 
1196:    TLT  3,4,3	Op < 
1197:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1198:    LDA  1,-6(1)	Load address of new frame 
1199:    LDA  3,1(7)	Return address in ac 
1200:    LDA  7,-1183(7)	CALL outputb
1201:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1202:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1203:    LDC  3,3(6)	Load integer constant 
1204:    RND  3,3,6	Op ? 
1205:     ST  3,-8(1)	Save left side 
1206:    LDC  3,3(6)	Load integer constant 
1207:     LD  4,-8(1)	Load left into ac1 
1208:    TLT  3,4,3	Op < 
1209:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1210:    LDA  1,-6(1)	Load address of new frame 
1211:    LDA  3,1(7)	Return address in ac 
1212:    LDA  7,-1195(7)	CALL outputb
1213:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1214:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1215:    LDC  3,3(6)	Load integer constant 
1216:    RND  3,3,6	Op ? 
1217:     ST  3,-8(1)	Save left side 
1218:    LDC  3,3(6)	Load integer constant 
1219:     LD  4,-8(1)	Load left into ac1 
1220:    TLT  3,4,3	Op < 
1221:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1222:    LDA  1,-6(1)	Load address of new frame 
1223:    LDA  3,1(7)	Return address in ac 
1224:    LDA  7,-1207(7)	CALL outputb
1225:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1226:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1227:    LDC  3,1(6)	Load integer constant 
1228:    RND  3,3,6	Op ? 
1229:     ST  3,-8(1)	Save left side 
1230:    LDC  3,0(6)	Load integer constant 
1231:     LD  4,-8(1)	Load left into ac1 
1232:    TEQ  3,4,3	Op == 
1233:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1234:    LDA  1,-6(1)	Load address of new frame 
1235:    LDA  3,1(7)	Return address in ac 
1236:    LDA  7,-1219(7)	CALL outputb
1237:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
1238:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
1239:    LDA  1,-6(1)	Load address of new frame 
1240:    LDA  3,1(7)	Return address in ac 
1241:    LDA  7,-1205(7)	CALL outnl
1242:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
1243:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1244:    LDC  3,10000(6)	Load integer constant 
1245:    RND  3,3,6	Op ? 
1246:     ST  3,-8(1)	Save left side 
1247:    LDC  3,0(6)	Load integer constant 
1248:     LD  4,-8(1)	Load left into ac1 
1249:    TGT  3,4,3	Op > 
1250:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1251:    LDA  1,-6(1)	Load address of new frame 
1252:    LDA  3,1(7)	Return address in ac 
1253:    LDA  7,-1236(7)	CALL outputb
1254:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
1255:     ST  1,-6(1)	Store fp in ghost frame for outputb
* PARAM 1
1256:    LDC  3,10000(6)	Load integer constant 
1257:    RND  3,3,6	Op ? 
1258:     ST  3,-8(1)	Save left side 
1259:    LDC  3,0(6)	Load integer constant 
1260:     LD  4,-8(1)	Load left into ac1 
1261:    TGT  3,4,3	Op > 
1262:     ST  3,-8(1)	Store parameter 
* END PARAM outputb
1263:    LDA  1,-6(1)	Load address of new frame 
1264:    LDA  3,1(7)	Return address in ac 
1265:    LDA  7,-1248(7)	CALL outputb
1266:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
1267:     ST  1,-6(1)	Store fp in ghost frame for outnl
* END PARAM outnl
1268:    LDA  1,-6(1)	Load address of new frame 
1269:    LDA  3,1(7)	Return address in ac 
1270:    LDA  7,-1234(7)	CALL outnl
1271:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
1272:    LDC  2,0(6)	Set return value to 0 
1273:     LD  3,-1(1)	Load return address 
1274:     LD  1,0(1)	Adjust fp 
1275:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,1275(7)	Jump to init [backpatch] 
* INIT
1276:     LD  0,0(0)	Set the global pointer 
1277:    LDA  1,-12(0)	set first frame at end of globals 
1278:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
1279:    LDC  3,10(6)	load size of array y
1280:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
1281:    LDA  3,1(7)	Return address in ac 
1282:    LDA  7,-1241(7)	Jump to main 
1283:   HALT  0,0,0	DONE! 
* END INIT
