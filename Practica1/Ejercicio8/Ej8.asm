ORG 1000H
NUM DB 01000001B
POS DB 2

ORG 3000H
ROTARIZ: NOP
FOR: CMP CH, 0
JZ FIN
ADD CL, CL
JNC SIG
INC CL
SIG: DEC CH
JMP FOR
FIN: RET

ORG 2000H
MOV CL, NUM
MOV CH, POS
CALL ROTARIZ
MOV NUM, CL
HLT
END