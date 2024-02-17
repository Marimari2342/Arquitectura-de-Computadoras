;10) Interrupción por hardware: tecla F10.
;Escribir un programa que, mientras ejecuta un lazo infinito, cuente el número de veces que se presiona la tecla F10 y
;acumule este valor en el registro DX.

INTO EQU 24H
EOI EQU 20H
IMR EQU 21H
IDF10 EQU 5

ORG 3000H
SUBRUT: INC DX
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
MOV DX,0
LOOP: JMP LOOP
INT 0
END

