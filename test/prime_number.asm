.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib
    
data segment

n DW ?
ANSWER DB 1

data ends

text segment
start:

MOV DL, 2
MOV AX, n
DIV DL
MOV AL, CL
MOV BX, n
L1:
CMP DL, CL
JA FIN
 MOV AX, BX
 DIV DL
 CMP AH, 0
 JE ERR
 INC DL
 JMP L1
ERR: MOV ANSWER, 0
FIN:

push 0
call ExitProcess@4

text ends
end start