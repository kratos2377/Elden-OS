[BITS 32]

section .asm

global print:function
global eldenos_getkey:function
global eldenos_malloc:function
global eldenos_free:function
global eldenos_putchar:function
global eldenos_process_load_start:function
global eldenos_process_get_arguments:function 
global eldenos_system:function
global eldenos_exit:function

; void print(const char* filename)
print:
    push ebp
    mov ebp, esp
    push dword[ebp+8]
    mov eax, 1 ; Command print
    int 0x80
    add esp, 4
    pop ebp
    ret

; int eldenos_getkey()
eldenos_getkey:
    push ebp
    mov ebp, esp
    mov eax, 2 ; Command getkey
    int 0x80
    pop ebp
    ret

; void eldenos_putchar(char c)
eldenos_putchar:
    push ebp
    mov ebp, esp
    mov eax, 3 ; Command putchar
    push dword [ebp+8] ; Variable "c"
    int 0x80
    add esp, 4
    pop ebp
    ret

; void* eldenos_malloc(size_t size)
eldenos_malloc:
    push ebp
    mov ebp, esp
    mov eax, 4 ; Command malloc (Allocates memory for the process)
    push dword[ebp+8] ; Variable "size"
    int 0x80
    add esp, 4
    pop ebp
    ret

; void eldenos_free(void* ptr)
eldenos_free:
    push ebp
    mov ebp, esp
    mov eax, 5 ; Command 5 free (Frees the allocated memory for this process)
    push dword[ebp+8] ; Variable "ptr"
    int 0x80
    add esp, 4
    pop ebp
    ret

; void eldenos_process_load_start(const char* filename)
eldenos_process_load_start:
    push ebp
    mov ebp, esp
    mov eax, 6 ; Command 6 process load start ( stars a process )
    push dword[ebp+8] ; Variable "filename"
    int 0x80
    add esp, 4
    pop ebp
    ret

; int eldenos_system(struct command_argument* arguments)
eldenos_system:
    push ebp
    mov ebp, esp
    mov eax, 7 ; Command 7 process_system ( runs a system command based on the arguments)
    push dword[ebp+8] ; Variable "arguments"
    int 0x80
    add esp, 4
    pop ebp
    ret


; void eldenos_process_get_arguments(struct process_arguments* arguments)
eldenos_process_get_arguments:
    push ebp
    mov ebp, esp
    mov eax, 8 ; Command 8 Gets the process arguments
    push dword[ebp+8] ; Variable arguments
    int 0x80
    add esp, 4
    pop ebp
    ret

; void eldenos_exit()
eldenos_exit:
    push ebp
    mov ebp, esp
    mov eax, 9 ; Command 9 process exit
    int 0x80
    pop ebp
    ret