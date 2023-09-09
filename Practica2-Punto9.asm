;9) Escribir un programa que aguarde el ingreso de una clave de cuatro caracteres por teclado sin visualizarla en pantalla. En
;caso de coincidir con una clave predefinida (y guardada en memoria) que muestre el mensaje "Acceso permitido", caso
;contrario el mensaje "Acceso denegado".

ORG 1000H
MJE DB "INGRESE CLAVE XXXX"
SALTO DB 0AH
FIN_MJE DB ?
MJE_SI DB "ACCESO PERMITIDO"
FIN_SI DB ?
MJE_NO DB "ACCESO DENEGADO"
FIN_NO DB ?
CLAVE DB "1234"
CLAVE_ING DB ?

ORG 3000H
SUBRUT:	PUSH AX
	PUSH BX

	MOV BX, OFFSET CLAVE
	MOV CL,4
LOOP: 	MOV DH,[BX]
	ADD BX,4
	CMP DH,[BX]
	JNZ FIN_UN
	SUB BX,3
	DEC CL
	JNZ LOOP 
	MOV BX, OFFSET MJE_SI
	MOV AL, OFFSET FIN_SI - OFFSET MJE_SI
	INT 7
	JMP FINAL
FIN_UN: MOV BX, OFFSET MJE_NO
	MOV AL, OFFSET FIN_NO - OFFSET MJE_NO
	INT 7

FINAL: 	POP BX
	POP AX
	RET

ORG 2000H
	MOV BX, OFFSET MJE
	MOV AL, OFFSET FIN_MJE - OFFSET MJE
	INT 7
	MOV BX, OFFSET CLAVE_ING
	MOV AL,4
LOOP_B: INT 6	; con este LOOP lo que hago es escribir una cadena de caracteres
	INC BX
	DEC AL
	JNZ LOOP_DOS
	CALL SUBRUT
	INT 0
	END
