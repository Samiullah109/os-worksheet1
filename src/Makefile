# ====== Compiler/Assembler Settings ======
NASM = nasm
GCC  = gcc

# -f elf = output 32-bit ELF objects
# -d ELF_TYPE = required by asm_io.asm for correct symbol names
NASMFLAGS = -f elf -d ELF_TYPE

# GCC must build and link 32-bit
CFLAGS = -m32 -g -Wall
LDFLAGS = -m32 -no-pie

# ====== Object Files ======
ASM_OBJS = asm_io.o task1.o task1.2.o task2_name.o task2_array.o task2_range.o
C_OBJS = driver.o driver_cli.o

# ====== Default Target ======
all: task1

# ====== Build Individual Programs ======

task1: driver.o task1.o asm_io.o
	$(GCC) $(LDFLAGS) -o task1 driver.o task1.o asm_io.o

task1.2: driver.o task1.2.o asm_io.o
	$(GCC) $(LDFLAGS) -o task1.2 driver.o task1.2.o asm_io.o

task2_name: driver.o task2_name.o asm_io.o
	$(GCC) $(LDFLAGS) -o task2_name driver.o task2_name.o asm_io.o

task2_array: driver.o task2_array.o asm_io.o
	$(GCC) $(LDFLAGS) -o task2_array driver.o task2_array.o asm_io.o

task2_range: driver.o task2_range.o asm_io.o
	$(GCC) $(LDFLAGS) -o task2_range driver.o task2_range.o asm_io.o

# ====== CLI driver that calls any asm entrypoint ======
driver_cli: driver_cli.o $(ASM_OBJS)
	$(GCC) $(LDFLAGS) -o driver_cli driver_cli.o $(ASM_OBJS)

# ====== Assemble ASM Files ======

asm_io.o: asm_io.asm asm_io.inc
	$(NASM) $(NASMFLAGS) asm_io.asm -o asm_io.o

task1.o: task1.asm asm_io.inc
	$(NASM) $(NASMFLAGS) task1.asm -o task1.o

task1.2.o: task1.2.asm asm_io.inc
	$(NASM) $(NASMFLAGS) task1.2.asm -o task1.2.o

task2_name.o: task2_name.asm asm_io.inc
	$(NASM) $(NASMFLAGS) task2_name.asm -o task2_name.o

task2_array.o: task2_array.asm asm_io.inc
	$(NASM) $(NASMFLAGS) task2_array.asm -o task2_array.o

task2_range.o: task2_range.asm asm_io.inc
	$(NASM) $(NASMFLAGS) task2_range.asm -o task2_range.o

# ====== Build C Drivers ======

driver.o: driver.c
	$(GCC) $(CFLAGS) -c driver.c -o driver.o

driver_cli.o: driver_cli.c
	$(GCC) $(CFLAGS) -c driver_cli.c -o driver_cli.o

# ====== Clean Build ======
clean:
	rm -f *.o task1 task1.2 task2_name task2_array task2_range driver_cli

.PHONY: all clean
