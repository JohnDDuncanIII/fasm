format ELF64 

section '.text' executable  
public main 
extrn printf
extrn exit 

;macro for create .size constant automatically
struc db [data]{
common
. db data
.size = $ - .
}

;testing using syscall 

main:
   mov rax, 0x2000004            ; sys_write
   mov rdi, 1                    ; stdout 
   mov rsi, qword msgHelloWorld  ; string
   mov rdx, msgHelloWorld.size   ; length
   syscall
   mov rax, 0x2000001            ; sys_exit
   xor rdi, rdi                  ; exit code
   syscall


section '.data' writeable  
msgHelloWorld db 'Hello 64bit World from FASM!',0x0A,0
