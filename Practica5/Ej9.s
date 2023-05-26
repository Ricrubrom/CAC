        .data
valor:  .word   10
result: .word   0
        .code
        daddi   $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila (1)
        ld      $a0, valor($0)
        jal     factorial
        sd      $v0, result($0)
        halt

factorial: nop
        daddi   $v0, $0, 1
        beqz    $a0, sigo
        daddi   $sp, $sp, -8
        sd      $a0, 0($sp)
        daddi   $sp, $sp, -8
        sd      $ra, 0($sp)
        daddi   $a0, $a0, -1
        jal     factorial
sigo:   ld      $ra, 0($sp)
        daddi   $sp, $sp, 8
        ld      $t1, 0($sp)
        daddi   $sp, $sp, 8
        dmul    $v0, $v0, $t1
        jr      $ra


