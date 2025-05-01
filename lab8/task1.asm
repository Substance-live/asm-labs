.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

row EQU 3
col EQU 4

A DW 1,2,3,4,
     3,5,2,1,
     4,3,7,0

B DW ROW DUP(?)

data ends

text segment
start:

MOV ECX, ROW
MOV ESI, 0
L2: MOV EBX, ECX
MOV ECX, COL
L1: INC A[SI]
ADD ESI, 2
LOOP L1
MOV ECX, EBX
LOOP L2

push 0
call ExitProcess@4

text ends
end start