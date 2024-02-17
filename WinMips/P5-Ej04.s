#4) El índice de masa corporal (IMC) es una medida de asociación entre 
#el peso y la talla de un individuo. Se calcula a partir del peso 
#en kg y la estatura en metros, usando la fórmula: IMC = peso/(est)^2
#De acuerdo al valor calculado con este índice, puede clasificarse el 
#estado nutricional de una persona en:Infrapeso (IMC < 18,5), Normal
#(18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30).
#Escriba un programa que dado el peso y la estatura de una persona
#calcule su IMC y lo guarde en la dirección etiquetada IMC. 
#También deberá guardar en la dirección etiquetada estado un valor
#según la siguiente tabla: < 18,5 Infrapeso 1 | < 25 Normal 2
#                          < 30 Sobrepeso 3   | ≥ 30 Obeso 4

.data
peso:   .double 47.5
altura: .double 1.58
IMC:    .double 0.0
estado: .word 0
infrap: .double 18.5
norml: .double 25.0
sobrp:  .double 30.0

.code
l.d f1, peso(r0)
l.d f2, altura(r0)
#calcular IMC
mul.d f3,f2,f2
div.d f3,f1,f3
s.d f3, IMC(r0)
#verificar estado
l.d f4, infrap(r0)          #Infrapeso
c.lt.d f3,f4     
bc1f normal
daddi r3,r0,1
j final
normal: l.d f4, norml(r0)   #Normal
        c.lt.d f3,f4     
        bc1f sobrep
        daddi r3,r0,2
        j final
sobrep: l.d f4, sobrp(r0)   #Sobrepeso
        c.lt.d f3,f4    
        bc1f obeso
        daddi r3,r0,3
        j final
obeso:  daddi r3,r0,4       #Obeso
final:  sd r3,estado(r0)
halt