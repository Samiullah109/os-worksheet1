; task1.asm
; Implements asm_main which adds two global integers and prints the result.
; Uses asm_io.inc and the print_int routine (expects value in EAX).

%include "asm_io.inc"

section .data
    a   dd  7
    b   dd  13
    msg db "Sum = ",0

section .text
    global asm_main

asm_main:
    ; standard cdecl-style function (we return result in EAX)
    push    ebp
    mov     ebp, esp

    ; load values
    mov     eax, [a]
    add     eax, [b]     ; eax = a + b

    ; print prefix string using print_string (expects pointer in EAX)
    ; print_string in asm_io expects EAX to contain the address of string
    push    eax          ; save sum on stack temporarily
    lea     eax, [msg]
    call    print_string

    ; restore sum into EAX and call print_int
    pop     eax
    call    print_int

    ; return sum as status code
    leave
    ret
