.data
A: .word 1
B: .word 3
arreglo: .word 0
.code
ld r2, B(r0)
ld r1, A(r0)
dadd r3,r0,r0
loop:   daddi r2, r2, -1
        sd r1,arreglo(r3)
        dsll r1, r1, 1   #desplazo una vez a la izquierda los bits de r1
        daddi r3,r3,8
        bnez r2, loop    #salta si r2 no es 0
sd r1,arreglo(r3)
halt