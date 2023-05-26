        .data
base:   .double 5.85
altura: .double 13.47
res:    .double 2

        .code
        l.d     f0, base(r0)
        l.d     f1, altura(r0)
        mul.d   f2, f1, f0
        l.d     f5, res(r0)
        div.d   f2, f2, f5
        s.d     f2, res(r0)
        halt