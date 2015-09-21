format ELF 
section '.text' executable  
public main 
extrn printf
extrn exit 
struc db [data]
     {
       common
        . db data
        .size = $ - .
     }

main:  
push  ebp  
mov   ebp, esp  
push  ebx  
mov  ebx, esp  
and  esp, 0xfffffff0  
sub  esp, 12  
push ebx  
add  esp, 16  

mov  dword [esp], msgHelloWorld  
call printf  

sub esp, 16  
pop ebx  
mov esp, ebx  
pop ebx  
mov esp, ebp  
pop ebp  
mov eax, 0  
ret
section '.data' writeable  
msgHelloWorld db 'Hello world from FASM!',0xA,0