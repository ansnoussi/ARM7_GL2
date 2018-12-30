AREA
PROG2 ; Calcul de la somme d’un tableau de 4 cases
CODE
READONLY
ENTRY
		ADR		R0, TAB ; r0 = adresse du tableau
		MOV		R1 , #0 ; initialisation du compteur i
		MOV		R2 , #0 ; initialisation de la somme S
Tanque	CMP		R1 , #4
		BGE		Fin ; Si r1 inférieur ou égal à 4 allez à Fintantque
		LDRB		R3, [R0, R1]
		ADD		R2, R2, R3 ; S = S + TAB[i]
		ADD		R1, R1, #1 ; i = i + 1
		B		Tanque
Fin
ALIGN
TAB		DCB		0x1, 0x2, 0x3, 0x4
		END
