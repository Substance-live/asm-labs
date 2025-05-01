.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

s db ?
n dw 4

data ends

text segment
start:

MOV AL, 0
MOV BL, 1
MOV CX, n
cycle:
CMP CX, 0
JE fin
ADD AL, BL
ADD BL, 2
DEC CX
JMP cycle
fin:
MOV s, AL

push 0
call ExitProcess@4

text ends
end start