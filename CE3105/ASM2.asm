data segment
	zero DB '0$'
	one DB '5$'
	two DB '10$'
	three DB '15$'
	four DB '20$'
	five DB '25$'
	six DB '30$'
	seven DB '35$'
	eight DB '40$'
	nine DB '45$'
	id db 'ID:$'
	fac db 'Faculty:$'
	name2 DB 20d DUP ('$')
	last2 DB 20d DUP ('$')
	id2 DB 20d DUP ('$')
	fac2 DB 20d DUP ('$')
	nl DB 0ah,0dh,('$')
data ends

temp segment stack
	db 200h dup(?)
temp ends

code segment
		assume cs:code, ds:data, ss:temp

start:  mov ax,data
		mov ds,ax
		
		mov ah,01h
		int 21h
		
		cmp al,30h
		je zero1
		cmp al,31h
		je one1
		cmp al,32h
		je two1
		cmp al,33h
		je three1
		cmp al,34h
		je four1
		cmp al,35h
		je five1
		cmp al,36h
		je six1
		cmp al,37h
		je seven1
		cmp al,38h
		je eight1
		cmp al,39h
		je nine1
		
zero1:	lea dx,zero
		mov ah,09h
		int 21h
		jmp done
		
one1:	lea dx,one
		mov ah,09h
		int 21h
		jmp done
		
two1:	lea dx,two
		mov ah,09h
		int 21h
		jmp done
		
three1:	lea dx,three
		mov ah,09h
		int 21h
		jmp done
		
four1:	lea dx,four
		mov ah,09h
		int 21h
		jmp done
		
five1:	lea dx,five
		mov ah,09h
		int 21h
		jmp done
		
six1:	lea dx,six
		mov ah,09h
		int 21h
		jmp done
		
seven1:	lea dx,seven
		mov ah,09h
		int 21h
		jmp done
		
eight1:	lea dx,eight
		mov ah,09h
		int 21h
		jmp done
		
nine1:	lea dx,nine
		mov ah,09h
		int 21h
		jmp done
		
done:	mov ax,4c00h
		int 21h
		
code ends
end start