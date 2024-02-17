.data
Y:       .byte  0
X:       .byte  0
rosa:    .byte  255,0,50,0
CONTROL: .word  0x10000
DATA:    .word  0x10008 

.code
ld $s0,CONTROL($0)      #dir control y data
ld $s1,DATA($0)
lbu $s2,X($0)
lbu $s3,Y($0)
lwu $s4,rosa($0)
sw $s4,0($s1)
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
        halt