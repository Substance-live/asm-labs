.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

x db 1
y db 2
z db 3
f db ?
error db 1

data ends

text segment
start:

mov al, 4
imul y
jo fin
mov bl, z
sub bl, 2
jo fin
imul bl
jo fin
mov bl, al
cmp x, 0
je fin
mov al, x
imul al
jo fin
mov cl, al
mov ax, 3
idiv cl
add bl, al
jo fin
add bl, y
jo fin
mov f, bl
mov error, 0
fin:
    
push 0
call ExitProcess@4

text ends
end start