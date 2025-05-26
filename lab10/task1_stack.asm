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
    PUSH EBX
    CALL pr

    CMP AX, 5
    JL second

    ADD BL, 2
    DEC BH
    PUSH EBX
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
    PUSH EBP
    MOV EBP, ESP

    PUSH EDX

    MOV AL, 2
    IMUL BYTE PTR [EBP+8]
    MOV DX, AX
    MOV AL, 3
    IMUL BYTE PTR [EBP+9]
    ADD AX, DX

    POP EDX
    
    POP EBP
    RET 4
pr endp

end main
