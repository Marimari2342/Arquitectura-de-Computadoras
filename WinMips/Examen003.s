.data
CONTROL: .word32 0x10000
DATA:    .word32 0x10008
num:     .double 2.2

.code
lwu $s6,CONTROL($0)
lwu $s7,DATA($0)
l.d f2,num($0)
daddi $s1,$0,3
s.d f2,0($s7)
sd $s1,0($s6)
halt