/* driver.c */
#include <stdio.h>

extern int __attribute__((cdecl)) asm_main(void);
extern int __attribute__((cdecl)) asm_main2(void);
extern int __attribute__((cdecl)) asm_main_name(void);
extern int __attribute__((cdecl)) asm_main_array(void);
extern int __attribute__((cdecl)) asm_main_range(void);

int main(void) {
    int ret;
    /* call the function you want to test; change as needed */
    ret = asm_main();         /* task1 */
    /* ret = asm_main2(); */
    /* ret = asm_main_name(); */
    /* ret = asm_main_array(); */
    /* ret = asm_main_range(); */
    return ret;
}
