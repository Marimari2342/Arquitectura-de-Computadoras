#9) Escribir un programa que implemente el siguiente fragmento 
#escrito en un lenguaje de alto nivel:
#   while a > 0 do begin
#       x := x + y;
#       a := a - 1;
#   end;
#Ejecutar con la opción Delay Slot habilitada. (voy a suponer que a>=0)

.data
a: .word 5
x: .word 1
y: .word 2

.code
ld r1,a(r0)
ld r2,x(r0)
ld r3,y(r0)
beqz r1,final           #si r1 es 0, salto al final
loop:   dadd r2,r2,r3   #x := x + y;
        daddi r1,r1,-1  #a := a - 1;
        bnez r1,loop
final:  halt