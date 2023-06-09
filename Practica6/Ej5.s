        .data
CONTROL: .word32 0x10000
DATA:   .word32 0x10008
MSJ1:   .asciiz "Ingrese la base (FP): "
MSJ2:   .asciiz "Ingrese el exponente: "
MSJ3:   .asciiz "El resultado es: "



        .code
        lw      $a0, CONTROL($0)
        lw      $a1, DATA($0)
        daddi   $s0, $0, MSJ1                   ;BASE
        sd      $s0, 0($a1)
        daddi   $s0, $0, 4
        sd      $s0, 0($a0)
        daddi   $s0, $0, 8
        sd      $s0, 0($a0)
        l.d     f0, 0($a1)
        daddi   $s0, $0, 6
        sd      $s0, 0($a0)

        daddi   $s0, $0, MSJ2                   ;BASE
        sd      $s0, 0($a1)
        daddi   $s0, $0, 4
        sd      $s0, 0($a0)
        daddi   $s0, $0, 8
        sd      $s0, 0($a0)
        ld      $a2, 0($a1)
        daddi   $s0, $0, 6
        sd      $s0, 0($a0)

        jal    potencia
        halt


potencia: beqz  $a2, fin
        mul.d   f1, f0, f0
        daddi   $a2, $a2, -1
        j       potencia
fin:    daddi   $t0, $0, MSJ3
        sd      $t0, 0($a1)
        daddi   $t0, $0, 4
        sd      $t0, 0($a0)
        s.d     f1, 0($a1)
        daddi   $t0, $0, 3
        sd      $t0, 0($a0)
        jr      $ra