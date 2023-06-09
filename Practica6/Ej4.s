        .data
CONTROL: .word32 0x10000
DATA:   .word32 0x10008
MSJ:    .asciiz "Inserte clave: "
ERROR:  .asciiz "Clave incorrecta"
PASE:   .asciiz "Clave correcta"
CLAVE:  .asciiz "1234"
INSERT: .asciiz ""


        .text
        lw      $a0, CONTROL($0)
        lw      $a1, DATA($0)
        daddi   $a2, $0, MSJ
        daddi   $a3, $0, INSERT
        jal     ingreso
        ld      $a2, CLAVE($0)
        ld      $a3, INSERT($0)
        jal     entry
        halt



ingreso: daddi  $t0, $0, 6
        sd      $t0, 0($a0)
        sd      $a2, 0($a1)
        daddi   $t0, $0, 4
        sd      $t0, 0($a0)
        daddi   $t1, $0, 4
loop:   beqz    $t1, fin
        daddi   $t0, $0, 9
        sd      $t0, 0($a0)
        lb      $v0, 0($a1)
        sb      $v0, 0($a3)
        daddi   $a3, $a3, 1
        daddi   $t1, $t1, -1
        j       loop
fin:    jr      $ra

entry:  daddi   $t0, $0, 6
        sd      $t0, 0($a0)
        dsub    $t0, $a2, $a3
        bnez    $t0, error
        daddi   $t0, $0, PASE
        sd      $t0, 0($a1)
        daddi   $t0, $0, 4
        sd      $t0, 0($a0)
        jr      $ra
error:  daddi   $t0, $0, ERROR
        sd      $t0, 0($a1)
        daddi   $t0, $0, 4
        sd      $t0, 0($a0)
        jr      $ra
