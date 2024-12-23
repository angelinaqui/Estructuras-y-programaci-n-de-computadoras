title "ejercicio 7"
	.model small
	.386
	.stack 64
	.data
cadena db 	"Convertir ABCD a abcd y Viceversa #@",0Dh,0Ah,"$"
 	.code
inicio:
	mov ax,@data
	mov ds,ax

	mov di, 0d
flujo:
	cmp [cadena+di],41h
	jae mayus
repet: 
	inc di
	cmp [cadena+di],0Dh
	jne flujo
	jmp terminar

mayus:
	cmp [cadena+di],61h
	jae minus
	cmp [cadena+di],5Bh
	jae repet
	mov al, 40h
valAL:
	add al,1h
	cmp al,[cadena+di]
	jne salto
	mov dl,[cadena+di] 
	add dl,20h
	mov [cadena+di],dl
	jmp repet
salto:
	cmp al,5Ah
	jne valAL
	jmp repet

minus:
	cmp [cadena+di],7Bh
	jae repet
	mov al, 60h
valAL2:
	add al,1h
	cmp al,[cadena+di]
	jne salto2
	mov dl,[cadena+di] 
	sub dl,20h
	mov [cadena+di],dl
	jmp repet
salto2:
	cmp al,7Ah
	jne valAL2
	jmp repet

terminar: 

salir:
	mov ah,4Ch
	mov al,0
	int 21h	
	end inicio