.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car:    .asciiz "d" ; caracter buscado
cant:   .word   0 ; cantidad de veces que se repite el caracter car en cadena.

.code
        lb      r1, car(r0)
        dsub    r3, r3, r3
        dsub    r4, r4, r4
loop:   lbu     r2, cadena(r3)
        beqz    r2, fin
        dsub    r5, r2, r1
        bnez    r5, sigo
        daddi   r4, r4, 1
sigo:   daddi r3, r3, 8
        beqz    r0, loop
fin:    sb r4, cant(r0)
        halt