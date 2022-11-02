[BITS 32]

global _start
extern c_start
extern eldenos_exit

section .asm

_start:
    call c_start
    call eldenos_exit
    ret