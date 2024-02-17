.data
cant: .word 8
datos: .word 1, 2, 3, 4, 5, 6, 7, 8
res: .word 0

.code
dadd r1, r0, r0             #pongo 0 en r1
ld r2, cant(r0)             #cargo longitud de la tabla en r2
loop:   ld r3, datos(r1)    #cargo el primer valor de la tabla en r3
        daddi r2, r2, -1    #decr longitud tabla
        dsll r3, r3, 1      #muevo bit a la izquierda (x2)
        sd r3, res(r1)      #guardo el nuevo valor en res
        bnez r2, loop       #si r2 no es 0 loopeo
        daddi r1, r1, 8     #apunto al proximo
halt