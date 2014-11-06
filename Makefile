

fizzbuzz: fizzbuzz.s
	nasm -f elf64 fizzbuzz.s
	gcc -nostdlib -o fizzbuzz fizzbuzz.o
