.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

n equ 6
A dw 1, 2, 3, 4, 5, 6

data ends

text segment
start:

MOV ECX, n
MOV ESI, 0
MOV BX, 2
L1:
    MOV AX, A[ESI] 
    TEST AX, 1
    JZ ev
        MUL BX
        JMP edge
    ev:
        DIV BL
        MOV AH, 0
    edge:
    MOV A[ESI], AX
    ADD ESI, 2
LOOP L1

push 0
call ExitProcess@4

text ends
end start