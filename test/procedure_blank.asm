.586
.model flat, stdcall
.stack 4096

includelib c:\masm32\lib\kernel32.lib
ExitProcess proto :DWORD

.data


.code

main:
    
    push 0
    call ExitProcess

pr proc
    
pr endp

end main
