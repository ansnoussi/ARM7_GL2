AREA
EXAM2017CONT
CODE
READONLY
ENTRY
			MOV		R0,#0
			ADR		R1,Tab
			MOV		R10,#0x1000
Boucle		CMP		R0,#4
			BEQ		DoneAll
			LDRB		R3,[R1,R0]
			MOV		R4,#0
			Mov		R2,#0
Boucle2		CMP		R4,#10
			BEQ		DoneCase
			LDRB		R5,[R1,R4]
			CMP		R5,R3
			BNE		FININST
			ADD		R2,R2,#1
FININST		ADD		R4,R4,#1
			B		Boucle2
DoneCase
			STRB		R2,[R10,R0]
			ADD		R0,R0,#1
			B		Boucle
DoneAll
Align
Tab			DCB		2,2,4,4,2,5,2,5,2,4
			END
