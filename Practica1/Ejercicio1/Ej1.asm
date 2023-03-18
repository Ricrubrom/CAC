ORG 1000H
NUM0 DB 0CAH
NUM1 DB 0
NUM2 DW ?
NUM3 DW 0ABCDH
NUM4 DW ?
ORG 2000H
MOV BL, NUM0  ;Copia el dato de num0 en BL
MOV BH, 0FFH  ;Guarda en BH FFh
MOV CH, BL    ;Copia BL en CH
MOV AX, BX    ;Copia BX (BL y BH) en AX
MOV NUM1, AL  ;Copia a la posicion de memoria donde esta NUM1 el valor de AL
MOV NUM2, 1234H ;Guarda en NUM2 1234h
MOV BX, OFFSET NUM3 ;Copia en BX la posicion en memoria de NUM3
MOV DL, [BX]        ;Copia en DL el dato guardado en la posicion almacenada en BX
MOV AX, [BX]        ;Idem al anterior pero en AX
MOV BX, 1006H       ;Guarda en BX 1006h
MOV WORD PTR [BX], 1006H  ;Guarda en la posicion guardada en BX el valor 1006h
HLT
END



;ri es un registro temporal que almacena la direccion en memoria donde se debe leer/escribir un dato (tipo byte o word, si es word se incrementa para guardar cada byte del dato)
;id es un registro temporal que almacena un dato de tipo word que luego sera almacenado en memoria.