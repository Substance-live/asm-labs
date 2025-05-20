.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

row EQU 3
col EQU 4

A DW 1,2,3,1,
     4,5,6,2,
     7,8,9,3

B DW ROW DUP(?); (7, 17, 27)

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

MOV AX, 0

L1: 
ADD AX, A[ESI][EDI]

ADD ESI, 2; A is word so +2
LOOP L1

MOV B[EDX], AX
ADD EDX, 2

ADD EDI, col * 2
MOV ECX, EBX
LOOP L2

push 0
call ExitProcess@4

text ends
end start