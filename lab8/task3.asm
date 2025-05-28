.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

row EQU 3
col EQU 4

A DB 1,0,1,1,
     0,0,0,0,
     1,1,1,1

B DB ROW DUP(0); 1,0,1

data ends

text segment
start:

MOV ECX, row
MOV EDI, 0
MOV EDX, 0

L2: 
MOV EBX, ECX
MOV ECX, col
MOV ESI, 0

L1: 
CMP A[ESI][EDI], 0
JE ZERO
INC B[EDX]
jmp SKIP
ZERO:

INC ESI
LOOP L1

SKIP:

INC EDX

ADD EDI, col
MOV ECX, EBX
LOOP L2

push 0
call ExitProcess@4

text ends
end start