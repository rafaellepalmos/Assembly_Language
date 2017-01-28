data segment
	enternum db 'Enter number:$'
	n1 db 'one $'
	n2 db 'two $'
	n3 db 'three $'
	n4 db 'four $'
	n5 db 'five $'
	n6 db 'six $'
	n7 db 'seven $'
	n8 db 'eight $'
	n9 db 'nine $'
	n0 db 'zero $'
	n11 db 'minus $'
	n12 db 'plus $'
	n13 db 'division $'
	n14 db 'multiplication $'
	num db 20d DUP('$')
	nl db 0dh,0ah,'$'
data ends

temp segment stack
	db 200h dup(?)
temp ends

code segment
		assume cs:code, ds:data, ss:temp
		
start:  mov ax,data
		mov ds,ax
		
		lea dx,enternum
		mov ah,09h
		int 21h
		lea bx,num
	
new:	mov ah,01h
		int 21h
		
		cmp al,0dh
		je new1
		mov [bx],al
		inc bx
		jmp new
		
		
new1:	lea dx,nl
		mov ah,09h
		int 21h
		lea bx,num
		
new2:
		mov al,[bx]
		inc bx
		cmp al,'0'
		je ze
		cmp al,'1'
		je ze1
		cmp al,'2'
		je ze2
		cmp al,'3'
		je ze3
		cmp al,'4'
		je ze4
		cmp al,'5'
		je ze5
		cmp al,'6'
		je ze6
		cmp al,'7'
		je ze7
		cmp al,'8'
		je ze8
		cmp al,'9'
		je ze9
		cmp al,'+'
		je ze11
		cmp al,'-'
		je ze12
		cmp al,'*'
		je ze13
		cmp al,'/'
		je ze14
		jmp end1
		
ze:		lea dx,n0
		mov ah,09h
		int 21h
		jmp new2
		
ze1:	lea dx,n1
		mov ah,09h
		int 21h
		jmp new2
		
ze2:	lea dx,n2
		mov ah,09h
		int 21h
		jmp new2
		
ze3:	lea dx,n3
		mov ah,09h
		int 21h
		jmp new2
		
ze4:	lea dx,n4
		mov ah,09h
		int 21h
		jmp new2
		
ze5:	lea dx,n5
		mov ah,09h
		int 21h
		jmp new2
		
ze6:	lea dx,n6
		mov ah,09h
		int 21h
		jmp new2
		
ze7:	lea dx,n7
		mov ah,09h
		int 21h
		jmp new2
		
ze8:	lea dx,n8
		mov ah,09h
		int 21h
		jmp new2
		
ze9:	lea dx,n9
		mov ah,09h
		int 21h
		jmp new2
		
ze11:	lea dx,n11
		mov ah,09h
		int 21h
		jmp new2
		
ze12:	lea dx,n12
		mov ah,09h
		int 21h
		jmp new2
		
ze13:	lea dx,n13
		mov ah,09h
		int 21h
		jmp new2
		
ze14:	lea dx,n14
		mov ah,09h
		int 21h
		jmp new2
		
end1:	mov ax,4c00h
		int 21h
		
code ends
end start