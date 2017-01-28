data segment
	entername DB 'Enter your name:$'
	enterlast DB 'Enter your last name:$'
	enterid DB 'Enter your ID number:$'
	enterfac DB 'Enter your faculty:$'
	name1 DB 'Name:$'
	last db 'Last name:$'
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
		mov cl,al
		
		mov ah,01h
		int 21h
		
		sub al,30h
		add cl,al
		
		mov dl,cl
		mov ah,02h
		int 21h
		
		mov ax,4c00h
		int 21h
		
code ends
end start