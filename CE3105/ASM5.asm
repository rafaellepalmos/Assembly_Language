data segment

data ends

temp segment stack
		db 200h DUP (?)
temp ends
		
code segment
	assume cs:code, ds:data, ss:temp
	
main proc far
start:	mov ax,data
		mov ds,ax
		
		Xor ax,ax
		mov al,99d
		mov cl,10d
		div cl
		mov cl,ah
		
		mov dl,al
		add dl,30h
		mov ah,02h
		int 21h
		
		XOR dx,dx
		mov dl,cl
		add dl,30h
		mov ah,02h
		int 21h
		
		mov ax,4c00h
		int 21h
		
main endp
		
code ends
end main