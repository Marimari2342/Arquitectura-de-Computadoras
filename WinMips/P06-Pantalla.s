#Hacer una viborita azul desde 10,10 hasta 10,15

.data
X:       .byte   10
Y:       .byte   10
color:   .byte   255,0,0,0
CONTROL: .word   0x10000
DATA:    .word   0x10008

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)
lbu $s2,X($0)       #cargo coord X
sb $s2,5($s1)
lbu $s3,Y($0)       #cargo coord Y (la parte de data abajo porque me muevo en Y)
lwu $s4,color($0)   #cargo color
sw $s4,0($s1)
lbu $s6,color+2($0)
daddi $t0,$0,5      #codigo para imprimir pixel
loop: sb $s3,4($s1)
      sd $t0,0($s0)
      daddi $s6,$s6,5
      sb $s6,2($s1)
      daddi $s3,$s3,1
      slti $s5,$s3,51
      bnez $s5, loop
halt