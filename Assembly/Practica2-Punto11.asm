;11) Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en
;un registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
;presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos.

INTO EQU 24H
EOI EQU 20H
IMR EQU 21H
IDF10 EQU 5

ORG 1000H
A DB 'A'
Z DB 'Z'
LETRA DB ?

ORG 3000H
SUBABC: MOV LETRA,CL
MOV BX,OFFSET LETRA
MOV AL,1
INT 7
MOV AL,20H
OUT EOI,AL
IRET

ORG 2000H
CLI
MOV AL,IDF10
OUT INTO,AL
MOV AL,11111110B
OUT IMR,AL
MOV BX,20
MOV WORD PTR[BX],3000H
STI
INI:MOV CL,A
LOOP:INC CL
CMP CL,Z
JNZ LOOP
JMP INI
INT 0
END
