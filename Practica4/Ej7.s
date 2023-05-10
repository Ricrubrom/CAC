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
cant:   .byte   0


.code
        lb      r3, x(r0)
        daddi   r5, r0, 0
        daddi   r6, r0, 0
        daddi   r10, r0, tabla
        daddi   r11, r0, res
        dsub    r4, r11, r10
loop:   beqz    r4, fin
        lb      r1, tabla(r5)
        slt     r2, r3, r1
        dadd    r6, r6, r2
        sb      r2, res(r5)
        daddi   r4, r4, -8
        daddi   r5, r5, 8
        beqz     r0, loop
fin:    sb      r6,cant(r0)
halt