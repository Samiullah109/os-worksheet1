; task1.2.asm
; Slightly different program: compute (x * 2) - y and print

%include "asm_io.inc"

section .data
    x   dd  5
    y   dd  3
    msg2 db "Result = ",0

section .text
    global asm_main2

asm_main2:
    push    ebp
    mov     ebp, esp

    mov     eax, [x]
    add     eax, eax        ; eax = x * 2
    sub     eax, [y]        ; eax = (x*2) - y

    push    eax
    lea     eax, [msg2]
    call    print_string
    pop     eax
    call    print_int

    leave
    ret
