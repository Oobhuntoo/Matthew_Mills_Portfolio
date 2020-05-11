* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  io.c-
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
* CALL output
 43:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
 44:    LDC  3,777(6)	Load integer constant 
 45:     ST  3,-6(1)	Store parameter 
* END PARAM output
 46:    LDA  1,-4(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outputb
 50:     ST  1,-4(1)	Store fp in ghost frame for outputb
* PARAM 1
 51:    LDC  3,0(6)	Load Boolean constant 
 52:     ST  3,-6(1)	Store parameter 
* END PARAM outputb
 53:    LDA  1,-4(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-38(7)	CALL outputb
 56:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
 57:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 58:    LDA  1,-4(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-24(7)	CALL outnl
 61:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
 62:    LDC  3,666(6)	Load integer constant 
 63:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 64:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
 65:     LD  3,-2(1)	Load variable x
 66:     ST  3,-6(1)	Store parameter 
* END PARAM output
 67:    LDA  1,-4(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-64(7)	CALL output
 70:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
 71:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 72:    LDA  1,-4(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-38(7)	CALL outnl
 75:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
 76:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
 77:     LD  3,-2(1)	Load variable x
 78:    LDC  4,0(6)	Load 0 
 79:    SUB  3,4,3	Op unary - 
 80:     ST  3,-6(1)	Store parameter 
* END PARAM output
 81:    LDA  1,-4(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-78(7)	CALL output
 84:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
 85:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
 86:    LDC  3,1(6)	Load integer constant 
 87:    LDC  4,0(6)	Load 0 
 88:    SUB  3,4,3	Op unary - 
 89:     ST  3,-6(1)	Save left side 
 90:     LD  3,-2(1)	Load variable x
 91:     LD  4,-6(1)	Load left into ac1 
 92:    MUL  3,4,3	Op * 
 93:     ST  3,-6(1)	Store parameter 
* END PARAM output
 94:    LDA  1,-4(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
 98:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 99:    LDA  1,-4(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-65(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
103:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
104:    LDC  3,111(6)	Load integer constant 
105:     ST  3,-6(1)	Save left side 
106:    LDC  3,222(6)	Load integer constant 
107:     LD  4,-6(1)	Load left into ac1 
108:    ADD  3,4,3	Op + 
109:     ST  3,-6(1)	Save left side 
110:    LDC  3,333(6)	Load integer constant 
111:     LD  4,-6(1)	Load left into ac1 
112:    ADD  3,4,3	Op + 
113:     ST  3,-6(1)	Store parameter 
* END PARAM output
114:    LDA  1,-4(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
118:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
119:    LDC  3,3(6)	Load integer constant 
120:     ST  3,-6(1)	Save left side 
121:    LDC  3,6(6)	Load integer constant 
122:     LD  4,-6(1)	Load left into ac1 
123:    MUL  3,4,3	Op * 
124:     ST  3,-6(1)	Save left side 
125:    LDC  3,6(6)	Load integer constant 
126:     ST  3,-7(1)	Save left side 
127:    LDC  3,6(6)	Load integer constant 
128:     LD  4,-7(1)	Load left into ac1 
129:    MUL  3,4,3	Op * 
130:     ST  3,-7(1)	Save left side 
131:    LDC  3,1(6)	Load integer constant 
132:     LD  4,-7(1)	Load left into ac1 
133:    ADD  3,4,3	Op + 
134:     LD  4,-6(1)	Load left into ac1 
135:    MUL  3,4,3	Op * 
136:     ST  3,-6(1)	Store parameter 
* END PARAM output
137:    LDA  1,-4(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-134(7)	CALL output
140:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
141:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
142:    LDA  1,-4(1)	Load address of new frame 
143:    LDA  3,1(7)	Return address in ac 
144:    LDA  7,-108(7)	CALL outnl
145:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL input
146:     ST  1,-5(1)	Store fp in ghost frame for input
* END PARAM input
147:    LDA  1,-5(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-149(7)	CALL input
150:    LDA  3,0(2)	Save the result in ac 
* END CALL input
151:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
152:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
153:     LD  3,-2(1)	Load variable x
154:     ST  3,-6(1)	Store parameter 
* END PARAM output
155:    LDA  1,-4(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-152(7)	CALL output
158:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
159:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
160:    LDA  1,-4(1)	Load address of new frame 
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-126(7)	CALL outnl
163:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL inputb
164:     ST  1,-5(1)	Store fp in ghost frame for inputb
* END PARAM inputb
165:    LDA  1,-5(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-155(7)	CALL inputb
168:    LDA  3,0(2)	Save the result in ac 
* END CALL inputb
169:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL outputb
170:     ST  1,-4(1)	Store fp in ghost frame for outputb
* PARAM 1
171:     LD  3,-3(1)	Load variable b
172:     ST  3,-6(1)	Store parameter 
* END PARAM outputb
173:    LDA  1,-4(1)	Load address of new frame 
174:    LDA  3,1(7)	Return address in ac 
175:    LDA  7,-158(7)	CALL outputb
176:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
177:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
178:    LDA  1,-4(1)	Load address of new frame 
179:    LDA  3,1(7)	Return address in ac 
180:    LDA  7,-144(7)	CALL outnl
181:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
182:     ST  1,-4(1)	Store fp in ghost frame for output
* PARAM 1
* CALL input
183:     ST  1,-6(1)	Store fp in ghost frame for input
* END PARAM input
184:    LDA  1,-6(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-186(7)	CALL input
187:    LDA  3,0(2)	Save the result in ac 
* END CALL input
188:     ST  3,-6(1)	Save left side 
* CALL input
189:     ST  1,-7(1)	Store fp in ghost frame for input
* END PARAM input
190:    LDA  1,-7(1)	Load address of new frame 
191:    LDA  3,1(7)	Return address in ac 
192:    LDA  7,-192(7)	CALL input
193:    LDA  3,0(2)	Save the result in ac 
* END CALL input
194:     LD  4,-6(1)	Load left into ac1 
195:    MUL  3,4,3	Op * 
196:     ST  3,-6(1)	Store parameter 
* END PARAM output
197:    LDA  1,-4(1)	Load address of new frame 
198:    LDA  3,1(7)	Return address in ac 
199:    LDA  7,-194(7)	CALL output
200:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
201:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
202:    LDA  1,-4(1)	Load address of new frame 
203:    LDA  3,1(7)	Return address in ac 
204:    LDA  7,-168(7)	CALL outnl
205:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
206:     ST  1,-4(1)	Store fp in ghost frame for outputb
* PARAM 1
* CALL inputb
207:     ST  1,-6(1)	Store fp in ghost frame for inputb
* END PARAM inputb
208:    LDA  1,-6(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-198(7)	CALL inputb
211:    LDA  3,0(2)	Save the result in ac 
* END CALL inputb
212:     ST  3,-6(1)	Save left side 
* CALL inputb
213:     ST  1,-7(1)	Store fp in ghost frame for inputb
* END PARAM inputb
214:    LDA  1,-7(1)	Load address of new frame 
215:    LDA  3,1(7)	Return address in ac 
216:    LDA  7,-204(7)	CALL inputb
217:    LDA  3,0(2)	Save the result in ac 
* END CALL inputb
218:     LD  4,-6(1)	Load left into ac1 
219:    AND  3,4,3	Op AND 
220:     ST  3,-6(1)	Store parameter 
* END PARAM outputb
221:    LDA  1,-4(1)	Load address of new frame 
222:    LDA  3,1(7)	Return address in ac 
223:    LDA  7,-206(7)	CALL outputb
224:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
225:     ST  1,-4(1)	Store fp in ghost frame for outnl
* END PARAM outnl
226:    LDA  1,-4(1)	Load address of new frame 
227:    LDA  3,1(7)	Return address in ac 
228:    LDA  7,-192(7)	CALL outnl
229:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
230:    LDC  2,0(6)	Set return value to 0 
231:     LD  3,-1(1)	Load return address 
232:     LD  1,0(1)	Adjust fp 
233:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,233(7)	Jump to init [backpatch] 
* INIT
234:     LD  0,0(0)	Set the global pointer 
235:    LDA  1,0(0)	set first frame at end of globals 
236:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
237:    LDA  3,1(7)	Return address in ac 
238:    LDA  7,-197(7)	Jump to main 
239:   HALT  0,0,0	DONE! 
* END INIT
