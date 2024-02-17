#10) Usando la subrutina escrita en el ejercicio anterior, escriir la
#subrutina CONTAR_VOC, que recibe una cadena terminada en cero y 
#devuelve la cantidad de vocales que tiene esa cadena.

.data
cad:     .asciiz "bacedifogu"
vocales: .asciiz "aeiouAEIOU"
res:     .word 0

.code
daddi $sp,$0,0x400  #la pila comienza en el tope de la memoria de datos
daddi $a1,$0,cad    #direccion de la cadena
jal contar_voc
sd $v0,res($0)
halt

contar_voc: daddi $sp,$sp,-8    #Push $ra
            sd $ra,0($sp)
loopb:      lbu $a0,0($a1)      #tomo valor de la cadena
            beqz $a0, termino   #me fijo si termino la cadena
            jal es_vocal        #llamo a subrutina
            daddi $a1,$a1,1     #apunto al proximo caracter
            j loopb
termino:    ld $ra,0($sp)       #Pop $ra
            daddi $sp,$sp,8     

es_vocal:   dadd $v0,$v0,$0         #cargo 0 en v0 (sup no es vocal)
            dadd $t1,$0,$0          #uso como puntero
loop:       lbu $t2,vocales($t1)    #cargo primer vocal para comparar
            beqz $t2,final          #si llego al final de cad no es vocal
            beq $a0,$t2, si_es      #es vocal, pongo 1 en v0 y salgo
            daddi $t1,$t1,1         #apunto a la proxima vocal en cadena
            j loop
si_es:      daddi $v0,$v0,1
final:      jr $ra  