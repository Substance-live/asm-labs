.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

x DW 12
y DW 15
z DD ?

data ends

text segment
start:

    mov AX, x
    mul y
    
    
    push 0
    call ExitProcess@4
text ends
end start
