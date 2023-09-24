app.exe: main.c
	gcc -S -masm=intel main.c
	gcc  -m80387 -O0 main.c -o app.exe
	
clean:
	rm -f app.exe main.o main.s
