        .data
CONTROL: .word32 0x10000
DATA:   .word32 0x10008
NUMEROS: .asciiz "CERO"
        .asciiz "UNO"
        .asciiz "DOS"
        .asciiz "TRES"
        .asciiz "CUATRO"
        .asciiz "CINCO"
        .asciiz "SEIS"
        .asciiz "SIETE"
        .asciiz "OCHO"
        .asciiz "NUEVE"

        .code
        lw      $a0, CONTROL($0)
        lw      $a1, DATA($0)
        jal     ingreso
        dadd    $a2, $0, $v0
        daddi   $a3, $0, NUMEROS
        jal     muestra
        halt

ingreso: daddi  $t4, $0, 8
        sd      $t4, 0($a0)
        ld      $v0, 0($a1)
        slti    $t0, $v0, 9
        beqz    $t0, ingreso
        slti    $t0, $v0, -1
        bnez    $t0, ingreso
        jr      $ra

muestra: daddi   $t3, $0, 8
        dmul    $t2, $a2, $t3
        daddi   $t1, $0, 6
        sd      $t1, 0($a0)
        dadd    $t4, $t2, $a3
        sd      $t4, 0($a1)
        daddi   $t1, $0, 4
        sd      $t1, 0($a0)
        jr      $ra
