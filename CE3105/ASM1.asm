data segment
	a DB 'Enter User name:$'
	b DB 'Enter Password:$'
	c DB 'Your User name:$'
	d DB 'Your Password:$'
	only1 DB 'Enter only Number!!!$'
	enter1 db 'Enter Your Score:$'
	nl DB 0ah,0dh,'$'
	name1 db 15d DUP ('$')
	pass1 db 15d DUP ('$')
data ends

temp segment stack
	db 200h dup(?)
temp ends

code segment
		assume cs:code, ds:data, ss:temp
		
start:  mov ax,data
		mov ds,ax
		
		lea dx,a
		mov ah,09h
		int 21h
		
		lea bx,name1
user:	mov ah,01h
		int 21h
		cmp al,0dh
		je next
		mov [BX],al
		inc bx
		jmp user
		
next:	lea dx,nl
		mov ah,09h
		int 21h
		lea dx,b
		mov ah,09h
		int 21h
		
		lea bx,pass1
pass:	mov ah,07h
		int 21h
		cmp al,0dh
		je next1
		mov [bx],al
		inc bx
		mov dl,'*'
		mov ah,02h
		int 21h
		jmp pass
		
next1:	lea dx,nl
		mov ah,09h
		int 21h
		lea dx,c
		mov ah,09h
		int 21h
		lea dx,name1
		mov ah,09h
		int 21h
		
		lea dx,nl
		mov ah,09h
		int 21h
		lea dx,d
		mov ah,09h
		int 21h
		lea dx,pass1
		mov ah,09h
		int 21h
		
		mov ax,4c00h
		int 21h
		
code ends
end start