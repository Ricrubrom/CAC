.data
tabla:  .byte   1
        .byte   2
        .byte   3
        .byte   4
        .byte   5
        .byte   6
        .byte   7
        .byte   8
        .byte   9
        .byte   10
res:    .byte   0
        .byte   0
        .byte   0
        .byte   0
        .byte   0
        .byte   0
        .byte   0
        .byte   0
        .byte   0
        .byte   0
x:      .byte   5


.code
        lb      r3, x(r0)
        daddi   r5, r0, 0
        daddi   r4, r0, 10      ;cant
loop:   beqz    r4, fin
        lb      r1, tabla(r5)
        slt     r2, r3, r1
        sb      r2, res(r5)
        daddi   r4, r4, -1
        daddi   r5, r5, 8
        beq     r0, r0, loop
fin:    halt