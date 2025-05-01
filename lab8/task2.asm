.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

row EQU 3
col EQU 3

A DW 1,0,1,
     0,0,1,
     1,0,1

B DB ROW DUP(?); (1, 3, 0)

data ends

text segment
start:

MOV ECX, col
MOV ESI, 0
MOV EDX, 0

L2: MOV EBX, ECX
MOV ECX, row
MOV EDI, 0

MOV AL, 0

L1: 
CMP A[ESI][EDI], 0
JNE SKIP
INC AL
SKIP:

ADD EDI, 2 * COL; A is word so *2
LOOP L1

MOV B[EDX], AL
INC EDX

ADD ESI, 2; A is word so +2
MOV ECX, EBX
LOOP L2

push 0
call ExitProcess@4

text ends
end start