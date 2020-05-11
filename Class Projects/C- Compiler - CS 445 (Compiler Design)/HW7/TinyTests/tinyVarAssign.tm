* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyVarAssign.c-
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
* FUNCTION esperanza
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* Compound Body
* EXPRESSION
 45:    LDC  3,444(6)	Load integer constant 
 46:     ST  3,0(0)	Store variable gx
* EXPRESSION
 47:    LDC  3,555(6)	Load integer constant 
 48:     ST  3,-4(1)	Store variable x
* EXPRESSION
 49:    LDC  3,666(6)	Load integer constant 
 50:     ST  3,-12(0)	Store variable sx
* EXPRESSION
 51:    LDC  3,9(6)	Load integer constant 
 52:     ST  3,-16(1)	Save index 
 53:    LDC  3,222(6)	Load integer constant 
 54:     LD  4,-16(1)	Restore index 
 55:    LDA  5,-2(0)	Load address of base of array gy
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
 58:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
 59:    LDA  3,-2(0)	Load address of base of array gy
 60:     ST  3,-18(1)	Save left side 
 61:    LDC  3,9(6)	Load integer constant 
 62:     LD  4,-18(1)	Load left into ac1 
 63:    SUB  3,4,3	compute location from index 
 64:     LD  3,0(3)	Load array element 
 65:     ST  3,-18(1)	Store parameter 
