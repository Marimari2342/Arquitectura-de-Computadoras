.data
cant:   .word 2
datos:  .word 1,2
res:    .word 0

.code
dadd r1,r0,r0
ld r5,cant(r0)
loop:   ld r3,datos(r1)
        daddi r5,r5,-1
        dsllv r3,r3,r3
        sd r3,res(r1)
        daddi r1,r1,8
        bnez r5,loop
halt