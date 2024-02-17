;2) Escribir un programa que muestre en pantalla todos los caracteres disponibles en el simulador 
;MSX88, comenzando con el caracter cuyo código es el número 01H.

ORG 1000H
INI DB 01H
FIN DB FFH

ORG 2000H
MOV AL,FIN
MOV BL,INI
LOOP: INT 7
INC BL
DEC AL
CMP AL,0
JNZ LOOP
INT 0
END
