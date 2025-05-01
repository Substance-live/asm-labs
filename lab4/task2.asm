.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

x db 14
y db ?

data ends

text segment
start:

MOV AL, x
CMP AL, -2
JLE case1

CMP AL, 14
JLE case2

CMP AL, 22
JLE case3

MOV AL, 0
JMP FIN

case1:
NEG AL
JMP FIN

case2:
MOV AL, 2
JMP FIN

case3:
NEG AL
ADD AL, 2

FIN: MOV y, AL

push 0
call ExitProcess@4

text ends
end start