.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
uno:     .double 1.0
num:     .double 0.0
.code
ld $t0,CONTROL($0)
ld $t1,DATA($0)
l.d f1,uno($0)
daddi $t2,$0,8
sd $t2,0($t0)
l.d f0,0($t1)   #leo un flotante
s.d f0,num($0)
add.d f0,f0,f1  #lo multiplico x2
daddi $t2,$0,3
s.d f0,0($t1)
sd $t2,0($t0)   #imprimo resultado
halt