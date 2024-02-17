#3) *Escribir un programa que calcule la superficie de un triángulo 
#rectángulo de base 5,85 cm y altura 13,47 cm. Pista: la superficie 
#de un triángulo se calcula como: base x altura / 2

.data
base:   .double 5.85
altura: .double 13.47
res:    .double 0.0
dos:    .double 2.0

.code
l.d f1, base(r0)
l.d f2, altura(r0)
mul.d f3,f2,f1
l.d f4, dos(r0)
div.d f3,f3,f4
s.d f3,res(r0)
halt