        .data
CONTROL: .word32 0x10000
DATA:   .word32 0x10008

        .code
        lw      $a0, CONTROL($0)
        lw      $a1, DATA($0)
        jal     ingreso
        dadd    $a2, $0, $v0
        jal     ingreso
        dadd    $a3, $0, $v0
        jal     result

ingreso: daddi  $t4, $0, 8
        sd      $t4, 0($a0)
        ld      $v0, 0($a1)
        slti    $t0, $v0, 9
        beqz    $t0, ingreso
        slti    $t0, $v0, -1
        bnez    $t0, ingreso
        jr      $ra

result: 
        daddi   $t1, $0, 6
        sd      $t1, 0($a0)
        dadd    $t0, $a2, $a3
        sd      $t0, 0($a1)
        daddi   $t1, $0, 2
        sd      $t1, 0($a0)
        jr      $ra
