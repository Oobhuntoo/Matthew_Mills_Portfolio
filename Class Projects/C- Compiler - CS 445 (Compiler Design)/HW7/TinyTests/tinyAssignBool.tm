* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  tinyAssignBool.c-
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
 45:    LDC  3,1(6)	Load Boolean constant 
 46:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL outputb
 47:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
 48:     LD  3,0(0)	Load variable gx
 49:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
 50:    LDA  1,-16(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-35(7)	CALL outputb
 53:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
 54:    LDC  3,9(6)	Load integer constant 
 55:     ST  3,-16(1)	Save index 
 56:    LDC  3,1(6)	Load Boolean constant 
 57:     LD  4,-16(1)	Restore index 
 58:    LDA  5,-2(0)	Load address of base of array gy
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL outputb
 61:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
 62:    LDA  3,-2(0)	Load address of base of array gy
 63:     ST  3,-18(1)	Save left side 
 64:    LDC  3,9(6)	Load integer constant 
 65:     LD  4,-18(1)	Load left into ac1 
 66:    SUB  3,4,3	compute location from index 
 67:     LD  3,0(3)	Load array element 
 68:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
 69:    LDA  1,-16(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-54(7)	CALL outputb
 72:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
 73:    LDC  3,1(6)	Load Boolean constant 
 74:     ST  3,-4(1)	Store variable x
* EXPRESSION
* CALL outputb
 75:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
 76:     LD  3,-4(1)	Load variable x
 77:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
 78:    LDA  1,-16(1)	Load address of new frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    LDA  7,-63(7)	CALL outputb
 81:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
 82:    LDC  3,9(6)	Load integer constant 
 83:     ST  3,-16(1)	Save index 
 84:    LDC  3,1(6)	Load Boolean constant 
 85:     LD  4,-16(1)	Restore index 
 86:    LDA  5,-6(1)	Load address of base of array y
 87:    SUB  5,5,4	Compute offset of value 
 88:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL outputb
 89:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
 90:    LDA  3,-6(1)	Load address of base of array y
 91:     ST  3,-18(1)	Save left side 
 92:    LDC  3,9(6)	Load integer constant 
 93:     LD  4,-18(1)	Load left into ac1 
 94:    SUB  3,4,3	compute location from index 
 95:     LD  3,0(3)	Load array element 
 96:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
 97:    LDA  1,-16(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-82(7)	CALL outputb
100:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
101:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
102:    LDA  1,-16(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-68(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* EXPRESSION
106:    LDC  3,1(6)	Load Boolean constant 
107:     ST  3,-2(1)	Store variable px
* EXPRESSION
* CALL outputb
108:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
109:     LD  3,-2(1)	Load variable px
110:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
111:    LDA  1,-16(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-96(7)	CALL outputb
114:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
115:    LDC  3,9(6)	Load integer constant 
116:     ST  3,-16(1)	Save index 
117:    LDC  3,1(6)	Load Boolean constant 
118:     LD  4,-16(1)	Restore index 
119:     LD  5,-3(1)	Load address of base of array py
120:    SUB  5,5,4	Compute offset of value 
121:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL outputb
122:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
123:     LD  3,-3(1)	Load address of base of array py
124:     ST  3,-18(1)	Save left side 
125:    LDC  3,9(6)	Load integer constant 
126:     LD  4,-18(1)	Load left into ac1 
127:    SUB  3,4,3	compute location from index 
128:     LD  3,0(3)	Load array element 
129:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
130:    LDA  1,-16(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-115(7)	CALL outputb
133:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
134:    LDC  3,1(6)	Load Boolean constant 
135:     ST  3,-12(0)	Store variable sx
* EXPRESSION
* CALL outputb
136:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
137:     LD  3,-12(0)	Load variable sx
138:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
139:    LDA  1,-16(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-124(7)	CALL outputb
142:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
143:    LDC  3,9(6)	Load integer constant 
144:     ST  3,-16(1)	Save index 
145:    LDC  3,1(6)	Load Boolean constant 
146:     LD  4,-16(1)	Restore index 
147:    LDA  5,-14(0)	Load address of base of array sy
148:    SUB  5,5,4	Compute offset of value 
149:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL outputb
150:     ST  1,-16(1)	Store fp in ghost frame for outputb
* PARAM 1
151:    LDA  3,-14(0)	Load address of base of array sy
152:     ST  3,-18(1)	Save left side 
153:    LDC  3,9(6)	Load integer constant 
154:     LD  4,-18(1)	Load left into ac1 
155:    SUB  3,4,3	compute location from index 
156:     LD  3,0(3)	Load array element 
157:     ST  3,-18(1)	Store parameter 
* END PARAM outputb
158:    LDA  1,-16(1)	Load address of new frame 
159:    LDA  3,1(7)	Return address in ac 
160:    LDA  7,-143(7)	CALL outputb
161:    LDA  3,0(2)	Save the result in ac 
* END CALL outputb
* EXPRESSION
* CALL outnl
162:     ST  1,-16(1)	Store fp in ghost frame for outnl
* END PARAM outnl
163:    LDA  1,-16(1)	Load address of new frame 
164:    LDA  3,1(7)	Return address in ac 
165:    LDA  7,-129(7)	CALL outnl
166:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* END COMPOUND
* Add standard closing in case there is no return statement
167:    LDC  2,0(6)	Set return value to 0 
168:     LD  3,-1(1)	Load return address 
169:     LD  1,0(1)	Adjust fp 
170:    LDA  7,0(3)	Return 
* END FUNCTION esperanza
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
171:     ST  3,-1(1)	Store return address 
* COMPOUND
172:    LDC  3,10(6)	load size of array zy
173:     ST  3,-3(1)	save size of array zy
* Compound Body
* EXPRESSION
* CALL esperanza
174:     ST  1,-14(1)	Store fp in ghost frame for esperanza
* PARAM 1
175:     LD  3,-2(1)	Load variable zx
176:     ST  3,-16(1)	Store parameter 
* PARAM 2
177:    LDA  3,-4(1)	Load address of base of array zy
178:     ST  3,-17(1)	Store parameter 
* END PARAM esperanza
179:    LDA  1,-14(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-140(7)	CALL esperanza
182:    LDA  3,0(2)	Save the result in ac 
* END CALL esperanza
* END COMPOUND
* Add standard closing in case there is no return statement
183:    LDC  2,0(6)	Set return value to 0 
184:     LD  3,-1(1)	Load return address 
185:     LD  1,0(1)	Adjust fp 
186:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,186(7)	Jump to init [backpatch] 
* INIT
187:     LD  0,0(0)	Set the global pointer 
188:    LDA  1,-24(0)	set first frame at end of globals 
189:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
190:    LDC  3,10(6)	load size of array gy
191:     ST  3,-1(0)	save size of array gy
192:    LDC  3,10(6)	load size of array sy
193:     ST  3,-13(0)	save size of array sy
* END INIT GLOBALS AND STATICS
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-25(7)	Jump to main 
196:   HALT  0,0,0	DONE! 
* END INIT
