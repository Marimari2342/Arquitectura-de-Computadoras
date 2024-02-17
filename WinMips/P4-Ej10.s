#10) Escribir un programa que cuente la cantidad de veces que un 
#determinado caracter aparece en una cadena de texto. Observar cómo 
#se almacenan en memoria los códigos ASCII de los caracteres (código
#de la letra “a” es 61H). Utilizar la instrucción lbu (load byte 
#unsigned) para cargar códigos en registros. La inicialización de los 
#datos es la siguiente:

.data
cadena: .asciiz "adbdcdedfdgdhdid"  #cadena a analizar
car: .asciiz "d"                    #caracter buscado
cant: .word 0                       #veces que se repite car en cadena

.code
lbu r1,car(r0)      #r1 caracter
dadd r2,r0,r0       #r2 puntero
dadd r3,r0,r0       #r3 resultado
loop:   lbu r4,cadena(r2)   #r4 cadena
        daddi r2,r2,1       #apunto al proximo caracter de la cadena
        beqz r4,final       #si r4=0 llegue al final de la cadena
        bne r1,r4,no_eq     #si no son iguales salto
        daddi r3,r3,1       #inc contador de iguales
no_eq:  j loop
final:  sd r3,cant(r0)      #guardo el resultado
halt