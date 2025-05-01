.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

x db 1
y db 2
u db -3

data ends

text segment
start:

CMP y, 1
JL fail

MOV AL, x

ADD AL, 16
CMP AL, y
JL fail

MOV AL, x
IMUL AL
MOV BX, AX
MOV AL, y
SUB AL, 8
IMUL AL
ADD AX, BX

CMP AL, 64
JLE fin

fail: 
MOV AL, y
MOV u, AL
FIN:
    
push 0
call ExitProcess@4

text ends
end start