#Vamos a pintar una pantalla completamente en degrade de azules

.data
Y:       .byte  0
X:       .byte  0
color:   .byte  0,0,0,0
rosa:    .byte  255,0,150,0
CONTROL: .word  0x10000
DATA:    .word  0x10008 

.code
ld $s0,CONTROL($0)      #dir control y data
ld $s1,DATA($0)
lbu $s2,X($0)
lbu $s3,Y($0)
lwu $s4,color($0)
sw $s4,0($s1)
daddi $t0,$0,5          #comando para imprimir pixel
dadd $s5,$0,$0          #con este cambio intensidad de azul
loop:   sb $s2,5($s1)   #mando X e Y a DATA
        sb $s3,4($s1)
        daddi $s2,$s2,1 #incremento X
        sd $t0,0($s0)   #mando 5 a CONTROL
        slti $s6,$s2,51 #veo que X no se pase de 50
        bnez $s6,loop
        dadd $s2,$0,$0  #reinicio X
        daddi $s5,$s5,5 #inc azul
        sb $s5,2($s1)   #mando azul más claro a DATA
        daddi $s3,$s3,1 #inc Y
        slti $s6,$s3,51
        bnez $s6,loop
        jal rosa 
        jal dibujo
halt

rosa:   lwu $s4,rosa($0)
        sw $s4,0($s1)
        jr $ra

dibujo: nop
loopB:  daddi $t0,$0,8      #leo num y mando a DATA
        sd $t0,0($s0)
        lbu $s2,0($s1)
        sd $t0,0($s0)      
        lbu $s3,0($s1)
        sb $s2,5($s1)       #mando X e Y a DATA
        sb $s3,4($s1)
        daddi $t0,$0,5      #imprimo pixel
        sd $t0,0($s0)
        j loopB
        jr $ra
