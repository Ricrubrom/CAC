PIC     EQU     20H
HAND    EQU     40H
N_HND   EQU     10

        ORG     40
IP_HND  DW      RUT_HND

        ORG     1000H
MSJ     DB      "UNIVERSIDAD "
        DB      "NACIONAL DE LA PLATA"
FIN     DB      ?

        ORG     3000H
RUT_HND:PUSH    AX
        MOV     AL,     [BX]    ;GUARDO CARACTER
        OUT     HAND,   AL      ;ENVIO EL CARACTER A CAMPO DATA DE HAND
        INC     BX              ;VOY AL SIG CARACTER
        DEC     CL              ;DECREMENTO LONGITUD
        MOV     AL,     20H     
        OUT     PIC,    AL      ;EOI
        POP     AX
        IRET

        ORG     2000H
        MOV     BX,     OFFSET MSJ                  ;GUARDO DIREC MSG
        MOV     CL,     OFFSET FIN-OFFSET MSJ       ;LONG MSG
        CLI
        MOV     AL,     0FBH    ;1111 1011
        OUT     PIC+1,  AL      ;HABILITO HAND
        MOV     AL,     N_HND
        OUT     PIC+6,  AL      ;POSICION EN EL VECTOR DE INT
        MOV     AL,     80H     
        OUT     HAND+1, AL      ;GUADO EN ESTADO 1000 0000
        STI
LAZO:   CMP     CL,     0       ;LOOP DE IMPRESION
        JNZ     LAZO            
        IN      AL,     HAND+1  
        AND     AL,     7FH     ;AND 0111 1111
        OUT     HAND+1, AL      
        INT     0
        END