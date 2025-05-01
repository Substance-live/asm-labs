.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

n equ 7
A db 1, 5, 2, 6, 7, -1, 10
s db ?

data ends

text segment
start:

MOV ECX, n
MOV ESI, 0
MOV AL, 0
L1:
CMP A[ESI], 4
JLE skip
INC AL
skip:
INC ESI
LOOP L1
MOV s, AL

push 0
call ExitProcess@4

text ends
end start