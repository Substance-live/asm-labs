.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

row EQU 3
col EQU 4

A DW 1,2,3,4,
     5,6,7,8,
     9,10,11,12

B DW ROW DUP(?)

data ends

text segment
start:

MOV ECX, col
MOV ESI, 0
MOV EDX, 0

L2: MOV EBX, ECX
MOV ECX, row
MOV EDI, 0

L1: 
;code here A[ESI][EDI]

ADD EDI, 2 * COL; A is word so *2
LOOP L1

MOV B[EDX], AX
ADD EDX, 2

ADD ESI, 2; A is word so +2
MOV ECX, EBX
LOOP L2

push 0
call ExitProcess@4

text ends
end start