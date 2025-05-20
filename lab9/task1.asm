.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

a dw 2
b dw 6
; y=-2

; a dw 20
; b dw 2
; y=49

y dw ?

data ends

text segment
start:

MOV AX, a
CMP AX, b
JG L1

; 3,5a - 1,5b if a <= b
MOV BX, a
MOV AX, BX
SAL BX, 1
ADD AX, BX
SAR BX, 2
ADD AX, BX

MOV BX, b
SUB AX, BX
SAR BX, 1
SUB AX, BX

JMP FIN
L1:
; 2,5a - o,5b if a > b
MOV AX, a
MOV BX, AX
SAL AX, 1
SAR BX, 1
ADD AX, BX
MOV BX, b
SAR BX, 1
SUB AX, BX

FIN:
MOV y, AX

push 0
call ExitProcess@4

text ends
end start