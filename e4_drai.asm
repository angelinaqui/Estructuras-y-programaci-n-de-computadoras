title "ejercicio 4"
	.model small
	.386
	.stack 64
	.data
x 	db		60d
y 	db		162d
res1	dw		?
res2	dw		?
res3	dw		?
res4	dw		?
z 		dw 		?	
	.code
inicio:
	mov ax,@data
	mov ds,ax

	mov al,x  
	mul x	  
	mov bx,06	
	mul bx    
	mov [res1],ax

	mov al,12
	mul y
	mov cx,5
	div cx
	mov [res2],ax

	mov al,x
	mul y
	mov [res3],ax

	mov al,15
	mul x
	mov [res4],ax

	mov cx,[res1]
	sub cx,[res2]
	sub cx,[res3]
	add cx,[res4]
	sub cx,3000
	mov z,cx
salir:
	mov ah,4Ch
	mov al,0
	int 21h	
	end inicio