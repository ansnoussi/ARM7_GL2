AREA
TEST
CODE
READONLY
ENTRY
		ADR		R0, TAB
		MOV		R1 , #0
		LDRB		R3, [R0, R1]
ALIGN
TAB		DCB		0x2, 0x2, 0x3, 0x6
		END
