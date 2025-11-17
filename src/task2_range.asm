; task2_range.asm
; Asks user to enter low and high indices, checks valid range, sums and prints result.

%include "asm_io.inc"

section .data
    msg_prompt_low db "Enter low index (1-100): ",0
    msg_prompt_high db "Enter high index (1-100): ",0
    msg_range_err db "Invalid range",0
    msg_sum db "Range sum = ",0

section .bss
    arr resd 100

section .text
    global asm_main_range

extern _scanf

asm_main_range:
    push    ebp
    mov     ebp, esp

    ; initialize array 1..100 (same as before)
    mov     ecx, 100
    xor     esi, esi
    mov     ebx, 1
.init_arr:
    mov     [arr + esi*4], ebx
    inc     esi
    inc     ebx
    loop    .init_arr

    ; prompt low
    lea     eax, [msg_prompt_low]
    call    print_string
    sub     esp, 8
    lea     eax, [ebp-4]
    push    eax
    push    dword int_format
    call    _scanf
    add     esp, 8
    mov     ebx, [ebp-4]   ; low

    ; prompt high
    lea     eax, [msg_prompt_high]
    call    print_string
    sub     esp, 8
    lea     eax, [ebp-8]
    push    eax
    push    dword int_format
    call    _scanf
    add     esp, 8
    mov     ecx, [ebp-8]   ; high

    ; check 1 <= low <= high <= 100
    cmp     ebx, 1
    jl      .range_err
    cmp     ecx, ebx
    jl      .range_err
    cmp     ecx, 100
    jg      .range_err

    ; sum from low to high (inclusive)
    xor     eax, eax
    mov     edi, ebx
.sum_loop:
    add     eax, [arr + (edi-1)*4]
    inc     edi
    cmp     edi, ecx
    jle     .sum_loop_end_check
    ; when edi > ecx, done
.sum_done:
    ; print sum
    push    eax
    lea     eax, [msg_sum]
    call    print_string
    pop     eax
    call    print_int
    jmp     .done

.sum_loop_end_check:
    jmp     .sum_loop

.range_err:
    lea     eax, [msg_range_err]
    call    print_string

.done:
    mov     esp, ebp
    pop     ebp
    ret
