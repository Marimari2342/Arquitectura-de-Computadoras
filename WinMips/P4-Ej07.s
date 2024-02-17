#7) * Escribir un programa que recorra una TABLA de diez números enteros
#y determine cuántos elementos son mayores que X. El resultado debe 
#almacenarse en una dirección etiquetada CANT. El programa debe generar
#además otro arreglo llamado RES cuyos elementos sean ceros y unos. 
#Un ‘1’ indicará que el entero correspondiente en el arreglo TABLA es 
#mayor que X, mientras que un ‘0’ indicará que es menor o igual.

.data
X:      .word 5
tab:    .word 1,4,5,7,9,3,2,6,5,2
long:   .word 10
cant:   .word 0
res:    .word 0

.code 
ld r1,X(r0)         #cargo X en r1    
dadd r2,r0,r0       #registro puntero
dadd r3,r0,r0       #contador de numeros mayores a X
ld r4,long(r0)      #longitud de tabla
loop:   ld r5,tab(r2)   #voy trayendo elementos de la tabla
        daddi r4,r4,-1  #decremento r4
        slt r6,r1,r5    #si r5>r1 pongo 1 en r6
        sd r6,res(r2)   #agrego al arreglo de 01
        beqz r6,menor   #si r6=0 el numero es menor o igual
        daddi r3,r3,1   #incremento si es mayor
menor:  daddi r2,r2,8   #apunto al proximo
        bnez r4,loop    #si no se me acabo la tabla loopeo
        sd r3,cant(r0)  #cargo el resultado en cant
halt
