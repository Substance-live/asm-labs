.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

n DB 3
F DW ?

data ends

text segment
start:

MOV ECX, 0
MOV CL, n
MOV AX, 0
MOV BX, 1

L1:
 MOV DX, BX
 ADD BX, AX
 MOV AX, DX
LOOP L1
MOV F, BX

push 0
call ExitProcess@4

text ends
end start