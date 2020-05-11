* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  u03.c-
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
 44:     ST  3,-2(1)	Store variable x
* WHILE
 45:     LD  3,-2(1)	Load variable x
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,8(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 52:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 53:     LD  3,-2(1)	Load variable x
 54:     ST  3,-5(1)	Store parameter 
* END PARAM output
 55:    LDA  1,-3(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* IF
 59:     LD  3,-2(1)	Load variable x
 60:     ST  3,-3(1)	Save left side 
 61:    LDC  3,1(6)	Load integer constant 
 62:     LD  4,-3(1)	Load left into ac1 
 63:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 65:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
 66:    LDC  3,65(6)	Load char constant 
 67:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
 68:    LDA  1,-3(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-41(7)	CALL outputc
 71:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
 64:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
 73:     LD  3,-2(1)	Load variable x
 74:     ST  3,-3(1)	Save left side 
 75:    LDC  3,2(6)	Load integer constant 
 76:     LD  4,-3(1)	Load left into ac1 
 77:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 79:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
 80:    LDC  3,66(6)	Load char constant 
 81:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
 82:    LDA  1,-3(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-55(7)	CALL outputc
 85:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
 78:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
 87:     LD  3,-2(1)	Load variable x
 88:     ST  3,-3(1)	Save left side 
 89:    LDC  3,3(6)	Load integer constant 
 90:     LD  4,-3(1)	Load left into ac1 
 91:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 93:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
 94:    LDC  3,67(6)	Load char constant 
 95:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
 96:    LDA  1,-3(1)	Load address of new frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    LDA  7,-69(7)	CALL outputc
 99:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
 92:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* ELSIF
101:     LD  3,-2(1)	Load variable x
102:     ST  3,-3(1)	Save left side 
103:    LDC  3,4(6)	Load integer constant 
104:     LD  4,-3(1)	Load left into ac1 
105:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
107:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
108:    LDC  3,68(6)	Load char constant 
109:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
110:    LDA  1,-3(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-83(7)	CALL outputc
113:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
106:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputc
115:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
116:    LDC  3,69(6)	Load char constant 
117:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
118:    LDA  1,-3(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-91(7)	CALL outputc
121:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
114:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* END ELSIF
100:    LDA  7,21(7)	Jump around the ELSE [backpatch] 
* END ELSIF
 86:    LDA  7,35(7)	Jump around the ELSE [backpatch] 
* END ELSIF
 72:    LDA  7,49(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
122:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
123:    LDA  1,-3(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-89(7)	CALL outnl
126:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
127:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
128:     LD  3,-2(1)	Load variable x
129:     ST  3,-5(1)	Store parameter 
* END PARAM output
130:    LDA  1,-3(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* IF
134:     LD  3,-2(1)	Load variable x
135:     ST  3,-3(1)	Save left side 
136:    LDC  3,1(6)	Load integer constant 
137:     LD  4,-3(1)	Load left into ac1 
138:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
140:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
141:    LDC  3,65(6)	Load char constant 
142:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
143:    LDA  1,-3(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-116(7)	CALL outputc
146:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
139:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
148:     LD  3,-2(1)	Load variable x
149:     ST  3,-3(1)	Save left side 
150:    LDC  3,2(6)	Load integer constant 
151:     LD  4,-3(1)	Load left into ac1 
152:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
154:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
155:    LDC  3,66(6)	Load char constant 
156:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
157:    LDA  1,-3(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-130(7)	CALL outputc
160:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
153:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
162:     LD  3,-2(1)	Load variable x
163:     ST  3,-3(1)	Save left side 
164:    LDC  3,3(6)	Load integer constant 
165:     LD  4,-3(1)	Load left into ac1 
166:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
168:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
169:    LDC  3,67(6)	Load char constant 
170:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
171:    LDA  1,-3(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-144(7)	CALL outputc
174:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
167:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
176:     LD  3,-2(1)	Load variable x
177:     ST  3,-3(1)	Save left side 
178:    LDC  3,4(6)	Load integer constant 
179:     LD  4,-3(1)	Load left into ac1 
180:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
182:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
183:    LDC  3,68(6)	Load char constant 
184:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
185:    LDA  1,-3(1)	Load address of new frame 
186:    LDA  3,1(7)	Return address in ac 
187:    LDA  7,-158(7)	CALL outputc
188:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
181:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputc
190:     ST  1,-3(1)	Store fp in ghost frame for outputc
* PARAM 1
191:    LDC  3,69(6)	Load char constant 
192:     ST  3,-5(1)	Store parameter 
* END PARAM outputc
193:    LDA  1,-3(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-166(7)	CALL outputc
196:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
189:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
175:    LDA  7,21(7)	Jump around the ELSE [backpatch] 
* END IF
161:    LDA  7,35(7)	Jump around the ELSE [backpatch] 
* END IF
147:    LDA  7,49(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
197:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
198:    LDA  1,-3(1)	Load address of new frame 
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-164(7)	CALL outnl
201:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
202:     LD  3,-2(1)	load lhs variable x
203:    LDA  3,1(3)	increment value of x
204:     ST  3,-2(1)	Store variable x
* END COMPOUND
205:    LDA  7,-161(7)	go to beginning of loop 
 51:    LDA  7,154(7)	Jump past loop [backpatch] 
* END WHILE
* END COMPOUND
* Add standard closing in case there is no return statement
206:    LDC  2,0(6)	Set return value to 0 
207:     LD  3,-1(1)	Load return address 
208:     LD  1,0(1)	Adjust fp 
209:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,209(7)	Jump to init [backpatch] 
* INIT
210:     LD  0,0(0)	Set the global pointer 
211:    LDA  1,0(0)	set first frame at end of globals 
212:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
213:    LDA  3,1(7)	Return address in ac 
214:    LDA  7,-173(7)	Jump to main 
215:   HALT  0,0,0	DONE! 
* END INIT
