* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyReturn.c-
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
* FUNCTION bender
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* END COMPOUND
* Add standard closing in case there is no return statement
 43:    LDC  2,0(6)	Set return value to 0 
 44:     LD  3,-1(1)	Load return address 
 45:     LD  1,0(1)	Adjust fp 
 46:    LDA  7,0(3)	Return 
* END FUNCTION bender
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fry
 47:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* RETURN
 48:    LDC  3,114(6)	Load integer constant 
 49:    LDA  2,0(3)	Copy result to rt register 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 53:    LDC  2,0(6)	Set return value to 0 
 54:     LD  3,-1(1)	Load return address 
 55:     LD  1,0(1)	Adjust fp 
 56:    LDA  7,0(3)	Return 
* END FUNCTION fry
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION leela
 57:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL outputc
 58:     ST  1,-2(1)	Store fp in ghost frame for outputc
* PARAM 1
 59:    LDC  3,76(6)	Load char constant 
 60:     ST  3,-4(1)	Store parameter 
* END PARAM outputc
 61:    LDA  1,-2(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-34(7)	CALL outputc
 64:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* END COMPOUND
* Add standard closing in case there is no return statement
 65:    LDC  2,0(6)	Set return value to 0 
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    LDA  7,0(3)	Return 
* END FUNCTION leela
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION zoidberg
 69:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* RETURN
 70:    LDC  3,122(6)	Load char constant 
 71:    LDA  2,0(3)	Copy result to rt register 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 75:    LDC  2,0(6)	Set return value to 0 
 76:     LD  3,-1(1)	Load return address 
 77:     LD  1,0(1)	Adjust fp 
 78:    LDA  7,0(3)	Return 
* END FUNCTION zoidberg
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION zapp
 79:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
* END FUNCTION zapp
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION amy
 84:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* RETURN
 85:    LDC  3,1(6)	Load Boolean constant 
 86:    LDA  2,0(3)	Copy result to rt register 
 87:     LD  3,-1(1)	Load return address 
 88:     LD  1,0(1)	Adjust fp 
 89:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END FUNCTION amy
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION hermes
 94:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* END COMPOUND
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6)	Set return value to 0 
 96:     LD  3,-1(1)	Load return address 
 97:     LD  1,0(1)	Adjust fp 
 98:    LDA  7,0(3)	Return 
* END FUNCTION hermes
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 99:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL leela
100:     ST  1,-2(1)	Store fp in ghost frame for leela
* END PARAM leela
101:    LDA  1,-2(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-47(7)	CALL leela
104:    LDA  3,0(2)	Save the result in ac 
* END CALL leela
* EXPRESSION
* CALL outnl
105:     ST  1,-2(1)	Store fp in ghost frame for outnl
* END PARAM outnl
106:    LDA  1,-2(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-72(7)	CALL outnl
109:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL output
110:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
* CALL bender
111:     ST  1,-4(1)	Store fp in ghost frame for bender
* END PARAM bender
112:    LDA  1,-4(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-73(7)	CALL bender
115:    LDA  3,0(2)	Save the result in ac 
* END CALL bender
116:     ST  3,-4(1)	Store parameter 
* END PARAM output
117:    LDA  1,-2(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL output
121:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
* CALL fry
122:     ST  1,-4(1)	Store fp in ghost frame for fry
* END PARAM fry
123:    LDA  1,-4(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-79(7)	CALL fry
126:    LDA  3,0(2)	Save the result in ac 
* END CALL fry
127:     ST  3,-4(1)	Store parameter 
* END PARAM output
128:    LDA  1,-2(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-125(7)	CALL output
131:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
132:     ST  1,-2(1)	Store fp in ghost frame for outnl
* END PARAM outnl
133:    LDA  1,-2(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-99(7)	CALL outnl
136:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputc
137:     ST  1,-2(1)	Store fp in ghost frame for outputc
* PARAM 1
* CALL zoidberg
138:     ST  1,-4(1)	Store fp in ghost frame for zoidberg
* END PARAM zoidberg
139:    LDA  1,-4(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-73(7)	CALL zoidberg
142:    LDA  3,0(2)	Save the result in ac 
* END CALL zoidberg
143:     ST  3,-4(1)	Store parameter 
* END PARAM outputc
144:    LDA  1,-2(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-117(7)	CALL outputc
147:    LDA  3,0(2)	Save the result in ac 
* END CALL outputc
* EXPRESSION
* CALL outputb
148:     ST  1,-2(1)	Store fp in ghost frame for outputb
* PARAM 1
* CALL zapp
149:     ST  1,-4(1)	Store fp in ghost frame for zapp
* END PARAM zapp
150:    LDA  1,-4(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-74(7)	CALL zapp
153:    LDA  3,0(2)	Save the result in ac 
* END CALL zapp
154:     ST  3,-4(1)	Save left side 
155:    LDC  3,0(6)	Load char constant 
156:     LD  4,-4(1)	Load left into ac1 
157:    TEQ  3,4,3	Op == 
158:     ST  3,-4(1)	Store parameter 
* END PARAM outputb
159:    LDA  1,-2(1)	Load address of new frame 
160:    LDA  3,1(7)	Return address in ac 
161:    LDA  7,-144(7)	CALL outputb
162:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
163:     ST  1,-2(1)	Store fp in ghost frame for outnl
* END PARAM outnl
164:    LDA  1,-2(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-130(7)	CALL outnl
167:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
* CALL outputb
168:     ST  1,-2(1)	Store fp in ghost frame for outputb
* PARAM 1
* CALL amy
169:     ST  1,-4(1)	Store fp in ghost frame for amy
* END PARAM amy
170:    LDA  1,-4(1)	Load address of new frame 
171:    LDA  3,1(7)	Return address in ac 
172:    LDA  7,-89(7)	CALL amy
173:    LDA  3,0(2)	Save the result in ac 
* END CALL amy
174:     ST  3,-4(1)	Store parameter 
* END PARAM outputb
175:    LDA  1,-2(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-160(7)	CALL outputb
178:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outputb
179:     ST  1,-2(1)	Store fp in ghost frame for outputb
* PARAM 1
* CALL hermes
180:     ST  1,-4(1)	Store fp in ghost frame for hermes
* END PARAM hermes
181:    LDA  1,-4(1)	Load address of new frame 
182:    LDA  3,1(7)	Return address in ac 
183:    LDA  7,-90(7)	CALL hermes
184:    LDA  3,0(2)	Save the result in ac 
* END CALL hermes
185:     ST  3,-4(1)	Store parameter 
* END PARAM outputb
186:    LDA  1,-2(1)	Load address of new frame 
187:    LDA  3,1(7)	Return address in ac 
188:    LDA  7,-171(7)	CALL outputb
189:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
190:     ST  1,-2(1)	Store fp in ghost frame for outnl
* END PARAM outnl
191:    LDA  1,-2(1)	Load address of new frame 
192:    LDA  3,1(7)	Return address in ac 
193:    LDA  7,-157(7)	CALL outnl
194:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
195:    LDC  2,0(6)	Set return value to 0 
196:     LD  3,-1(1)	Load return address 
197:     LD  1,0(1)	Adjust fp 
198:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,198(7)	Jump to init [backpatch] 
* INIT
199:     LD  0,0(0)	Set the global pointer 
200:    LDA  1,0(0)	set first frame at end of globals 
201:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
202:    LDA  3,1(7)	Return address in ac 
203:    LDA  7,-105(7)	Jump to main 
204:   HALT  0,0,0	DONE! 
* END INIT
