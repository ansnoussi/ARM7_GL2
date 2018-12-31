				;Enoncé:
				;Ecrire un programme assembleur qui permet de calculer le nombre
				;d'occurences de chaque élément du tableau de taille 10 éléments
				;et de stocker le résultat  dans un nouveau tableau qui contient
				;l'élément et son occurence
				
AREA
Occurences
CODE
READONLY
ENTRY
				MOV		R0, #0 ;compteur
				MOV		R1, #0 ;compteur
				ADR		R2, TAB ;le tableau donné
				MOV		R8, #0 ;compteur d'éléments distincts enregistrés
MAIN				CMP		R1, #10
				BEQ		STOP
				MOV		R0, #0
				LDRB		R3, [R2,R1] ;l'élément q'on doit compter les occurences
VERIF			CMP		R0, R8 ;boucle de vérification que l'élément n'a pas été compté
				BEQ		BEGIN_ITERATION ;si on trouve qu'on le l'a pas compté
				LDRB		R4, [R7,R0]
				CMP		R3, R4
				BEQ		NEXT_ITERATION ;si on a déjà compté cet élément
				ADD		R0, R0, #1
				B		VERIF
BEGIN_ITERATION	MOV		R0, R1 ;on commance à l'indice de l'élément
				MOV		R5, #0
OCC				CMP		R0, #10 ;boucle qui compte le nombres d'occurences
				BEQ		FIN_COMPTAGE
				LDRB		R4, [R2,R0]
				CMP		R3, R4
				BNE		NOT_EGALE
				ADD		R5, R5, #1
NOT_EGALE			ADD		R0, R0, #1
				B		OCC
FIN_COMPTAGE		STRB		R3, [R7,R8] ;on sauvegarde l'élément dans R7
				STRB		R5, [R6,R8] ;on sauvegarde ses occurences dans R6
				ADD		R8, R8, #1
NEXT_ITERATION		ADD		R1, R1, #1
				B		MAIN
STOP
ALIGN
TAB				DCB		0x2,0x2,0x4,0x4,0x2,0x5,0x2,0x5,0x2,0x4
				END


;---------------+-----------------------------------------------------------------+
;   REGISTRE    |      Usage											  |
;---------------+-----------------------------------------------------------------+
;    R0,R1      |	Compteurs											  | 
;---------------+-----------------------------------------------------------------+
;      R2       |	le Tableau à traiter								  |	
;---------------+-----------------------------------------------------------------+
;      R3       |	l'élément à compter									  |
;---------------+-----------------------------------------------------------------+
;      R4       |	utilisé pour sauvegarder un élément itérés				  |
;---------------+-----------------------------------------------------------------+
;      R5       |	utilisé pour calculer le nombre d'occurences d'un élément     |
;---------------+-----------------------------------------------------------------+
; R6 (tableau)  |	utilisé pour stocker le nombre d'occurences 				  | 
;---------------+-----------------------------------------------------------------+
; R7 (tableau)  |	utilisé pour stocker les éléments 						  |
;---------------+-----------------------------------------------------------------+
;      R8       |	utilisé pour savoir combien d'éléments sont dans R6 et R7 	  |
;---------------+-----------------------------------------------------------------+