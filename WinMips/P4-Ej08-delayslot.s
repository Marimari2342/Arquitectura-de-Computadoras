#8) * Escribir un programa que multiplique dos números enteros 
#utilizando sumas repetidas (similar a Ejercicio 6 o 7 de la Práctica
#1). El programa debe estar optimizado para su ejecución con la opción 
#Delay Slot habilitada.

.data
A: .word 3
B: .word 8
C: .word 0
.code
ld r2,B(r0)     #traigo B
ld r1,A(r0)     #traigo A
dadd r3,r0,r0   #aca voy a ir haciendo las sumas repetidas
loop:   beqz r2,final
        daddi r2,r2,-1
        bnez r2,loop
        dadd r3,r3,r1
final:  sd r3,C(r0)     #cargo el resultado en C
halt