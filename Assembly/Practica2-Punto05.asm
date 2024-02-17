;5) Modificar el programa anterior agregando una subrutina llamada ES_NUM que verifique si el caracter ingresado es realmente un número.
;De no serlo, el programa debe mostrar el mensaje “CARACTER NO VALIDO”. La subrutina debe recibir el código del caracter por referencia 
;desde el programa principal y debe devolver vía registro el valor 0FFH en caso de tratarse de un número o el valor 00H en caso contrario. 
;Tener en cuenta que el código del “0” es 30H y el del “9” es 39H.

ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN DB ?

ORG 1500H
NUM DB ?

ORG 3000H
ES_NUM: CMP [BX],30H
JS FIN
CMP [BX],39H
JNS FIN
MOV DL,OOH
JMP FINAL
FIN: MOV DL,0FFH
FINAL: RET
 
ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
MOV BX, OFFSET NUM
INT 6
MOV AL, 1
INT 7
MOV CL, NUM
MOV BX, OFFSET NUM
CALL ES_NUM
INT 0
END
