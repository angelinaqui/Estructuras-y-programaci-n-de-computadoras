title "Tarea 4"	;codigo opcional. Descripcion breve del programa, el texto entrecomillado se imprime como cabecera en cada pagina de codigo
	.model small;directiva de modelo de memoria, small => 64KB para memoria de programa y 64KB para memoria de datos
	.386		;directiva para indicar version del procesador
	.stack 64 	;Define el tamano del segmento de stack, se mide en bytes
	.data		;Definicion del segmento de datos
x 	dw		00d
y 	dw		01d
espacio 	db	 0Ah,0dh,"$"
	.code				;segmento de codigo
inicio:					;etiqueta inicio
	mov ax,@data		;AX = directiva @data, @data es una variable de sistema que contiene la direccion del segmento de datos 
	mov ds,ax			;DS = AX, inicializa segmento de datos

	mov bx,x  			;bx=x=0
	call IMPRIME_BX     ;imprime el primer valor
	lea dx,[espacio]    
	mov ax,0900h
	int 21h   			;imprime un espacio entre un valor y el siguiente
	mov bx,y  			;bx=y=1
	call IMPRIME_BX     ;imprime el segundo valor
	lea dx,[espacio]
	mov ax,0900h
	int 21h
	mov cx, 20d 
loop1:
	mov dx,x 			;dx=x, guarda el primer valor
	mov ax,y
	mov x,ax      		;x=ax=y, asigna un nuevo primer valor a partir del segundo
	add y,dx			;y=y+dx, realiza la suma del primer valor y el segundo
	mov bx,y
	call IMPRIME_BX     ;imprime el valor obtenido de la suma
	lea dx,[espacio]
	mov ax,0900h
	int 21h  		
	loop loop1

salir:					;inicia etiqueta salir
	mov ah,4Ch			;AH = 4Ch, opcion para terminar programa
	mov al,0        	;AL = 0, Exit Code, codigo devuelto al finalizar el programa
	int 21h	     		;señal 21h de interrupcion, pasa el control al sistema operativo
IMPRIME_BX proc
        mov bp,sp         ;apuntadores de la pila igualados, para saber en dónde comienza la pila dentro del procedimiento
        mov ax,bx         ;se guarda BX en AX, ya no se necesita el valor de BX...
        mov bx,10         ;se reutiliza BX y se inicializa con 10 decimal
    separa_digitos:    
    ;cada dígito se obtiene con una división entre 10, se guarda en la pila
        xor dx,dx         ;limpia registro DX para división de 16 bits
        div bx             ;división entre 10, es de 16 bits
        push dx             ;almacena el dígito obtenido en el residuo dentro de la pila
        cmp ax,0             ;compara si el cociente de la división es 0, es el punto de quiebre del ciclo
        jne separa_digitos     ;mientras el cociente sea distinto de 0, aún hay dígitos por obtener
        mov ah,02h     ;prepara AH para int 21h con opción 02h
    imprime_digitos:
        ;cada dígito almacenado en la pila se saca, se calcula su ASCII y se imprime en pantalla
        pop dx        ;Cada dígito es menor a 10, así que cabe en DL y DH=00h
        or dl,30h    ;Se obtiene el ASCII del dígito
        int 21h     ;imprime el carácter ASCII que está en DL en pantalla
        cmp sp,bp     ;compara si SP apunta a BP, para revisar si la pila se ha "vaciado" (relativo a este procedimiento)
        jne imprime_digitos     ;si la pila aún tiene dígitos a imprimir, salta a la etiqueta
        ret
    endp
    end inicio			;fin de etiqueta inicio, fin de programa