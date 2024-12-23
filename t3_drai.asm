title "Tarea 3"	;codigo opcional. Descripcion breve del programa, el texto entrecomillado se imprime como cabecera en cada pagina de codigo
	.model small;directiva de modelo de memoria, small => 64KB para memoria de programa y 64KB para memoria de datos
	.386		;directiva para indicar version del procesador
	.stack 64 	;Define el tamano del segmento de stack, se mide en bytes
	.data		;Definicion del segmento de datos
num1 dw 75B9h,0E50Ah,40B7h,1D53h,078Ah,0C642h,0BF93h,6790h  ;arreglo de valores hexadeciamles de 16 bits que se guardan en memoria de datos
num2 dw 0BC40h,076Ch,85E2h,70D7h,5F31h,07E3h,75B3h,0F58Dh   ;arreglo de valores hexadeciamles de 16 bits que se guardan en memoria de datos
suma dw ?,?,?,?,?,?,?,?,?
resta dw ?,?,?,?,?,?,?,?,?   	         					;valor no inicializado pero reservado
	.code				;segmento de codigo
inicio:					;etiqueta inicio
	mov ax,@data		;AX = directiva @data, @data es una variable de sistema que contiene la direccion del segmento de datos 
	mov ds,ax			;DS = AX, inicializa segmento de datos

	mov ax,[num1]		;AX=6790h se copia al registro AX
	adc ax,[num2]  		;AX=6790h+0F58Dh suma con carry
	mov [suma],ax 		;[suma]=AX se copia el resultado de la suma a [suma]
	mov ax,[num1+2]
	adc ax,[num2+2]
	mov [suma+2],ax
	mov ax,[num1+4]
	adc ax,[num2+4]
	mov [suma+4],ax
	mov ax,[num1+6]
	adc ax,[num2+6]
	mov [suma+6],ax
	mov ax,[num1+8]
	adc ax,[num2+8]
	mov [suma+8],ax
	mov ax,[num1+10]
	adc ax,[num2+10]
	mov [suma+10],ax
	mov ax,[num1+12]
	adc ax,[num2+12]
	mov [suma+12],ax
	mov ax,[num1+14]
	adc ax,[num2+14]
	mov [suma+14],ax
	adc [suma+16],0000h ;[suma+16]=[suma+16]+0000h se suma 0 para el carry

	mov bx,[num1] 		;BX=6790h se copia al registro BX
	sbb bx,[num2]		;BX=6790h-0F58Dh resta con borrow
	mov [resta],bx		;[resta]=BX se copia el resultado de la resta a [resta]
	mov bx,[num1+2]
	sbb bx,[num2+2]
	mov [resta+2],bx
	mov bx,[num1+4]
	sbb bx,[num2+4]
	mov [resta+4],bx
	mov bx,[num1+6]
	sbb bx,[num2+6]
	mov [resta+6],bx
	mov bx,[num1+8]
	sbb bx,[num2+8]
	mov [resta+8],bx
	mov bx,[num1+10]
	sbb bx,[num2+10]
	mov [resta+10],bx
	mov bx,[num1+12]
	sbb bx,[num2+12]
	mov [resta+12],bx
	mov bx,[num1+14]
	sbb bx,[num2+14]
	mov [resta+14],bx
	sbb [resta+16],0000h ;[resta+16]=[resta+16]+0000h se resta 0 para el borrow
salir:					;inicia etiqueta salir
	mov ah,4Ch			;AH = 4Ch, opcion para terminar programa
	mov al,0        	;AL = 0, Exit Code, codigo devuelto al finalizar el programa
	int 21h	     		;señal 21h de interrupcion, pasa el control al sistema operativo
	end inicio			;fin de etiqueta inicio, fin de programa