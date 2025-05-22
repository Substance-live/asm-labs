.586
.model flat, stdcall
.stack 4096

includelib c:\masm32\lib\kernel32.lib
ExitProcess proto :DWORD

.data
x DB 2
y DB 2
z DW ?

.code

main:
    MOV BL, x
    MOV BH, y
    CALL pr
    CMP AX, 5
    JL second

    SUB BL, 2
    INC BH
    CALL pr
    JMP fin

    second:
    ADD AX, 3

    fin:
    MOV z, AX

    push 0
    call ExitProcess

; AX = 2 * BL + 3 * BH
pr proc
    PUSH DX

    MOV AL, 2
    IMUL BL
    MOV DX, AX
    MOV AL, 3
    IMUL BH
    ADD AX, DX

    POP DX
    RET
pr endp

end main
