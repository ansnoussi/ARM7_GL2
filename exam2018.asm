AREA
EXAM2018
CODE
READONLY
ENRTY
		MOV		R0,#0
		ADR		R1,Tab1
		ADR		R2,Tab2
		MOV		R3,#0
Boucle	CMP		R0,#4
		BEQ		Done
		LDRB		R4,[R1,R0]
		CMP		R3,R4
		BGE		Max2
		MOV		R3,R4
Max2		LDRB		R4,[R2,R0]
		CMP		R3,R4
		BGE		FinInst
		MOV		R3,R4
FinInst	ADD		R0,R0,#1
		B		Boucle
Done
Align
Tab1		DCB		0x25,0x11,0x22,0x13
Tab2		DCB		0x11,0x13,0x15,0x17
		END
