.data
valor1: .word 16
valor2: .word 4
result: .word 0
.text
ld $a0, valor1($zero)   #cargo el valor uno en $a0
ld $a1, valor2($zero)   #cargo el valor dos en $a1
jal a_la_potencia       #llamo subrutina y guardo dir de retorno en $ra
sd $v0, result($zero)   #guardo el valor en result
halt
a_la_potencia: daddi $v0, $zero, 1  #pongo en $v0 un 1
lazo: slt $t1, $a1, $zero           #comparo $a1 con 0, si a1<0, t1=1
bnez $t1, terminar                  #cuando t1 no es 0 termino
daddi $a1, $a1, -1                  #decremento a1
dmul $v0, $v0, $a0                  #multiplico a0 por v0
j lazo                              
terminar: jr $ra                    #vuelvo al programa principal