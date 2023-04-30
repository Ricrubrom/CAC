HAND    EQU     40H

        ORG     1000H

MSJ     DB      "INGENIERIA E "
        DB      "INFORMATICA"
FIN     DB      ?
        ORG     2000H
        IN      AL,     HAND+1          ;MUEVO ESTADO->AL
        AND     AL,     7FH             ;0111 1111, FUERZO 7º BIT A 0
        OUT     HAND+1, AL 
        MOV     BX,     OFFSET MSJ      ;GUARDO DIRECCION DE MENSAJE
        MOV     CL,     OFFSET FIN-OFFSET MSJ   ;LONGITUD MENSAJE
POLL:   IN      AL,     HAND+1          ;MUEVO ESTADO->AL
        AND     AL,     1               ;0000 0001
        JNZ     POLL                    ;SI EL BIT 0 NO ES 0 POLLEO
        MOV     AL,     [BX]            ;MUEVO CARACTER A AL
        OUT     HAND,   AL              ;MUEVO EL CARACTER A CAMPO DATA
        INC     BX                      ;VOY AL SIGUIENTE CARACTER
        DEC     CL                      ;DECREMENTO CANTIDAD
        JNZ     POLL                    ;SALTO HASTA QUE NO TERMINE
        INT     0
        END
