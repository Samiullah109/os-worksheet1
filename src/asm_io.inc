%ifdef ELF_TYPE
%define _scanf   scanf
%define _printf  printf
%define _getchar getchar
%define _putchar putchar
%endif

extern  int_format, string_format, reg_format, mem_format1, mem_format2, mem_format3, stack_format
; asm_io.inc - externs and macros for asm_io routines
; extracted from provided asm_io.asm

extern  read_int, print_int, print_string
extern  read_char, print_char, print_nl
extern  sub_dump_regs, sub_dump_mem, sub_dump_math, sub_dump_stack

%macro   dump_regs 1
    push    dword %1
    call    sub_dump_regs
%endmacro

; usage: dump_mem label, start-address, # paragraphs
%macro   dump_mem 3
    push     dword %1
    push     dword %2
    push     dword %3
    call     sub_dump_mem
%endmacro

%macro   dump_math 1
    push     dword %1
    call     sub_dump_math
%endmacro

%macro   dump_stack 3
    push     dword %3
    push     dword %2
    push     dword %1
    call     sub_dump_stack
%endmacro
