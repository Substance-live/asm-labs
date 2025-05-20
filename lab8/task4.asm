.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

row EQU 4
col EQU 3

A DB 1,6,7,
     2,5,9,
     3,4,8,
     2,5,8

B DB ROW DUP(?); 3,6,9

data ends

text segment
start:

MOV ECX, col
MOV ESI, 0
MOV EDX, 0

L2: MOV EBX, ECX
MOV ECX, row
MOV EDI, col

MOV AL, A[ESI]

L1: 
CMP AL, A[ESI][EDI]
JGE PASS
MOV AL, A[ESI][EDI]
PASS:

ADD EDI, col
LOOP L1

MOV B[EDX], AL
INC EDX

INC ESI
MOV ECX, EBX
LOOP L2

push 0
call ExitProcess@4

text ends
end start