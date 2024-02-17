#Cargar dos punto flotante, sumarlos, imprimir, pasar resultado a entero y
#volver a imprimir

.data
num1:    .double  5.6
num2:    .double  4.8
res:     .word    0
CONTROL: .word   0x10000
DATA:    .word   0x10008
mje1:    .asciiz "Valor flotante: "
mje2:    .asciiz "Valor entero: "

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)
#cargo y calculo suma flotante
l.d f0,num1($0)
l.d f1,num2($0)
add.d f1,f1,f0      
#imprimo mje uno
daddi $t0,$0,4
daddi $t1,$0,mje1 
sd $t1,0($s1)  
sd $t0,0($s0)
#imprimo numero flotante
daddi $t0,$0,3
s.d f1,0($s1)
sd $t0,0($s0)
#convierto flotante a entero
cvt.l.d f1,f1
mfc1 $s2,f1
#imprimo mje dos
daddi $t0,$0,4
daddi $t1,$0,mje2
sd $t1,0($s1)
sd $t0,0($s0)
#imprimo numero entero
daddi $t0,$0,1
sd $s2,0($s1)
sd $t0,0($s0)
#guardo
sd $s2,res($0)
halt