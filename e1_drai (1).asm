title "ejercicio 1"
	.model small
	.386
	.stack 64
	.data
hola 	db	173d,"Hola! $"
eje 	db	0Ah,0dh,"Este es un ejercicio de programaci",162d,"n en lenguaje ensamblador. $"
imp 	db	0Ah,0dh,173d,"Ya s",130d, " imprimir en pantalla! =) $"
F 		db 	0Ah,0dh,"Fin. $"
	.code
inicio:
	mov ax,@data
	mov ds,ax

	lea dx,[hola]
	mov ax,0900h
	int 21h

	lea dx,[eje]
	mov ax,0900h
	int 21h

	lea dx,[imp]
	mov ax,0900h
	int 21h

	lea dx,[F]
	mov ax,0900h
	int 21h

salir:
	mov ah,4Ch
	mov al,0
	int 21h	
	end inicio