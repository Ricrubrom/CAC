ORG 1000H
INI DB 0
FIN DB 15
ORG 2000H
MOV AL, INI
MOV AH, FIN
SUMA: INC AL
CMP AL, AH
JNZ SUMA
HLT
END


;a) Se ejecutara 15 veces, depende de las variables de INI y FIN
;b) JS:   AL=15
;   JZ:   AL=1
;   JMP:  AL=∞