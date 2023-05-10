.data
Y: .byte 1
X: .byte 0
A: .byte 8

.code
lb      r1, Y(r0)
dsub    r2, r2, r2
lb      r3, A(r0)
while:  beqz    r3, fin
dadd    r2, r2, r1
daddi   r3, r3, -1
beqz    r0, while
fin: sb r2, X(r0)
halt