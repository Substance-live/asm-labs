.586
.model flat, stdcall
.stack 4096

includelib c:\masm32\lib\kernel32.lib
ExitProcess proto :DWORD

.data
x DB 5
y DB 5
z DW ?

.code

main:
    
    push 0
    call ExitProcess

; AX = 2 * BL + 3 * BH
pr proc
    MOV AL, 2
    IMUL BL
    MOV DX, AX
    MOV AL, 3
    IMUL BH
    ADD AX, DX
pr endp

end main
