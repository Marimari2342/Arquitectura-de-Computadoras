#3) Escriba un programa que realice la suma de dos números enteros (de un dígito
#cada uno) utilizando dos subrutinas: La denominada ingreso del ejercicio 
#anterior (ingreso por teclado de un dígito numérico) y otra denominada resultado,
#que muestre en la salida estándar del simulador (ventana Terminal) el resultado
#numérico de la suma de los dos números ingresados (ejercicio similar al 
#ejercicio 7 de Práctica 2).

.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
num:     .word 0,0
mje:     .asciiz "valor incorrecto\n"

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)
jal ingreso
daddi $t0,$0,8
ld $t1,num($0)
ld $t2,num($t0)
dadd $a0,$t1,$t2
jal resultado
halt


ingreso:    daddi $t0,$0,8
            dadd $t3,$0,$0     #puntero
            daddi $t1,$0,2     #contador de numeros que quiero cargar

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

sigo:       sd $t2,num($t3)
            daddi $t1,$t1,-1
            daddi $t3,$t3,8
            bnez $t1,loop
            jr $ra


resultado:  daddi $t0,$0,2
            sd $a0,0($s1)
            sd $t0,0($s0)
            jr $ra