data segment
user db "Insert Username: $"
pass db "Insert Password: $"
user1 db "Your Username is: $"
pass1 db "Your Password is: $"
inuser db 20d dup('$')
inpass db 20d dup('$')
nl db 0ah,0dh,'$'
data ends

temp segment stack
db 200h dup (?)
temp ends

code segment
assume cs:code,ds:data,ss:temp

start:	 mov ax,data
mov ds,ax

lea dx,user
mov ah,09h
int 21h
lea bx, inuser

ekkt:	 
mov ah,01h
int 21h
cmp al,0dh
je entpass
mov [bx],al
inc bx
jmp ekkt

entpass:	lea dx,nl
mov ah,09h
int 21h

lea dx,pass
mov ah,09h
int 21h
lea bx, inpass
ekkt1:	

mov ah,07h
int 21h
cmp al,0dh
je show1
mov [bx],al
inc bx
mov dl,'*'
mov ah,02h
int 21h
jmp ekkt1

show1:	 lea dx,nl
mov ah,09h
int 21h

lea dx,user1
mov ah,09h
int 21h
lea dx,inuser
mov ah,09h
int 21h

lea dx,nl
mov ah,09h
int 21h

lea dx,pass1
mov ah,09h
int 21h
lea dx,inpass
mov ah,09h
int 21h

mov ax,4c00h
int 21h

code ends
end start