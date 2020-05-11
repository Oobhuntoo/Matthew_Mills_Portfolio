* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyCall.c-
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
* FUNCTION cheyenne
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 43:     ST  1,-5(1)	Store fp in ghost frame for output
* PARAM 1
 44:     LD  3,-2(1)	Load variable a
 45:     ST  3,-7(1)	Store parameter 
* END PARAM output
 46:    LDA  1,-5(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outputb
 50:     ST  1,-5(1)	Store fp in ghost frame for outputb
* PARAM 1
 51:     LD  3,-3(1)	Load variable b
 52:     ST  3,-7(1)	Store parameter 
* END PARAM outputb
 53:    LDA  1,-5(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-38(7)	CALL outputb
 56:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputc
 57:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 58:     LD  3,-4(1)	Load variable c
 59:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
 60:    LDA  1,-5(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-33(7)	CALL outputc
 63:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outnl
 64:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 65:    LDA  1,-5(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-31(7)	CALL outnl
 68:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    LDA  7,0(3)	Return 
* END FUNCTION cheyenne
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION sioux
 73:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 74:     ST  1,-5(1)	Store fp in ghost frame for output
* PARAM 1
 75:     LD  3,-2(1)	Load address of base of array a
 76:     ST  3,-7(1)	Save left side 
 77:    LDC  3,1(6)	Load integer constant 
 78:     LD  4,-7(1)	Load left into ac1 
 79:    SUB  3,4,3	compute location from index 
 80:     LD  3,0(3)	Load array element 
 81:     ST  3,-7(1)	Store parameter 
* END PARAM output
 82:    LDA  1,-5(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outputb
 86:     ST  1,-5(1)	Store fp in ghost frame for outputb
* PARAM 1
 87:     LD  3,-3(1)	Load address of base of array b
 88:     ST  3,-7(1)	Save left side 
 89:    LDC  3,2(6)	Load integer constant 
 90:     LD  4,-7(1)	Load left into ac1 
 91:    SUB  3,4,3	compute location from index 
 92:     LD  3,0(3)	Load array element 
 93:     ST  3,-7(1)	Store parameter 
* END PARAM outputb
 94:    LDA  1,-5(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-79(7)	CALL outputb
 97:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputc
 98:     ST  1,-5(1)	Store fp in ghost frame for outputc
* PARAM 1
 99:     LD  3,-4(1)	Load address of base of array c
100:     ST  3,-7(1)	Save left side 
101:    LDC  3,3(6)	Load integer constant 
102:     LD  4,-7(1)	Load left into ac1 
103:    SUB  3,4,3	compute location from index 
104:     LD  3,0(3)	Load array element 
105:     ST  3,-7(1)	Store parameter 
* END PARAM outputc
106:    LDA  1,-5(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-79(7)	CALL outputc
109:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outnl
110:     ST  1,-5(1)	Store fp in ghost frame for outnl
* END PARAM outnl
111:    LDA  1,-5(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-77(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
115:    LDC  2,0(6)	Set return value to 0 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    LDA  7,0(3)	Return 
* END FUNCTION sioux
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION comanche
119:     ST  3,-1(1)	Store return address 
* COMPOUND
120:    LDC  3,5(6)	load size of array b
121:     ST  3,-3(1)	save size of array b
122:    LDC  3,5(6)	load size of array c
123:     ST  3,-9(1)	save size of array c
* Compound Body
* EXPRESSION
124:    LDC  3,2(6)	Load integer constant 
125:     ST  3,-15(1)	Save index 
126:    LDC  3,1(6)	Load Boolean constant 
127:     LD  4,-15(1)	Restore index 
128:    LDA  5,-4(1)	Load address of base of array b
129:    SUB  5,5,4	Compute offset of value 
130:     ST  3,0(5)	Store variable b
* EXPRESSION
131:    LDC  3,3(6)	Load integer constant 
132:     ST  3,-15(1)	Save index 
133:    LDC  3,122(6)	Load char constant 
134:     LD  4,-15(1)	Restore index 
135:    LDA  5,-10(1)	Load address of base of array c
136:    SUB  5,5,4	Compute offset of value 
137:     ST  3,0(5)	Store variable c
* EXPRESSION
* CALL sioux
138:     ST  1,-15(1)	Store fp in ghost frame for sioux
* PARAM 1
139:     LD  3,-2(1)	Load address of base of array z
140:     ST  3,-17(1)	Store parameter 
* PARAM 2
141:    LDA  3,-4(1)	Load address of base of array b
142:     ST  3,-18(1)	Store parameter 
* PARAM 3
143:    LDA  3,-10(1)	Load address of base of array c
144:     ST  3,-19(1)	Store parameter 
* END PARAM sioux
145:    LDA  1,-15(1)	Load address of new frame 
146:    LDA  3,1(7)	Return address in ac 
147:    LDA  7,-75(7)	CALL sioux
148:    LDA  3,0(2)	Save the result in ac 
* END CALL sioux
* END COMPOUND
* Add standard closing in case there is no return statement
149:    LDC  2,0(6)	Set return value to 0 
150:     LD  3,-1(1)	Load return address 
151:     LD  1,0(1)	Adjust fp 
152:    LDA  7,0(3)	Return 
* END FUNCTION comanche
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
153:     ST  3,-1(1)	Store return address 
* COMPOUND
154:    LDC  3,5(6)	load size of array a
155:     ST  3,-2(1)	save size of array a
156:    LDC  3,6(6)	load size of array b
157:     ST  3,-8(1)	save size of array b
158:    LDC  3,7(6)	load size of array c
159:     ST  3,-15(1)	save size of array c
* Compound Body
* EXPRESSION
160:    LDC  3,1(6)	Load integer constant 
161:     ST  3,-23(1)	Save index 
162:    LDC  3,555(6)	Load integer constant 
163:     LD  4,-23(1)	Restore index 
164:    LDA  5,-3(1)	Load address of base of array a
165:    SUB  5,5,4	Compute offset of value 
166:     ST  3,0(5)	Store variable a
* EXPRESSION
167:    LDC  3,2(6)	Load integer constant 
168:     ST  3,-23(1)	Save index 
169:    LDC  3,1(6)	Load Boolean constant 
170:     LD  4,-23(1)	Restore index 
171:    LDA  5,-9(1)	Load address of base of array b
172:    SUB  5,5,4	Compute offset of value 
173:     ST  3,0(5)	Store variable b
* EXPRESSION
174:    LDC  3,3(6)	Load integer constant 
175:     ST  3,-23(1)	Save index 
176:    LDC  3,122(6)	Load char constant 
177:     LD  4,-23(1)	Restore index 
178:    LDA  5,-16(1)	Load address of base of array c
179:    SUB  5,5,4	Compute offset of value 
180:     ST  3,0(5)	Store variable c
* EXPRESSION
* CALL cheyenne
181:     ST  1,-23(1)	Store fp in ghost frame for cheyenne
* PARAM 1
182:    LDC  3,666(6)	Load integer constant 
183:     ST  3,-25(1)	Store parameter 
* PARAM 2
184:    LDC  3,1(6)	Load Boolean constant 
185:     ST  3,-26(1)	Store parameter 
* PARAM 3
186:    LDC  3,99(6)	Load char constant 
187:     ST  3,-27(1)	Store parameter 
* END PARAM cheyenne
188:    LDA  1,-23(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-149(7)	CALL cheyenne
191:    LDA  3,0(2)	Save the result in ac 
* END CALL cheyenne
* EXPRESSION
* CALL cheyenne
192:     ST  1,-23(1)	Store fp in ghost frame for cheyenne
* PARAM 1
193:    LDC  3,777(6)	Load integer constant 
194:     ST  3,-25(1)	Store parameter 
* PARAM 2
195:    LDC  3,0(6)	Load Boolean constant 
196:     ST  3,-26(1)	Store parameter 
* PARAM 3
197:    LDC  3,100(6)	Load char constant 
198:     ST  3,-27(1)	Store parameter 
* END PARAM cheyenne
199:    LDA  1,-23(1)	Load address of new frame 
200:    LDA  3,1(7)	Return address in ac 
201:    LDA  7,-160(7)	CALL cheyenne
202:    LDA  3,0(2)	Save the result in ac 
* END CALL cheyenne
* EXPRESSION
* CALL sioux
203:     ST  1,-23(1)	Store fp in ghost frame for sioux
* PARAM 1
204:    LDA  3,-3(1)	Load address of base of array a
205:     ST  3,-25(1)	Store parameter 
* PARAM 2
206:    LDA  3,-9(1)	Load address of base of array b
207:     ST  3,-26(1)	Store parameter 
* PARAM 3
208:    LDA  3,-16(1)	Load address of base of array c
209:     ST  3,-27(1)	Store parameter 
* END PARAM sioux
210:    LDA  1,-23(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-140(7)	CALL sioux
213:    LDA  3,0(2)	Save the result in ac 
* END CALL sioux
* EXPRESSION
* CALL comanche
214:     ST  1,-23(1)	Store fp in ghost frame for comanche
* PARAM 1
215:    LDA  3,-3(1)	Load address of base of array a
216:     ST  3,-25(1)	Store parameter 
* END PARAM comanche
217:    LDA  1,-23(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-101(7)	CALL comanche
220:    LDA  3,0(2)	Save the result in ac 
* END CALL comanche
* EXPRESSION
221:    LDC  3,1(6)	Load integer constant 
222:     ST  3,-23(1)	Save index 
223:    LDC  3,888(6)	Load integer constant 
224:     LD  4,-23(1)	Restore index 
225:    LDA  5,-1(0)	Load address of base of array ga
226:    SUB  5,5,4	Compute offset of value 
227:     ST  3,0(5)	Store variable ga
* EXPRESSION
228:    LDC  3,2(6)	Load integer constant 
229:     ST  3,-23(1)	Save index 
230:    LDC  3,0(6)	Load Boolean constant 
231:     LD  4,-23(1)	Restore index 
232:    LDA  5,-7(0)	Load address of base of array gb
233:    SUB  5,5,4	Compute offset of value 
234:     ST  3,0(5)	Store variable gb
* EXPRESSION
235:    LDC  3,3(6)	Load integer constant 
236:     ST  3,-23(1)	Save index 
237:    LDC  3,103(6)	Load char constant 
238:     LD  4,-23(1)	Restore index 
239:    LDA  5,-14(0)	Load address of base of array gc
240:    SUB  5,5,4	Compute offset of value 
241:     ST  3,0(5)	Store variable gc
* EXPRESSION
* CALL sioux
242:     ST  1,-23(1)	Store fp in ghost frame for sioux
* PARAM 1
243:    LDA  3,-1(0)	Load address of base of array ga
244:     ST  3,-25(1)	Store parameter 
* PARAM 2
245:    LDA  3,-7(0)	Load address of base of array gb
246:     ST  3,-26(1)	Store parameter 
* PARAM 3
247:    LDA  3,-14(0)	Load address of base of array gc
248:     ST  3,-27(1)	Store parameter 
* END PARAM sioux
249:    LDA  1,-23(1)	Load address of new frame 
250:    LDA  3,1(7)	Return address in ac 
251:    LDA  7,-179(7)	CALL sioux
252:    LDA  3,0(2)	Save the result in ac 
* END CALL sioux
* EXPRESSION
* CALL comanche
253:     ST  1,-23(1)	Store fp in ghost frame for comanche
* PARAM 1
254:    LDA  3,-1(0)	Load address of base of array ga
255:     ST  3,-25(1)	Store parameter 
* END PARAM comanche
256:    LDA  1,-23(1)	Load address of new frame 
257:    LDA  3,1(7)	Return address in ac 
258:    LDA  7,-140(7)	CALL comanche
259:    LDA  3,0(2)	Save the result in ac 
* END CALL comanche
* COMPOUND
* Compound Body
* EXPRESSION
260:    LDC  3,1(6)	Load integer constant 
261:     ST  3,-23(1)	Save index 
262:    LDC  3,999(6)	Load integer constant 
263:     LD  4,-23(1)	Restore index 
264:    LDA  5,-22(0)	Load address of base of array ga
265:    SUB  5,5,4	Compute offset of value 
266:     ST  3,0(5)	Store variable ga
* EXPRESSION
267:    LDC  3,2(6)	Load integer constant 
268:     ST  3,-23(1)	Save index 
269:    LDC  3,1(6)	Load Boolean constant 
270:     LD  4,-23(1)	Restore index 
271:    LDA  5,-28(0)	Load address of base of array gb
272:    SUB  5,5,4	Compute offset of value 
273:     ST  3,0(5)	Store variable gb
* EXPRESSION
274:    LDC  3,3(6)	Load integer constant 
275:     ST  3,-23(1)	Save index 
276:    LDC  3,115(6)	Load char constant 
277:     LD  4,-23(1)	Restore index 
278:    LDA  5,-35(0)	Load address of base of array gc
279:    SUB  5,5,4	Compute offset of value 
280:     ST  3,0(5)	Store variable gc
* EXPRESSION
* CALL sioux
281:     ST  1,-23(1)	Store fp in ghost frame for sioux
* PARAM 1
282:    LDA  3,-22(0)	Load address of base of array ga
283:     ST  3,-25(1)	Store parameter 
* PARAM 2
284:    LDA  3,-28(0)	Load address of base of array gb
285:     ST  3,-26(1)	Store parameter 
* PARAM 3
286:    LDA  3,-35(0)	Load address of base of array gc
287:     ST  3,-27(1)	Store parameter 
* END PARAM sioux
288:    LDA  1,-23(1)	Load address of new frame 
289:    LDA  3,1(7)	Return address in ac 
290:    LDA  7,-218(7)	CALL sioux
291:    LDA  3,0(2)	Save the result in ac 
* END CALL sioux
* EXPRESSION
* CALL comanche
292:     ST  1,-23(1)	Store fp in ghost frame for comanche
* PARAM 1
293:    LDA  3,-22(0)	Load address of base of array ga
294:     ST  3,-25(1)	Store parameter 
* END PARAM comanche
295:    LDA  1,-23(1)	Load address of new frame 
296:    LDA  3,1(7)	Return address in ac 
297:    LDA  7,-179(7)	CALL comanche
298:    LDA  3,0(2)	Save the result in ac 
* END CALL comanche
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
299:    LDC  2,0(6)	Set return value to 0 
300:     LD  3,-1(1)	Load return address 
301:     LD  1,0(1)	Adjust fp 
302:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,302(7)	Jump to init [backpatch] 
* INIT
303:     LD  0,0(0)	Set the global pointer 
304:    LDA  1,-42(0)	set first frame at end of globals 
305:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
306:    LDC  3,5(6)	load size of array ga
307:     ST  3,0(0)	save size of array ga
308:    LDC  3,5(6)	load size of array ga
309:     ST  3,-21(0)	save size of array ga
310:    LDC  3,6(6)	load size of array gb
311:     ST  3,-6(0)	save size of array gb
312:    LDC  3,6(6)	load size of array gb
313:     ST  3,-27(0)	save size of array gb
314:    LDC  3,7(6)	load size of array gc
315:     ST  3,-13(0)	save size of array gc
316:    LDC  3,7(6)	load size of array gc
317:     ST  3,-34(0)	save size of array gc
* END INIT GLOBALS AND STATICS
318:    LDA  3,1(7)	Return address in ac 
319:    LDA  7,-167(7)	Jump to main 
320:   HALT  0,0,0	DONE! 
* END INIT
