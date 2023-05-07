.data
A:    .byte 0x12
B:    .byte 0x13
C:    .byte 0x14
D:    .byte 0x00

.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
dsub r4, r1, r2
bnez r4, noIguales
daddi r5, r0, 2
dsub r4, r1, r3
bnez r4, fin
daddi r5, r5, 1
beq r0, r0, fin
noIguales: dsub r4, r1, r3
BNEZ r4, fin
daddi r5, r0, 2
fin: sb      r5, D(r0)
halt