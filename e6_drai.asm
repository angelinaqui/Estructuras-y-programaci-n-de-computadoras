title "ejercicio 6"
	.model small
	.386
	.stack 64
	.data
x 	db		74d
y 	db		57d
mayors 	db		"El primer n",163d,"mero es mayor al segundo",0Dh,0Ah,"$"
mayorp 	db		"El segundo n",163d,"mero es mayor al primero",0Dh,0Ah,"$"
igual  	db		"Los dos n",163d,"meros son iguales",0Dh,0Ah,"$"
	.code
inicio:
	mov ax,@data
	mov ds,ax

	mov al,x
	mov bl,y
	cmp al,bl
	jae flujo1
	lea dx,[mayorp]
	mov ax,0900h
	int 21h	
	jmp flujo3
flujo1:
	cmp al,bl
	je flujo2
	lea dx,[mayors]
	mov ax,0900h
	int 21h
	jmp flujo3
flujo2:
	lea dx,[igual]
	mov ax,0900h
	int 21h
flujo3:
salir:
	mov ah,4Ch
	mov al,0
	int 21h	
	end inicio