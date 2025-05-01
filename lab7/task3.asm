.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

n equ 6
A dw 10, 5, -1, 5, 12, 1
max dw ?

data ends

text segment
start:

MOV ECX, n - 1
MOV ESI, 2
MOV AX, A
L1:
    CMP AX, A[ESI]
    JGE skip

    MOV AX, A[ESI]

    skip:
    ADD ESI, 2
LOOP L1
MOV max, AX

push 0
call ExitProcess@4

text ends
end start