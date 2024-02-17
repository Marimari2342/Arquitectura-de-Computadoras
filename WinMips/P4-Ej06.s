#6) Escribir un programa que lea tres números enteros A, B y C de la 
#memoria de datos y determine cuántos de ellos son iguales entre sí 
#(0, 2 o 3). El resultado debe quedar almacenado en la dirección de 
#memoria D.

.data
A: .word 2
B: .word 3
C: .word 5
D: .word 0

.code
ld r1,A(r0)             #cargo numeros para comparar
ld r2,B(r0)
ld r3,C(r0)             
dadd r4,r0,r0           #aca cargo cuantos son iguales
beq r1,r2,miro_r3       #comparo A y B, si son iguales veo C
beq r1,r3,dos_eq        #comparo A y C, si son iguales tengo 2 eq
beq r2,r3,dos_eq        #comparo B y C, si son iguales tengo 2 eq
j final                 #si estoy aca son todos distintos
miro_r3:    beq r1,r3,tres_eq   #veo si tengo 2 iguales o 3 iguales
dos_eq:     daddi r4,r0,2
            j final
tres_eq:    daddi r4,r0,3
final:      sd r4,D(r0)         #dejo el resultado
halt