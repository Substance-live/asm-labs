.586
.model flat, stdcall
.stack 4096

includelib c:\masm32\lib\kernel32.lib
ExitProcess proto :DWORD

.data
n1 equ 7
n2 equ 5
a1 DB 1,0,2,4,5,7,-1; -> -2,0,2,4,2,4,-4
a2 DB 0,0,11,10,99; -> 0,0,8,10,96

.code
;уменьшить на 3 каждый нечетный элемент
main:
    LEA EAX, a1
    PUSH EAX
    PUSH n1
    CALL pr

    LEA EAX, a2
    PUSH EAX
    PUSH n2
    CALL pr

    push 0
    call ExitProcess

; AX = 2 * BL + 3 * BH
pr proc
    PUSH EBP
    MOV EBP, ESP

    PUSH EDX
    PUSH EBX
    PUSH ECX
    PUSH EAX

    MOV EBX, 0
    MOV ECX, [EBP+8]
    MOV EAX, [EBP+12]

    prL1:
    TEST BYTE PTR [EAX+EBX], 1b
    JZ next

    MOV DL, [EAX+EBX]
    SUB DL, 3
    MOV [EAX+EBX], DL

    next:
    INC EBX
    LOOP prL1

    POP EAX
    POP ECX
    POP EBX
    POP EDX

    POP EBP
    RET 8
pr endp

end main
