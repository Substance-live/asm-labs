.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

data ends

text segment
start:

    a DW 1
    b DW 3
    cc DW ?

    mov AX, a
    sub AX, a
    mov cc, AX
    
    push 0
    call ExitProcess@4
text ends
end start
