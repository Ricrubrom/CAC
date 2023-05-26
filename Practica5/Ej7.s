        .data
M:      .word   5
Tabla:  .word   1,2,3,4,5,6,7,8,9,10
res:    .word   0

        .code
        ld      $a0, M(r0)
        daddi   $a1, $a1, Tabla
        daddi   $a2, $a2, res
        dsub    $a2, $a2, $a1
        jal     rutina
        sd      $v0, res(r0)
        halt


rutina: dsub    $v0, $v0, $v0
loop:   dadd    $t3, $a2, $a1
        ld      $t0, 0($t3)
        beqz    $a2, finRut
        slt     $t1, $a0, $t0
        dadd    $v0, $v0, $t1
        daddi   $a2, $a2, -8
        j       loop
finRut: slt     $t1, $a0, $t0
        dadd    $v0, $v0, $t1
        jr      $ra