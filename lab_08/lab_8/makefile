_MAKE_OUT_DIR_ := $(shell mkdir -p out)
_MAKE_ASM_DIR_ := $(shell mkdir -p assembly)
_MAKE_DISASM_DIR_ := $(shell mkdir -p disassembly)

math_sse:
	@echo
	@echo "SSE: "
	g++ sum_mul.cpp -mno-80387 -O0 -o math_sse.exe
	./math_sse.exe

math_fpu:
	@echo
	@echo "FPU: "
	g++ sum_mul.cpp -m80387 -O0 -o math_fpu.exe
	./math_fpu.exe

math_asm:
	@echo
	@echo "ASM: "
	g++ sum_mul.cpp -masm=intel -DASM -O0 -o math_asm.exe
	./math_asm.exe

math: math_sse math_fpu math_asm

sin:
	@echo
	g++ sin.cpp -masm=intel -o cmp_sin.exe
	./cmp_sin.exe

run_all: math sin

# Посмотреть ассемблерный код можно 2 способами:

assembly:
	g++ -S sum_mul.cpp -mno-80387 -DSSE -O0 -o assembly/math_sse.s
	g++ -S sum_mul.cpp -m80387 -mno-sse -DFLOAT_80 -O0 -o assembly/math_fpu.s
	g++ -S sum_mul.cpp -masm=intel -DASM -O0 -o assembly/math_asm.s
	g++ -S sin.cpp -masm=intel -o assembly/sin.s

disassembly:
	g++ -c sum_mul.cpp -mno-80387 -DSSE -O0 -o out/math_sse.o
	g++ -c sum_mul.cpp -m80387 -mno-sse -DFLOAT_80 -O0 -o out/math_fpu.o
	g++ -c sum_mul.cpp -masm=intel -DASM -O0 -o out/math_asm.o
	g++ -c sin.cpp -masm=intel -o out/sin.o
	objdump -M intel-mnemonic -d out/math_sse.o  > disassembly/math_sse.txt
	objdump -M intel-mnemonic -d out/math_fpu.o  > disassembly/math_fpu.txt
	objdump -M intel-mnemonic -d out/math_asm.o  > disassembly/math_asm.txt
	objdump -M intel-mnemonic -d out/sin.o  > disassembly/sin.txt

clean:
	rm -rf out/* assembly/* disassembly/* *.exe
