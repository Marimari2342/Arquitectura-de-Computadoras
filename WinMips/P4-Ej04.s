.data
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num: .word 7
long: .word 10
.code
ld r1, long(r0)     #cargo la longitud en r1
ld r2, num(r0)      #cargo el numero en r2
dadd r3, r0, r0     #inicializo r3 en 0
dadd r10, r0, r0    #inicializo r10 en 0
loop:   ld r4, tabla(r3)    #cargo primer valor de la tabla en r4
        beq r4, r2, listo   #si r4=r2 salto 
        daddi r1, r1, -1    #decremento longitud
        daddi r3, r3, 8     #apunto a proximo valor de la tabla
        bnez r1, loop       #si la longitud no es 0 loopeo
        j fin               #no encontre valor igual a r2, salto a fin
listo:  daddi r10, r0, 1    #encontre valor igual a r2, pongo 1 en r10
fin:    halt