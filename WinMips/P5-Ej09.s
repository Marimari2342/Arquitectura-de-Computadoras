#9) *Escriba la subrutina ES_VOCAL que determina si un caracter es vocal 
#o no, ya sea mayúscula o minúscula. La rutina debe recibir el caracter 
#y debe retornar el valor 1 si es una vocal ó 0 en caso contrario.

.data
car:     .ascii "e"
vocales: .asciiz "aeiouAEIOU"
res:     .word 0

.code
lbu $a0,car($0)     #cargo caracter
jal es_vocal        #llamo a subrutina
sd $v0,res($0)      #cargo resultado en res
halt

es_vocal:   dadd $v0,$v0,$0         #cargo 0 en v0 (sup no es vocal)
            dadd $t1,$0,$0          #uso como puntero
loop:       lbu $t2,vocales($t1)    #cargo primer vocal para comparar
            beqz $t2,final          #si llego al final de cad no es vocal
            beq $a0,$t2, si_es      #es vocal, pongo 1 en v0 y salgo
            daddi $t1,$t1,1         #apunto a la proxima vocal en cadena
            j loop
si_es:      daddi $v0,$v0,1
final:      jr $ra            