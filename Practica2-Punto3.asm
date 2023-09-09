;3) * Escribir un programa que muestre en pantalla las letras del abecedario, sin espacios, intercalando mayúsculas y
;minúsculas (AaBb…), sin incluir texto en la memoria de datos del programa. Tener en cuenta que el código de “A” es 41H,
;el de “a” es 61H y que el resto de los códigos son correlativos según el abecedario.

ORG 1000H
PRI_MAY DB 'A'
PRI_MIN DB 'a'
UL_MIN DB 'z'

ORG 2000H
MOV CL,UL_MIN
INC CL        ;así en CL tengo guardado el codigo ASCII del caracter que sigue a 'z'
MOV BX, OFFSET PRI_MAY
MOV AL,2      ;así imprime primero la mayuscula y luego la minúscula, que están seguidas en la declaración de variables
LOOP:INT 7
INC PRI_MAY
INC PRI_MIN
CMP PRI_MIN,CL
JS LOOP
INT 0
END
