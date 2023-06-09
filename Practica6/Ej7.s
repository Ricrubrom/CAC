                .data
CONTROL:        .word32     0x10000
DATA:           .word32     0x10008
CERO:           .byte       0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,1,1,0,0
UNO:            .byte       0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0
DOS:            .byte       0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0
TRES:           .byte       0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0
CUATRO:         .byte       0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,0,0,1,1,0,0,1,0,0,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0
CINCO:          .byte       0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,1,1,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,1,1,1,0,0,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0
SEIS:           .byte       0,0,0,0,0,0,0,0,1,1,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,1,1,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0
SIETE:          .byte       0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,1,1,0,0,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,0
OCHO:           .byte       0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,1,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,1,1,0,0
NUEVE:          .byte       0,0,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0
BLANCO:         .word32     0x00FFFFFF
NEGRO:          .word32     0x00000000
MSJ:            .asciiz     "Inserte Numero: "

                .code
                lw      $a0, CONTROL($0)
                lw      $a1, DATA($0)
                jal     ingreso
                daddi   $s3, $0, CERO      ;Calculo el desplazamiento para moverme al numero correcto
                daddi   $t0, $0, 64
                dmulu   $t1, $t0, $v0 
                dadd    $s3, $s3, $t1      ;Direccion de comienzo
                jal     imprimir
                halt


ingreso:        daddi   $t0, $0, MSJ
                sd      $t0, 0($a1)
                daddi   $t0, $0, 4
                sd      $t0, 0($a0)
                daddi   $t0, $0, 8
                sd      $t0, 0($a0)
                ld      $v0, 0($a1)
                slti    $t0, $v0, 9
                beqz    $t0, ingreso
                slti    $t0, $v0, -1
                bnez    $t0, ingreso
                jr      $ra


imprimir:       lwu     $t0, BLANCO($0)
                lwu     $t1, NEGRO($0)

                daddi   $s1, $0, 9         ;Contador de filas
        
                daddi   $t7, $0, 5       ;Actualizar pixel
                daddi   $s0, $0, 0         ;PosY = 0    

fila:           sb      $s0, 4($a1)           ;Guardo PosY
                daddi   $s4, $0, 7         ;Contador de columnas
                daddi   $s5, $0, 0         ;PosX = 0

columnas:       sb      $s5, 5($a1)           ;Guardo la columna actual
                lbu     $t2, 0($s3)          ;Guardo el flag
                beqz    $t2, no_pinto
                sw      $t1, 0($a1)           ;Imprimo un negro
                j       sigo
no_pinto:       sw      $t0, 0($a1)           ;Imprimo un blanco
sigo:           sd      $t7, 0($a0)           ;Imprimo el pixel
                daddi   $s3, $s3, 1        ;Incremento la direccion
                daddi   $s4, $s4, -1       ;Decremento cant de columnas
                daddi   $s5, $s5, 1        ;PosX += 1
                bnez    $s4, columnas       ;Salto si me quedan columnas
                
                daddi   $s0, $s0, 1         ;PosY += 1
                daddi   $s1, $s1, -1
                bnez    $s1, fila
                jr      $ra