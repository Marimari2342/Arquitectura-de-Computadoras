#7) Escriba una subrutina que reciba como parámetros un número positivo 
#M de 64 bits, la dirección del comienzo de una tabla que contenga 
#valores numéricos de 64 bits sin signo y la cantidad de valores 
#almacenados en dicha tabla. La subrutina debe retornar la cantidad de 
#valores mayores que M contenidos en la tabla.

.data
M:      .word 7
tab:    .word 4,17,23,5,2
long:   .word 5
res:    .word 0

.code
ld $a0,M($0)        #cargo valor M   
daddi $a1,$0,tab    #cargo direccion del primer valor de la tabla
ld $a2,long($0)     #cargo longitud de la tabla
jal subrut          #llamo subrutina
sd $v0,res($0)      #cargo el resultado en la variable res
halt

subrut: dadd $v0,$0,$0          #contador en 0
loop:   ld $t0,0($a1)           #cargo en t0 un elemento de la tabla
        slt $t1,$a0,$t0         #si num > M t1=1
        beqz $t1,menor          #si t1=0 es menor
        daddi $v0,$v0,1         #si es mayor incremento +1
menor:  daddi $a2,$a2,-1        #decremento long de la tabla
        daddi $a1,$a1,8         #incremento puntero de la tabla
        bnez $a2,loop           #si no se me acabo la tabla loop
        jr $ra                  #salgo de la subrutina