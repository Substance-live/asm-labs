.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

F DW 1

data ends

text segment
start:

MOV AX, 0
MOV BX, 1

L1:
 CMP BX, 10000
 JA FIN
 MOV DX, BX
 ADD BX, AX
 MOV AX, DX
 JMP L1
FIN: MOV F, BX

push 0
call ExitProcess@4

text ends
end start