* END PARAM output
 66:    LDA  1,-16(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
 70:     LD  3,0(0)	Load variable gx
 71:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
 72:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
 73:     LD  3,0(0)	Load variable gx
 74:     ST  3,-18(1)	Store parameter 
* END PARAM output
 75:    LDA  1,-16(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
 79:    LDC  3,8(6)	Load integer constant 
 80:     ST  3,-16(1)	Save index 
 81:    LDA  3,-2(0)	Load address of base of array gy
 82:     ST  3,-17(1)	Save left side 
 83:    LDC  3,9(6)	Load integer constant 
 84:     LD  4,-17(1)	Load left into ac1 
 85:    SUB  3,4,3	compute location from index 
 86:     LD  3,0(3)	Load array element 
 87:     LD  4,-16(1)	Restore index 
 88:    LDA  5,-2(0)	Load address of base of array gy
 89:    SUB  5,5,4	Compute offset of value 
 90:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
 91:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
 92:    LDA  3,-2(0)	Load address of base of array gy
 93:     ST  3,-18(1)	Save left side 
 94:    LDC  3,8(6)	Load integer constant 
 95:     LD  4,-18(1)	Load left into ac1 
 96:    SUB  3,4,3	compute location from index 
 97:     LD  3,0(3)	Load array element 
 98:     ST  3,-18(1)	Store parameter 
* END PARAM output
 99:    LDA  1,-16(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
103:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
104:    LDA  1,-16(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-70(7)	CALL outnl
107:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
108:    LDC  3,9(6)	Load integer constant 
109:     ST  3,-16(1)	Save index 
110:    LDC  3,333(6)	Load integer constant 
111:     LD  4,-16(1)	Restore index 
112:    LDA  5,-6(1)	Load address of base of array y
113:    SUB  5,5,4	Compute offset of value 
114:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
115:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
116:    LDA  3,-6(1)	Load address of base of array y
117:     ST  3,-18(1)	Save left side 
118:    LDC  3,9(6)	Load integer constant 
119:     LD  4,-18(1)	Load left into ac1 
120:    SUB  3,4,3	compute location from index 
121:     LD  3,0(3)	Load array element 
122:     ST  3,-18(1)	Store parameter 
* END PARAM output
123:    LDA  1,-16(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
127:     LD  3,-4(1)	Load variable x
128:     ST  3,-4(1)	Store variable x
* EXPRESSION
* CALL output
129:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
130:     LD  3,-4(1)	Load variable x
131:     ST  3,-18(1)	Store parameter 
* END PARAM output
132:    LDA  1,-16(1)	Load address of new frame 
133:    LDA  3,1(7)	Return address in ac 
134:    LDA  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
136:    LDC  3,7(6)	Load integer constant 
137:     ST  3,-16(1)	Save index 
138:    LDA  3,-6(1)	Load address of base of array y
139:     LD  3,1(3)	Load array size 
140:     LD  4,-16(1)	Restore index 
141:    LDA  5,-6(1)	Load address of base of array y
142:    SUB  5,5,4	Compute offset of value 
143:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
144:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
145:    LDA  3,-6(1)	Load address of base of array y
146:     ST  3,-18(1)	Save left side 
147:    LDC  3,7(6)	Load integer constant 
148:     LD  4,-18(1)	Load left into ac1 
149:    SUB  3,4,3	compute location from index 
150:     LD  3,0(3)	Load array element 
151:     ST  3,-18(1)	Store parameter 
* END PARAM output
152:    LDA  1,-16(1)	Load address of new frame 
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-149(7)	CALL output
155:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
156:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
157:    LDA  1,-16(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-123(7)	CALL outnl
160:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
161:     LD  3,-2(1)	Load variable px
162:     ST  3,-2(1)	Store variable px
* EXPRESSION
* CALL output
163:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
164:     LD  3,-2(1)	Load variable px
165:     ST  3,-18(1)	Store parameter 
* END PARAM output
166:    LDA  1,-16(1)	Load address of new frame 
167:    LDA  3,1(7)	Return address in ac 
168:    LDA  7,-163(7)	CALL output
169:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
170:    LDC  3,101(6)	Load integer constant 
171:     ST  3,-2(1)	Store variable px
* EXPRESSION
172:    LDC  3,8(6)	Load integer constant 
173:     ST  3,-16(1)	Save index 
174:     LD  3,-3(1)	Load address of base of array py
175:     ST  3,-17(1)	Save left side 
176:    LDC  3,9(6)	Load integer constant 
177:     LD  4,-17(1)	Load left into ac1 
178:    SUB  3,4,3	compute location from index 
179:     LD  3,0(3)	Load array element 
180:     LD  4,-16(1)	Restore index 
181:     LD  5,-3(1)	Load address of base of array py
182:    SUB  5,5,4	Compute offset of value 
183:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL output
184:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
185:     LD  3,-3(1)	Load address of base of array py
186:     ST  3,-18(1)	Save left side 
187:    LDC  3,8(6)	Load integer constant 
188:     LD  4,-18(1)	Load left into ac1 
189:    SUB  3,4,3	compute location from index 
190:     LD  3,0(3)	Load array element 
191:     ST  3,-18(1)	Store parameter 
* END PARAM output
192:    LDA  1,-16(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
196:    LDC  3,8(6)	Load integer constant 
197:     ST  3,-16(1)	Save index 
198:    LDC  3,102(6)	Load integer constant 
199:     LD  4,-16(1)	Restore index 
200:     LD  5,-3(1)	Load address of base of array py
201:    SUB  5,5,4	Compute offset of value 
202:     ST  3,0(5)	Store variable py
* EXPRESSION
203:    LDC  3,7(6)	Load integer constant 
204:     ST  3,-16(1)	Save index 
205:     LD  3,-3(1)	Load address of base of array py
206:     LD  3,1(3)	Load array size 
207:     LD  4,-16(1)	Restore index 
208:     LD  5,-3(1)	Load address of base of array py
209:    SUB  5,5,4	Compute offset of value 
210:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL output
211:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
212:     LD  3,-3(1)	Load address of base of array py
213:     ST  3,-18(1)	Save left side 
214:    LDC  3,7(6)	Load integer constant 
215:     LD  4,-18(1)	Load left into ac1 
216:    SUB  3,4,3	compute location from index 
217:     LD  3,0(3)	Load array element 
218:     ST  3,-18(1)	Store parameter 
* END PARAM output
219:    LDA  1,-16(1)	Load address of new frame 
220:    LDA  3,1(7)	Return address in ac 
221:    LDA  7,-216(7)	CALL output
222:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
223:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
224:    LDA  1,-16(1)	Load address of new frame 
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-190(7)	CALL outnl
227:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
228:    LDC  3,9(6)	Load integer constant 
229:     ST  3,-16(1)	Save index 
230:    LDC  3,444(6)	Load integer constant 
231:     LD  4,-16(1)	Restore index 
232:    LDA  5,-14(0)	Load address of base of array sy
233:    SUB  5,5,4	Compute offset of value 
234:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL output
235:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
236:    LDA  3,-14(0)	Load address of base of array sy
237:     ST  3,-18(1)	Save left side 
238:    LDC  3,9(6)	Load integer constant 
239:     LD  4,-18(1)	Load left into ac1 
240:    SUB  3,4,3	compute location from index 
241:     LD  3,0(3)	Load array element 
242:     ST  3,-18(1)	Store parameter 
* END PARAM output
243:    LDA  1,-16(1)	Load address of new frame 
244:    LDA  3,1(7)	Return address in ac 
245:    LDA  7,-240(7)	CALL output
246:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
247:     LD  3,-12(0)	Load variable sx
248:     ST  3,-12(0)	Store variable sx
* EXPRESSION
* CALL output
249:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
250:     LD  3,-12(0)	Load variable sx
251:     ST  3,-18(1)	Store parameter 
* END PARAM output
252:    LDA  1,-16(1)	Load address of new frame 
253:    LDA  3,1(7)	Return address in ac 
254:    LDA  7,-249(7)	CALL output
255:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
256:    LDC  3,7(6)	Load integer constant 
257:     ST  3,-16(1)	Save index 
258:    LDA  3,-14(0)	Load address of base of array sy
259:     LD  3,1(3)	Load array size 
260:     LD  4,-16(1)	Restore index 
261:    LDA  5,-14(0)	Load address of base of array sy
262:    SUB  5,5,4	Compute offset of value 
263:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL output
264:     ST  1,-16(1)	Store fp in ghost frame for output
* PARAM 1
265:    LDA  3,-14(0)	Load address of base of array sy
266:     ST  3,-18(1)	Save left side 
267:    LDC  3,7(6)	Load integer constant 
268:     LD  4,-18(1)	Load left into ac1 
269:    SUB  3,4,3	compute location from index 
270:     LD  3,0(3)	Load array element 
271:     ST  3,-18(1)	Store parameter 
* END PARAM output
272:    LDA  1,-16(1)	Load address of new frame 
273:    LDA  3,1(7)	Return address in ac 
274:    LDA  7,-269(7)	CALL output
275:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
276:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
277:    LDA  1,-16(1)	Load address of new frame 
278:    LDA  3,1(7)	Return address in ac 
279:    LDA  7,-243(7)	CALL outnl
280:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
281:    LDC  2,0(6)	Set return value to 0 
282:     LD  3,-1(1)	Load return address 
283:     LD  1,0(1)	Adjust fp 
284:    LDA  7,0(3)	Return 
* END FUNCTION esperanza
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
285:     ST  3,-1(1)	Store return address 
* COMPOUND
286:    LDC  3,10(6)	load size of array zy
287:     ST  3,-3(1)	save size of array zy
* Compound Body
* EXPRESSION
288:    LDC  3,999(6)	Load integer constant 
289:     ST  3,-2(1)	Store variable zx
* EXPRESSION
290:    LDC  3,9(6)	Load integer constant 
291:     ST  3,-14(1)	Save index 
292:    LDC  3,111(6)	Load integer constant 
293:     LD  4,-14(1)	Restore index 
294:    LDA  5,-4(1)	Load address of base of array zy
295:    SUB  5,5,4	Compute offset of value 
296:     ST  3,0(5)	Store variable zy
* EXPRESSION
* CALL output
297:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
298:     LD  3,-2(1)	Load variable zx
299:     ST  3,-16(1)	Store parameter 
* END PARAM output
300:    LDA  1,-14(1)	Load address of new frame 
301:    LDA  3,1(7)	Return address in ac 
302:    LDA  7,-297(7)	CALL output
303:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
304:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
305:    LDA  3,-4(1)	Load address of base of array zy
306:     ST  3,-16(1)	Save left side 
307:    LDC  3,9(6)	Load integer constant 
308:     LD  4,-16(1)	Load left into ac1 
309:    SUB  3,4,3	compute location from index 
310:     LD  3,0(3)	Load array element 
311:     ST  3,-16(1)	Store parameter 
* END PARAM output
312:    LDA  1,-14(1)	Load address of new frame 
313:    LDA  3,1(7)	Return address in ac 
314:    LDA  7,-309(7)	CALL output
315:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
316:     ST  1,-14(1)	Store fp in ghost frame for outnl
* END PARAM outnl
317:    LDA  1,-14(1)	Load address of new frame 
318:    LDA  3,1(7)	Return address in ac 
319:    LDA  7,-283(7)	CALL outnl
320:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL esperanza
321:     ST  1,-14(1)	Store fp in ghost frame for esperanza
* PARAM 1
322:     LD  3,-2(1)	Load variable zx
323:     ST  3,-16(1)	Store parameter 
* PARAM 2
324:    LDA  3,-4(1)	Load address of base of array zy
325:     ST  3,-17(1)	Store parameter 
* END PARAM esperanza
326:    LDA  1,-14(1)	Load address of new frame 
327:    LDA  3,1(7)	Return address in ac 
328:    LDA  7,-287(7)	CALL esperanza
329:    LDA  3,0(2)	Save the result in ac 
* END CALL esperanza
* EXPRESSION
* CALL output
330:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
331:     LD  3,-2(1)	Load variable zx
332:     ST  3,-16(1)	Store parameter 
* END PARAM output
333:    LDA  1,-14(1)	Load address of new frame 
334:    LDA  3,1(7)	Return address in ac 
335:    LDA  7,-330(7)	CALL output
336:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
337:     ST  1,-14(1)	Store fp in ghost frame for output
* PARAM 1
338:    LDA  3,-4(1)	Load address of base of array zy
339:     ST  3,-16(1)	Save left side 
340:    LDC  3,9(6)	Load integer constant 
341:     LD  4,-16(1)	Load left into ac1 
342:    SUB  3,4,3	compute location from index 
343:     LD  3,0(3)	Load array element 
344:     ST  3,-16(1)	Store parameter 
* END PARAM output
345:    LDA  1,-14(1)	Load address of new frame 
346:    LDA  3,1(7)	Return address in ac 
347:    LDA  7,-342(7)	CALL output
348:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
349:     ST  1,-14(1)	Store fp in ghost frame for outnl
* END PARAM outnl
350:    LDA  1,-14(1)	Load address of new frame 
351:    LDA  3,1(7)	Return address in ac 
352:    LDA  7,-316(7)	CALL outnl
353:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
354:    LDC  2,0(6)	Set return value to 0 
355:     LD  3,-1(1)	Load return address 
356:     LD  1,0(1)	Adjust fp 
357:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,357(7)	Jump to init [backpatch] 
* INIT
358:     LD  0,0(0)	Set the global pointer 
359:    LDA  1,-24(0)	set first frame at end of globals 
360:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
361:    LDC  3,10(6)	load size of array gy
362:     ST  3,-1(0)	save size of array gy
363:    LDC  3,10(6)	load size of array sy
364:     ST  3,-13(0)	save size of array sy
* END INIT GLOBALS AND STATICS
365:    LDA  3,1(7)	Return address in ac 
366:    LDA  7,-82(7)	Jump to main 
367:   HALT  0,0,0	DONE! 
* END INIT
