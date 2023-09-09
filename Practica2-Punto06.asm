;6) * Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado y muestre en pantalla dicho
;número expresado en letras. Luego que solicite el ingreso de otro y así sucesivamente. Se debe finalizar la ejecución al
;ingresarse en dos vueltas consecutivas el número cero.

ORG 1000H
CERO 	DB "CERO  "
	DB "UNO   "
	DB "DOS   "
	DB "TRES  "
	DB "CUATRO"
	DB "CINCO "
	DB "SEIS  "
	DB "SIETE "
	DB "OCHO  "
	DB "NUEVE "
MJE DB 	"INGRESE UN NUMERO DEL 0 AL 9: "
SALTO_RENG DB 0AH
FIN DB ?
NUM DB ?

ORG 2000H
	MOV CL,0		;contador de 0
INICIO:	MOV BX, OFFSET MJE
	MOV AL, OFFSET FIN - OFFSET MJE
	INT 7
	MOV BX, OFFSET NUM	;guardo un numero en NUM
	INT 6
	MOV CH,30H
	CMP NUM,CH
	JNZ SALTO
	INC CL
	JMP SIGO
SALTO:	MOV CL,0
SIGO:	MOV BX,OFFSET CERO
	MOV AL,6
LOOP:	CMP NUM,CH
	JZ IMPRIM
	INC CH
	ADD BX,6
	JMP LOOP
IMPRIM:	INT 7
	MOV BX,OFFSET SALTO_RENG
	MOV AL,1
	INT 7
	CMP CL,2
	JNZ INICIO
	INT 0
	END
