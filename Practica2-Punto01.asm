;1)Implementar un programa en el lenguaje assembler del simulador MSX88 que muestre en la pantalla de comandos un 
;mensaje previamente almacenado en memoria de datos, aplicando la interrupción por software INT 7.

ORG 1000H
MSJ DB "ARQUITECTURA DE COMPUTADORAS"
SALTO_UNO DB 0AH
RENG2 DB "FACULTAD DE INFORMATICA"
SALTO_DOS DB 0AH
RENG3 DB 55H
      DB 4EH
      DB 4CH
      DB 50H
FIN DB ?

ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
INT 0
END
