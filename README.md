Пример задачи
```asm
.586
.model flat, stdcall

extern ExitProcess@4:near

includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\kernel32.lib

data segment

data ends

text segment
start:



push 0
call ExitProcess@4

text ends
end start
```
