.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

a DB 1
b DB 2
c1 DW 15
d DB 3
e DW 2
f DW ?

data ends

text segment
start:

mov al, a
mul b
mov bx, ax
mov ax, c1
div d
mov ah, 0
add bx, ax
sub bx, e
mov f, bx

push 0
call ExitProcess@4

text ends
end start