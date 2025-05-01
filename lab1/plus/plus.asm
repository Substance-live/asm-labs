.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

a DB ?

data ends

text segment
start:

    mov AL, 1
    mov BL, 2
    add AL, BL
    mov a, AL
    cbw
    
    push 0
    call ExitProcess@4
text ends
end start