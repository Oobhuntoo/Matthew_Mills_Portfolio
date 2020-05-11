* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION input
  1:     ST  3,-1,1	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1,1	Load return address 
  4:     LD  1,0,1	Adjust fp 
  5:    LDA  7,0,3	Return 
*  END FUNCTION input
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION output
  6:     ST  3,-1,1	Store return address 
  7:     LD  3,-2,1	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:    LDC  2,0,6	Set return to 0 
 10:     LD  3,-1,1	Load return address 
 11:     LD  1,0,1	Adjust fp 
 12:    LDA  7,0,3	Return 
*  END FUNCTION output
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION inputb
 13:     ST  3,-1,1	Store return address 
 14:    INB  2,2,2	Grab bool input 
 15:     LD  3,-1,1	Load return address 
 16:     LD  1,0,1	Adjust fp 
 17:    LDA  7,0,3	Return 
*  END FUNCTION inputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION outputb
 18:     ST  3,-1,1	Store return address 
 19:     LD  3,-2,1	Load parameter 
 20:   OUTB  3,3,3	Output bool 
 21:    LDC  2,0,6	Set return to 0 
 22:     LD  3,-1,1	Load return address 
 23:     LD  1,0,1	Adjust fp 
 24:    LDA  7,0,3	Return 
*  END FUNCTION outputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION inputc
 25:     ST  3,-1,1	Store return address 
 26:    INC  2,2,2	Grab char input 
 27:     LD  3,-1,1	Load return address 
 28:     LD  1,0,1	Adjust fp 
 29:    LDA  7,0,3	Return 
*  END FUNCTION inputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION outputc
 30:     ST  3,-1,1	Store return address 
 31:     LD  3,-2,1	Load parameter 
 32:   OUTC  3,3,3	Output char 
 33:    LDC  2,0,6	Set return to 0 
 34:     LD  3,-1,1	Load return address 
 35:     LD  1,0,1	Adjust fp 
 36:    LDA  7,0,3	Return 
*  END FUNCTION outputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION outnl
 37:     ST  3,-1,1	Store return address 
 38:  OUTNL  3,3,3	Output a newline 
 39:     LD  3,-1,1	Load return address 
 40:     LD  1,0,1	Adjust fp 
 41:    LDA  7,0,3	Return 
*  END FUNCTION outnl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION fib
 42:     ST  3,-1,1	Store return address 
* COMPOUND
* Compound body
* IF
 43:     LD  3,-2,1	 Load variable n 
 44:     ST  3,-4,1	Store left hand side 
 45:     LD  4,-4,1	Load into ac1 
 46:    TLT  3,4,3	Op < 
 47:    LDC  3,3,6	Load integer constant 
* THEN
*  RETURN
 48:     LD  3,-1,1	Load return address 
 49:     LD  1,0,1	Adjust fp 
 50:    LDA  7,0,3	Return 
 51:    LDC  3,1,6	Load integer constant 
*  RETURN
 52:     LD  3,-1,1	Load return address 
 53:     LD  1,0,1	Adjust fp 
 54:    LDA  7,0,3	Return 
*  CALL fib
 55:     ST  1,-3,1	Store fp in ghost frame for output 
*  PARAM 1
 56:     LD  3,0,0	 Load variable - 
 57:     ST  3,-5,1	Store parameter 
*  END PARAM fib
 58:    LDA  1,-3,1	Load address of new frame 
 59:    LDA  3,1,7	Return address in ac 
 60:    LDA  7,-19(7)	 CALL fib 
 61:    LDA  3,0,2	Save the result in ac 
*  END CALL fib
 62:     LD  3,-2,1	 Load variable n 
 63:     ST  3,-4,1	Store left hand side 
 64:     LD  4,-4,1	Load into ac1 
 65:    LDC  3,1,6	Load integer constant 
*  CALL fib
 66:     ST  1,-3,1	Store fp in ghost frame for output 
*  PARAM 1
 67:     LD  3,0,0	 Load variable - 
 68:     ST  3,-5,1	Store parameter 
*  END PARAM fib
 69:    LDA  1,-3,1	Load address of new frame 
 70:    LDA  3,1,7	Return address in ac 
 71:    LDA  7,-30(7)	 CALL fib 
 72:    LDA  3,0,2	Save the result in ac 
*  END CALL fib
 73:     LD  3,-2,1	 Load variable n 
 74:     ST  3,-4,1	Store left hand side 
 75:     LD  4,-4,1	Load into ac1 
 76:    LDC  3,2,6	Load integer constant 
* END IF
* END COMPOUND
 77:    LDC  2,0,6	Set return value to 0 
 78:     LD  3,-1,1	Load return address 
 79:     LD  1,0,1	Adjust fp 
 80:    LDA  7,0,3	Return 
*  END FUNCTION fib
* 
* ** ** ** ** ** ** ** ** ** ** ** **
*  FUNCTION main
 81:     ST  3,-1,1	Store return address 
* COMPOUND
* Compound body
 82:     ST  3,-2,1	Store parameter 
*  CALL fib
 83:     ST  1,-3,1	Store fp in ghost frame for output 
*  PARAM 1
 84:    LDC  3,12,6	Load integer constant 
 85:     ST  3,-5,1	Store parameter 
*  END PARAM fib
 86:    LDA  1,-3,1	Load address of new frame 
 87:    LDA  3,1,7	Return address in ac 
 88:    LDA  7,-47(7)	 CALL fib 
 89:    LDA  3,0,2	Save the result in ac 
*  END CALL fib
*  CALL output
 90:     ST  1,-3,1	Store fp in ghost frame for output 
*  PARAM 1
 91:     LD  3,-2,1	 Load variable n 
 92:     ST  3,-5,1	Store parameter 
*  END PARAM output
 93:    LDA  1,-3,1	Load address of new frame 
 94:    LDA  3,1,7	Return address in ac 
 95:    LDA  7,-90(7)	 CALL output 
 96:    LDA  3,0,2	Save the result in ac 
*  END CALL output
*  CALL outnl
 97:     ST  1,-3,1	Store fp in ghost frame for output 
*  END PARAM outnl
 98:    LDA  1,-3,1	Load address of new frame 
 99:    LDA  3,1,7	Return address in ac 
100:    LDA  7,-64(7)	 CALL outnl 
101:    LDA  3,0,2	Save the result in ac 
*  END CALL outnl
* END COMPOUND
102:    LDC  2,0,6	Set return value to 0 
103:     LD  3,-1,1	Load return address 
104:     LD  1,0,1	Adjust fp 
105:    LDA  7,0,3	Return 
*  END FUNCTION main
* 
  0:    LDA  7,105(7)	Jump to init [backpatch] 
* INIT
106:     LD  0,0,0	Set the global pointer 
107:    LDA  1,0,0	set first frame at end of globals 
108:     ST  1,0,1	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
109:    LDA  3,1,7	Return address in ac 
110:    LDA  7,-30(7)	Jump to main 
111:   HALT  0,0,0	DONE! 
* END INIT
