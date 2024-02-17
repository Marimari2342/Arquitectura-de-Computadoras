#8) *Escriba una subrutina que reciba como parámetros las direcciones 
#del comienzo de dos cadenas terminadas en cero y retorne la posición 
#en la que las dos cadenas difieren. En caso de que las dos cadenas 
#sean idénticas, debe retornar -1.

.data
cad1: .asciiz "unacadena"
cad2: .asciiz "unacorona"
pos:  .word 0

.code
daddi $a0,$0,cad1      #cargo direccion de primer elemento de cad1
daddi $a1,$0,cad2      #cargo direccion de primer elemento de cad2
jal subrut          #llamo a subrutina
sd $v0,pos($0)      #cargo resultado en pos
halt

subrut: dadd $v0,$0,$0      #pongo en 0 el contador de posiciones
loop:   lbu $t0,0($a0)      #copio el primer caracter de la cadena 
        lbu $t1,0($a1)
        beqz $t0,veo_dos    #si $t0=0 termino cad1, evaluo cad2
        beqz $t1,final      #si $t1=0 pero t0 no es 0, termino
        bne $t0,$t1,final   #si los valores no son iguales termino
        daddi $v0,$v0,1     #si son iguales incremento $v0
        daddi $a0,$a0,1     #avanzo 1 porque es una cadena de char
        daddi $a1,$a1,1        
        j loop              
veo_dos:bnez $t1,final      #si $t1 no es 0 pero $t0 si voy a final     
        daddi $v0,$0,-1     #si estoy acá es xq las cadenas son iguales
final:  jr $ra              #vuelvo de la subrutina        