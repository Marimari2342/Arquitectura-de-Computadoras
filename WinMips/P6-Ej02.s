#2) Escriba un programa que utilice sucesivamente dos subrutinas: La primera,
#denominada ingreso, debe solicitar el ingreso por teclado de un número entero
#(de un dígito), verificando que el valor ingresado realmente sea un dígito. La
#segunda, denominada muestra, deberá mostrar en Terminal el valor del número
#ingresado expresado en letras. Establezca el pasaje de parámetros entre
#subrutinas respetando las convenciones para el uso de los registros y minimice 
#las detenciones del cauce (ejercicio similar al ejercicio 6 de Práctica 2).

.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
mje:     .asciiz "valor incorrecto\n"
numeros:    .asciiz "cero  "
            .asciiz "uno   "
            .asciiz "dos   "
            .asciiz "tres  "
            .asciiz "cuatro"
            .asciiz "cinco "
            .asciiz "seis  "
            .asciiz "siete "
            .asciiz "ocho  "
            .asciiz "nueve "

.code
sd $s0,CONTROL($0)
sd $s1,DATA($0)
jal ingreso
jal muestra
halt

ingreso:    daddi $t0,$0,8
loop:       sd $t0,0($s0)
            ld $t2,0($s1)
            slt $t4,$0,$t2     #t2>=0 1 en t4
            beqz $t4,error
            slti $t4,$t2,10    #t2<=9 1 en t4
            bnez $t4,sigo

error:      daddi $t5,$0,mje
            sd $t5,0($s1)
            daddi $t6,$0,4
            sd $t6,0($s0)
            j loop

sigo:       dadd $v0,$0,$t1
            jr $ra

muestra: daddi $s2,$0,numeros
         dadd $t0,$0,$0         #contador
         dadd $t1,$0,$0         #puntero
loopB:   beq $v0,$t0,igual 
         daddi $t0,$t0,1
         daddi $t1,$t1,6
         j loopB
igual:   sd $t1,0($a1)
         daddi $t2,$0,4
         sd $t2,0($a0)
         jr $ra       
