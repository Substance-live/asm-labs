.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

n dd 5
p dw ?

data ends

text segment
start:

MOV ECX, n
MOV DX, 0
MOV BL, 3
JCXZ fin

cycle:
 MOV AL, BL
 MUL AL
 ADD DX, AX
 ADD BL, 3
LOOP cycle

fin:
MOV p, DX
 
push 0
call ExitProcess@4

text ends
end start