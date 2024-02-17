#11) Escribir una subrutina que reciba como argumento una tabla de 
#números terminada en 0. La subrutina debe contar la cantidad de 
#números que son impares en la tabla. Ésta condición se debe verificar 
#usando la subrutina ES_IMPAR. La subrutina ES_IMPAR debe devolver 1
#si el número es impar y 0 si no lo es.

.data
tabla:  .word 5,4,6,7,12,3,8,9,0
res:    .word 0
mask:   .word 1

.code
daddi $sp,$0,0x400  #direccion de la pila
daddi $a0,$0,tabla  #direccion de la tabla
dadd $v0,$0,$0
jal recorrer
sd $v0,res($0)
halt

recorrer:   daddi $sp,$sp,-16    #push $ra
            sd $ra,0($sp)
            sd $s0,8($sp)
            dadd $s0,$0,$a0    #cargo direccion inicial en $s0
loop:       ld $a0,0($s0)
            beqz $a0,fin
            jal es_impar
            daddi $s0,$s0,8    #apunto al proximo
            j loop
fin:        ld $ra,0($sp)
            ld $s0,8($sp)
            daddi $sp,$sp,16   #pop $ra
            jr $ra

es_impar:   ld $s1,mask($0)
            and $t1,$a0,$s1       #me fijo si es impar
            beqz $t1,no_es
            daddi $v0,$v0,1
no_es:      jr $ra            