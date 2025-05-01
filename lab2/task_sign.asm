.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

a DB -2
b DB 2
c1 DW 35
d DB 7
e DW -2
f DW ?

data ends

text segment
start:

mov al, a
imul b
mov bx, ax
mov ax, c1
idiv d
cbw
add bx, ax
sub bx, e
mov f, bx

push 0
call ExitProcess@4

text ends
end start