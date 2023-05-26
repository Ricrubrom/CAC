        .data
peso:   .double 80
altura: .double 1.8
IMC:    .double 0
estado: .byte   0
        .double 18.5
        .double 25
        .double 30
        .code
        l.d     f0, peso(r0)
        l.d     f1, altura(r0)
        mul.d   f1, f1, f1
        div.d   f0, f0, f1
        daddi   r2, r2, 8
        daddi   r1, r1, 8
        l.d     f5, estado(r1)
        c.lt.d  f0, f5
        bc1t    fin
        daddi   r1, r1, 8
        l.d     f5, estado(r1)
        c.lt.d  f0, f5
        bc1t    fin
        daddi   r1, r1, 8
        l.d     f5, estado(r1)
        c.lt.d  f0, f5
        bc1t    fin
        daddi   r1, r1, 8
fin:    ddiv    r1, r1, r2
        sd      r1, estado(r0)
        s.d     f0, IMC(r0)
        halt