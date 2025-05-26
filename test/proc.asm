.586
.model flat, stdcall
.stack 4096

includelib c:\masm32\lib\kernel32.lib
ExitProcess proto :DWORD

.data 
a DW 11
b DW 22
c1 DW 0

.code

main:
 push dword ptr a 
 push dword ptr b
 call pr
 mov c1, ax

 push 0
 call ExitProcess

pr proc
 push ebp
 mov ebp, esp
 push edx

 mov dx, [ebp+8]
 mov ax, [ebp+12] 
 add ax, dx

 pop edx
 pop ebp
 ret 8
pr endp

end main

