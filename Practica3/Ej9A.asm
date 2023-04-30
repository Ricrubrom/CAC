HAND    EQU     40H
CANT    EQU     5
        ORG     1000H
CHAR    DB      ?
        DB      ?
        DB      ?
        DB      ?
        DB      ?

        ORG     2000H
        IN      AL,     HAND+1
        AND     AL,     07FH
        OUT     HAND+1, AL
        MOV     BX,     OFFSET CHAR
        MOV     CL,     0
READ:   INT     6
        INC     CL
        CMP     CL,     CANT
        JNZ     READ
POLL1:  IN      AL,     HAND+1
        AND     AL,     1
        JNZ     POLL1
        MOV     AL,     [BX]
        OUT     HAND,   AL
        INC     BX
        DEC     CL
        JNZ     POLL1
POLL2:  IN      AL,     HAND+1
        AND     AL,     1
        JNZ     POLL2
        MOV     AL,     [BX]
        OUT     HAND,   AL
        DEC     BX
        INC     CL
        CMP     CL,     CANT
        JNZ     POLL2
        HLT
        END