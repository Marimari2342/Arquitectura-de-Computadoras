.data
ent:    .word   0
flot:   .double 5.2

.code
l.d f9,flot(r0)
cvt.l.d f9,f9
mfc1 r5,f9
sd r5,ent(r0)
halt