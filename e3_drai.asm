title "ejercicio 3"
	.model small
	.386
	.stack 64
	.data
x 	dw		-132d
y 	dw		120d
res1	dw		?
res2	dw		?
res3	dw		?
	.code
inicio:
	mov ax,@data
	mov ds,ax

	mov ax, 53d
	sub ax, 35d
	mov cx, x
	add cx, y
	sub cx, ax
	mov [res1], cx

	mov ax,[res1]
	add ax,1
	mov [res2],ax
	
	mov ax,[res2]
	sub ax,1
	mov [res3],ax

salir:
	mov ah,4Ch
	mov al,0
	int 21h	
	end inicio