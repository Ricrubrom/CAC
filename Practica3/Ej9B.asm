PIC     EQU     20H
HAND    EQU     40H
N_HND   EQU     10
CANT    EQU     5

        ORG 40
IP_HND  DW      RUT_HND

        ORG 1000H
CHAR    DB      ?
        DB      ?
        DB      ?
        DB      ?
        DB      ?

        ORG     3000H
RUT_HND:PUSH    AX
        MOV     AL,     [BX]    ;GUARDO CARACTER
        OUT     HAND,   AL      ;ENVIO EL CARACTER A CAMPO DATA DE HAND
        CMP     CH,     0
        JNZ     DOS
UNO:    INC     BX              ;VOY AL SIG CARACTER
        DEC     CL              ;DECREMENTO LONGITUD
        JNZ     FIN
        INC     CH
        DEC     BX
        JMP     FIN
DOS:    DEC     BX              ;VOY AL SIG CARACTER
        INC     CL              ;DECREMENTO LONGITUD
        CMP     CL,     CANT
        JNZ     FIN
        INT     0
FIN:    MOV     AL,     20H     
        OUT     PIC,    AL      ;EOI
        POP     AX
        IRET

ORG 2000H
        MOV     BX,     OFFSET CHAR
        MOV     CL,     0
        MOV     CH,     0
READ:   INT     6
        INC     BX
        INC     CL
        CMP     CL,     CANT
        JNZ     READ
        MOV     BX,     OFFSET CHAR
        CLI
        MOV     AL,     0FBH
        OUT     PIC+1,  AL
        MOV     AL,     N_HND
        OUT     PIC+6,  AL
        MOV     AL,     80H
        OUT     HAND+1, AL
        STI
LAZO1:  CMP     CL,     0
        JNZ     LAZO1
LAZO2:  CMP     CL,     CANT
        JNZ     LAZO2
        HLT
        END