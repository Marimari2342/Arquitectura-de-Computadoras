;1)Implementar un programa en el lenguaje assembler del simulador MSX88 que muestre en la pantalla de comandos un
mensaje previamente almacenado en memoria de datos, aplicando la interrupción por software INT 7.

ORG 1000H
MSJ DB "ARQUITECTURA DE COMPUTADORAS-"
RENG2 DB "FACULTAD DE INFORMATICA-"
RENG3 DB 55H
DB 4EH
DB 4CH
DB 50H
FIN DB ?

ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET RENG2-OFFSET MSJ
INT 7
MOV BX, OFFSET RENG2
MOV AL, OFFSET RENG3-OFFSET RENG2
INT 7
MOV BX, OFFSET RENG3
MOV AL, OFFSET FIN-OFFSET RENG3
INT 7
INT 0
END