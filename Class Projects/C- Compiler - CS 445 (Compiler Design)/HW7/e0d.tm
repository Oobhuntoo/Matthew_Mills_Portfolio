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
*  FUNCTION main
 42:     ST  3,-1,1	Store return address 
* COMPOUND
* Compound body
 43:    LDC  3,0,6	Load integer constant 
 44:     ST  3,-2,1	Store parameter 
* WHILE
 45:     LD  3,-2,1	 Load variable x 
 46:     ST  3,-4,1	Store left hand side 
 47:     LD  4,-4,1	Load into ac1 
 48:    TLT  3,4,3	Op < 
 49:    LDC  3,6,6	Load integer constant 
 50:    JNZ  3,1,7	Jump to while part 
* COMPOUND
* Compound body
 51:    LDC  3,0,6	Load integer constant 
 52:     ST  3,-2,1	Store parameter 
* WHILE
 53:     LD  3,-3,1	 Load variable y 
 54:     ST  3,-5,1	Store left hand side 
 55:     LD  4,-5,1	Load into ac1 
 56:    TLT  3,4,3	Op < 
 57:    LDC  3,6,6	Load integer constant 
 58:    JNZ  3,1,7	Jump to while part 
* COMPOUND
* Compound body
*  CALL output
 59:     ST  1,-4,1	Store fp in ghost frame for output 
*  PARAM 1
 60:     LD  3,-3,1	 Load variable y 
 61:     ST  3,-6,1	Store parameter 
*  END PARAM output
 62:    LDA  1,-4,1	Load address of new frame 
 63:    LDA  3,1,7	Return address in ac 
 64:    LDA  7,-59(7)	 CALL output 
 65:    LDA  3,0,2	Save the result in ac 
*  END CALL output
* IF
 66:     LD  3,-3,1	 Load variable y 
 67:     ST  3,-5,1	Store left hand side 
 68:     LD  4,-5,1	Load into ac1 
 69:    TEQ  3,4,3	Op == 
 70:    LDC  3,4,6	Load integer constant 
* THEN
* BREAK
 71:    LDA  7,-1(7)	breaK 
  7:    JZR  3,64(7)	Jump around the THEN if false [backpatch] 
* END IF
 72:     ST  3,-2,1	Store parameter 
 73:     LD  3,-3,1	 Load variable y 
 74:     ST  3,-5,1	Store left hand side 
 75:     LD  4,-5,1	Load into ac1 
 76:    LDC  3,1,6	Load integer constant 
* END COMPOUND
* END WHILE
*  CALL output
 77:     ST  1,-4,1	Store fp in ghost frame for output 
*  PARAM 1
 78:     LD  3,-2,1	 Load variable x 
 79:     ST  3,-6,1	Store parameter 
*  END PARAM output
 80:    LDA  1,-4,1	Load address of new frame 
 81:    LDA  3,1,7	Return address in ac 
 82:    LDA  7,-77(7)	 CALL output 
 83:    LDA  3,0,2	Save the result in ac 
*  END CALL output
* IF
 84:     LD  3,-2,1	 Load variable x 
 85:     ST  3,-4,1	Store left hand side 
 86:     LD  4,-4,1	Load into ac1 
 87:    TEQ  3,4,3	Op == 
 88:    LDC  3,4,6	Load integer constant 
* THEN
* BREAK
 89:    LDA  7,-1(7)	breaK 
  7:    JZR  3,82(7)	Jump around the THEN if false [backpatch] 
* END IF
 90:     ST  3,-2,1	Store parameter 
 91:     LD  3,-2,1	 Load variable x 
 92:     ST  3,-4,1	Store left hand side 
 93:     LD  4,-4,1	Load into ac1 
 94:    LDC  3,1,6	Load integer constant 
* END COMPOUND
* END WHILE
* END COMPOUND
 95:    LDC  2,0,6	Set return value to 0 
 96:     LD  3,-1,1	Load return address 
 97:     LD  1,0,1	Adjust fp 
 98:    LDA  7,0,3	Return 
*  END FUNCTION main
* 
  0:    LDA  7,98(7)	Jump to init [backpatch] 
* INIT
 99:     LD  0,0,0	Set the global pointer 
100:    LDA  1,0,0	set first frame at end of globals 
101:     ST  1,0,1	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
102:    LDA  3,1,7	Return address in ac 
103:    LDA  7,-62(7)	Jump to main 
104:   HALT  0,0,0	DONE! 
* END INIT
