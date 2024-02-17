.data
TABLA1: .double 12.0,15.5,31.2,56.4,44.3,78.1
MIN:    .double 20.0
MAX:    .double 50.0
CANT:   .word   6
RES:    .word   0
TABLA2: .double 0.0

.code
ld $t0,CANT($0)
l.d f1,MIN($0)
    l.d f2,MAX($0)              #completar
dadd $t3,$0,$0
dadd $t4,$0,$0
dadd $t5,$0,$0
loop:       l.d f3,TABLA1($t4) #completar
        c.lt.d f3,f1
        bc1t fuera
        c.lt.d f2,f3
        bc1t fuera
        daddi $t3,$t3,1
        s.d f3,TABLA2($t5)
            daddi $t5,$t5,8     #completar
fuera:  daddi $t4,$t4,8
        daddi $t0,$t0,-1
        bnez $t0,loop
        sd $t3,RES($0)
halt