        .data
A:      .asciiz "Hola"
B:      .asciiz "HolaA"
res:    .byte   0
        .code
        daddi   $a0, $a0, A
        daddi   $a1, $a1, B
        jal     rutina
        sd      $v0, res(r0)
        halt

rutina: dsub    $v0, $v0, $v0
loop:   lb      $t0, 0($a0)
        lb      $t1, 0($a1)
        bne     $t0, $t1, finN
        beq     $t0, $0, finY
        daddi   $v0, $v0, 1
        daddi   $a0, $a0, 1
        daddi   $a1, $a1, 1
        j       loop
finY:   dsub    $v0, $v0, $v0
        daddi   $v0, $v0, -1
finN:   jr      $ra
