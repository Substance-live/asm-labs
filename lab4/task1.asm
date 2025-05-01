.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

x db 1
y db 2
z db 3
a1 db ?
a2 db ?
a3 db ?

data ends

text segment
start:

;min(x*y+z, x+y+z, x*z)

MOV AL, x
IMUL y
ADD AL, z
MOV DL, x
ADD DL, y
ADD DL, z
CMP DL, AL
JBE M1
 MOV DL, AL
M1:
MOV AL, x
IMUL Z
CMP AL, DL
JBE M2
 MOV AL, DL
M2:MOV a1, AL

;min(x, y, z)

MOV AL, x
CMP AL, y
JBE M3
 MOV AL, y
M3:
CMP AL, z
JBE M4
 MOV AL, z
M4:MOV a2, AL

;max(x+z, y+z)

MOV AL, x
CMP AL, y
JAE M5
 MOV AL, y
M5:ADD AL, Z
MOV a3, AL
    
push 0
call ExitProcess@4

text ends
end start