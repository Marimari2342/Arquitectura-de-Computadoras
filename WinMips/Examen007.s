#Escriba un programa que permita convertir una cadena a Leet. Para ello debe 
#reemplazar a=4 | e=3 | i=1 | o=0 | s=5 | t=7
#El programa debe leer un string terminado en "." luego se debe mostrar el
#original. Finalmente se debe mostrar el string en su version leet.
#Implementar 3 subrutinas:
#   str_read    lee caracteres y los guarda en un string hasta que se lee el
#caracter de fin. El caracter de fin y la direccion del string se pasan por 
#parametro. El string generado debe terminar en 0.
#   car_leet    recibe un caracter y lo convierte a su equivalente leet si es
#necesario, sino devuelve el caracter original.
#   str_leet    recibe string terminado en 0 y convierte sus caracteres a leet

.data
CONTROL:  .word   0x10000
DATA:     .word   0x10008
leet:     .asciiz "431057"
letras:   .asciiz "aeiost"
cadena:   .asciiz "."
fin:      .asciiz "."
cero:     .asciiz "0"

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)
daddi $sp,$0,0x400

#punto a
lbu $a0,fin($0)         #paso caracter de fin
daddi $a1,$0,cadena     #paso direccion del string
jal str_read

#leo string
sd $a1,0($s1)
daddi $t0,$0,4
sd $t0,0($s0)

#punto b
jal str_leet

#leo string
sd $a1,0($s1)
daddi $t0,$0,4
sd $t0,0($s0)
halt


str_read:
daddi $t0,$0,9      #codigo para leer string
dadd $t1,$0,$a1     #copio direccion en registro temporal
loop:    sd $t0,0($s0) 
         lbu $t2,0($s1)
         beq $t2,$a0,sigo
         lbu $t2,cero($0)   #pongo el cero al final
         j termino
sigo:    sb $t2,0($t1)
         daddi $t1,$t1,1
         j loop
termino: jr $ra      

str_leet:   sd $ra,0($sp)           #push $ra
            daddi $sp,$sp,-8

            lbu $s2,cero($0)
            dadd $t1,$0,$0         #puntero          
    loopB:  sd $a0,cadena($t1)
            beq $a0,$s2,fin
            jal car_leet
            sb $v0,cadena($t1)
            daddi $t1,$t1,1
            j loopB

    fin:    ld $ra,0($sp)           #pop $ra
            daddi $sp,$sp,8
            jr $ra

car_leet:   dadd $t0,$0,$0
            daddi $t1,$0,6
    loopC:  lbu $s3,leet($t0)
            lbu $s4,letras($t0)
            beq $a0,$s4,igual
            daddi $t0,$t0,1
            daddi $t1,$t1,-1
            bnez $t1,loopC
            dadd $v0,$0,$a0
            j noleet
    igual:  dadd $v0,$0,$s3
    noleet: jr $ra        
