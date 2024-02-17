#4) Escriba un programa que solicite el ingreso por teclado de una clave (sucesión
#de cuatro caracteres) utilizando la subrutina char de ingreso de un carácter.
#Luego, debe comparar la secuencia ingresada con una cadena almacenada en la 
#variable clave. Si las dos cadenas son iguales, la subrutina respuesta mostrará
#el texto “Bienvenido” en la Terminal. En cambio, si las cadenas no son iguales, 
#la subrutina deberá mostrar “ERROR” y solicitar nuevamente el ingreso de la clave.

.data
CONTROL: .word   0x10000
DATA:    .word   0x10008
inicio:  .asciiz "Ingrese su clave:\n"
clave:   .asciiz "68su"
bien:    .asciiz "Bienvenido\n"
mal:     .asciiz "ERROR\nVuelva a ingresar la clave"
claIng:  .asciiz "...."

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)
daddi $sp,$0,0x400      #pila
daddi $t0,$0,4          #Envio mensaje de inicio
daddi $t1,$0,inicio
sd $t1,0($s1)
sd $t0,0($s0)
loopA:  jal leer_clave          #leo clave
        jal respuesta
        bnez $v0,loopA          #cuando la respuesta sea correcta en v0 guardo 0
halt

leer_clave: daddi $sp,$sp,-8    #push ra
            sd $ra,0($sp)
            daddi $t0,$0,4      #contador
            dadd $t1,$0,$0      #puntero
            daddi $a2,$0,9      #a2 = 9
loopA:      jal char
            sb $v0,claIng($t1)  #guardo char en cadena
            daddi $t1,$t1,1     #inc puntero
            daddi $t0,$t0,-1    #decr cant char
            bnez $t0,loopA      
            ld $ra,0($sp)       #pop ra
            daddi $sp,$sp,8
            jr $ra              #return adress

char:       sd $a2,0($s0)       # mando 9 a control
            lbu $v0,0($s1)      # me guardo el char en v0
            jr $ra

respuesta:  dadd $t0,$0,$0      #puntero
            daddi $t1,$0,4      #contador
            daddi $t4,$0,4      #mje para control
loopB:      lbu $t2,clave($t0)
            lbu $t3,claIng($t0)
            bne $t2,$t3,distinto
            daddi $t0,$t0,1
            daddi $t1,$t1,-1
            bnez $t1,loopB
            j igual
distinto:   daddi $t1,$0,mal        #Envio mensaje error
            daddi $v0,$0,1
            j final
igual:      daddi $t1,$0,bien       #Envio mensaje bien
            dadd $v0,$0,$0
final:      sd $t1,0($s1)
            sd $t4,0($s0)        
