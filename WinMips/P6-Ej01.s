#1) El siguiente programa produce la salida de un mensaje predefinido en
#la ventana Terminal del simulador WinMIPS64. Teniendo en cuenta las 
#condiciones de control del puerto de E/S (en el resumen anterior), 
#modifique el programa de modo que el mensaje a mostrar sea ingresado 
#por teclado en lugar de ser un mensaje fijo.

.data
CONTROL: .word   0x10000
DATA:    .word   0x10008
texto:   .asciiz "."    #El mensaje a mostrar
cero:    .asciiz "0"

.code
ld $s0,DATA($0)         #$s0 = DATA
ld $s1,CONTROL($0)      #$s1 = CONTROL
lbu $t3,cero($0)
dadd $t2,$0,$0                  #puntero
daddi $t0,$0,9
loop:   sd $t0,0($s1)           # 9 a CONTROL
        lbu $t1,0($s0)          # leo un char
        beq $t1,$t3,termino
        sb $t1,texto($t2)
        daddi $t2,$t2,1
        j loop
termino: daddi $t0,$0,texto     #$t0 = dirección del mensaje a mostrar
         sd $t0,0($s0)          #DATA recibe puntero al comienzo del mensaje
         daddi $t0,$0,4         #$t0 = 4 -> salida de una cadena ASCII
         sd $t0,0($s1)          #CONTROL 4: produce la salida del mensaje
         halt