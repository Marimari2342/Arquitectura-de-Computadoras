.data
CONTROL: .word32 0x10000
DATA:    .word32 0x10008
valor:   .byte   255,0,0,0,5,10
.code
lwu $s0,DATA($0)
lwu $s1,CONTROL($0)
ld $t1,valor($0)
sd $t1,0($s0)
daddi $t0,$0,5
sd $t0,0($s1)
halt