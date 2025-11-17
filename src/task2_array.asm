; task2_array.asm
; Creates array 1..100, sums and prints the sum

%include "asm_io.inc"

section .data
    arr_times dd 100
    msg db "Array sum = ",0

section .bss
    arr resd 100

section .text
    global asm_main_array

asm_main_array:
    push    ebp
    mov     ebp, esp

    ; initialize array with 1..100
    mov     ecx, 100
    xor     esi, esi
    mov     ebx, 1
.init_loop:
    mov     [arr + esi*4], ebx
    inc     esi
    inc     ebx
    loop    .init_loop

    ; sum
    mov     ecx, 100
    xor     esi, esi
    xor     eax, eax    ; sum in eax
.sum_loop:
    add     eax, [arr + esi*4]
    inc     esi
    loop    .sum_loop

    ; print prefix and sum
    push    eax
    lea     eax, [msg]
    call    print_string
    pop     eax
    call    print_int

    leave
    ret
