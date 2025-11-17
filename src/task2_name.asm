; task2_name.asm
; Reads name (string) and an integer count, validates (50 < count < 100)
; prints welcome message count times. Simple implementation using C's scanf/printf via asm_io.

%include "asm_io.inc"

section .bss
    name_buf resb  128

section .data
    prompt_name db "Enter your name: ",0
    prompt_count db "Enter number of times (51-99): ",0
    err_msg db "Error: number too large or too small",0
    welcome_msg db "Welcome, %s",10,0

section .text
    global asm_main_name

extern _scanf
extern _printf

asm_main_name:
    push    ebp
    mov     ebp, esp

    ; ask for name (use scanf "%s")
    lea     eax, [prompt_name]
    call    print_string

    ; call scanf("%s", name_buf)
    push    name_buf
    push    dword string_format   ; "%s" defined inside asm_io.asm's data; but safer to use _scanf directly
    call    _scanf
    add     esp, 8

    ; ask for count
    lea     eax, [prompt_count]
    call    print_string

    ; read integer into [ebp-4]
    sub     esp, 8
    lea     eax, [ebp-4]
    push    eax
    push    dword int_format
    call    _scanf
    add     esp, 8
    mov     eax, [ebp-4]   ; count

    ; validate count: 50 < count < 100
    cmp     eax, 50
    jle     .invalid
    cmp     eax, 100
    jge     .invalid

    ; loop printing welcome message count times
    mov     ecx, eax
.print_loop:
    push    name_buf
    push    dword welcome_msg
    call    _printf
    add     esp, 8
    loop    .print_loop

    ; success, return 0
    mov     eax, 0
    jmp     .done

.invalid:
    lea     eax, [err_msg]
    call    print_string
    mov     eax, 1

.done:
    mov     esp, ebp
    pop     ebp
    ret
