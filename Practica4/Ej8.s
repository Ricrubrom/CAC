.data
num1:   .byte   4
num2:   .byte   2
res:    .byte   0

.code
        lb      r1, num1(r0)
        lb      r2, num2(r0)
        daddi   r3, r0, 0
mult:   daddi   r2, r2, -1
        beqz    r2, fin
        dadd    r3, r3, r1
        beqz    r0, mult
fin:    sb      r3, res(r0)
halt