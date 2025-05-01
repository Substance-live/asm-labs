.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

n DW 9
k DB -1

data ends

text segment
start:

MOV AX, n
mov DL, 0
L1: CMP AX, 3
JB M1
MOV CL, 3
DIV CL
CMP AH, 0
JNE FIN
INC DL
MOV AH, 0
JMP L1
M1: MOV k, DL
FIN:
    
push 0
call ExitProcess@4

text ends
end start