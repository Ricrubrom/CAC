PIC     EQU     20H
PIO     EQU     30H
N_F10   EQU     10

        ORG     40
IP_F10  DW      RUT_F10

        ORG     1000H
LETRA   DB      ?

        ORG     3000H
RUT_F10:PUSH    AX
        MOV     CL,     1
        MOV     AL,     0FFH
        OUT     PIC+1,  AL      ;INTERUPCION F10 CERRADA
        MOV     AL,     PIC
        OUT     PIC,    AL      ;EOI
        POP     AX
        IRET

        ORG     2000H
        MOV     AL,     0FDH    ;1111 1101
        OUT     PIO+2,  AL      ;A=ENTRADA - STROBE SALIDA
        MOV     AL,     0       ;0000 0000
        OUT     PIO+3,  AL      ;B=SALIDA
        IN      AL,     PIO
        AND     AL,     0FDH    ;1111 1101
        OUT     PIO,    AL      ;FUERZO STROBE=0
        CLI
        MOV     AL,     0FEH    ;1111 1110
        OUT     PIC+1,  AL      ;HABILITO F10
        MOV     AL,     N_F10
        OUT     PIC+4,  AL      ;CARGO RUTINA
        STI
        MOV     BX,     OFFSET LETRA   ;DIRECCION EN MEMORIA A ESCRIBIR
        MOV     CL,     0       ;FLAG ACTIVACION
        MOV     DL,     0       ;CANT DE PALABRAS
LOOP:   CMP     CL,     0
        JNZ     SIGO
        INT     6               ;LECTURA DE DATOS
        INC     BX              ;ME MUEVO EN MEMORIA A SIGUIENTE CARACTER
        INC     DL              ;INCREMENTO CANTIDAD
        JMP     LOOP
SIGO:   DEC     DL              ;DECREMENTO POR LA PRIMER
        MOV     BX,     OFFSET LETRA    ;DIRECCION DEL PRIMER CARACTER
POLL:   IN      AL,     PIO             
        AND     AL,     1       ;PREGUNTO SI ESTA O NO BUSY
        JNZ     POLL
        MOV     AL,     [BX]    ;MUEVO EL CARACTER A AL
        OUT     PIO+1,  AL      ;MUEVO CARACTER A PB (SALIDA)
        IN      AL,     PIO
        OR      AL,     02H     ;FUERZO STROBE A 1     
        OUT     PIO,    AL
        IN      AL,     PIO
        AND     AL,     0FDH    ;FUERZO STROBE A 0
        OUT     PIO,    AL
        INC     BX              ;VOY A SIG CARACTER
        DEC     DL              ;DECREMENTO CANTIDAD
        JNZ     POLL
        HLT
        END