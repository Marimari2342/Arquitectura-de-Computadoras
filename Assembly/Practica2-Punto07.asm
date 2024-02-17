;7) * Escribir un programa que efectúe la suma de dos números (de un dígito cada uno) ingresados por teclado y muestre el
;resultado en la pantalla de comandos. Recordar que el código de cada caracter ingresado no coincide con el número que
;representa y que el resultado puede necesitar ser expresado con 2 dígitos.

ORG 1000H
MJE DB "INGRESE DOS NUMEROS DE UN DIGITO"
SALTO DB 0AH
FIN DB ?
MJE_RES DB "SUMA: "
RES_D DB "0"
RES_U DB ?
FIN_RES DB ?
NUM1 DB ?
NUM2 DB ?

ORG 3000H
SUMA: ADD DL,DH
CMP DL, 10
JS FINAL
SUB DL,10
INC RES_D
FINAL: ADD DL,30H
MOV RES_U,DL
RET 

ORG 2000H
MOV BX, OFFSET MJE
MOV AL, OFFSET FIN - OFFSET MJE
INT 7
MOV BX, OFFSET NUM1
INT 6
MOV BX, OFFSET NUM2
INT 6
MOV DL, NUM1
SUB DL, 30H
MOV DH, NUM2
SUB DH, 30H
CALL SUMA
MOV BX, OFFSET MJE_RES
MOV AL, OFFSET FIN_RES - OFFSET MJE_RES
INT 7
INT 0
END
