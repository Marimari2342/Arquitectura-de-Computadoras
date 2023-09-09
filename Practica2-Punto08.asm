;8) Escribir un programa que efectúe la resta de dos números (de un dígito cada uno) ingresados por teclado y muestre el
;resultado en la pantalla de comandos. Antes de visualizarlo el programa debe verificar si el resultado es positivo o negativo
;y anteponer al valor el signo correspondiente.

ORG 1000H
NUM1 DB ?
NUM2 DB ?
RES DB ?
MJE DB "INGRESE DOS NUMEROS "
NEGA DB "-"

ORG 3000H
RESTA:
MOV CH,NUM1
MOV CL,NUM2
CMP CH,CL
JS SALTO
SUB CH,CL
MOV RES,CH
JMP FIN
SALTO: SUB CL,CH
MOV BX,OFFSET NEGA
MOV AL,1
INT 7
MOV RES,CL
FIN:
ADD RES,30H
MOV BX,OFFSET RES
MOV AL,1
INT 7
RET

ORG 2000H
MOV BX, OFFSET MJE 
MOV AL, OFFSET NEGA - OFFSET MJE
INT 7
MOV BX, OFFSET NUM1
INT 6
MOV BX, OFFSET NUM2
INT 6
CALL RESTA
INT 0
END
