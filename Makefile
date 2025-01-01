NAME	=	hello

SRC		=	hello.asm

OBJ		=	$(SRC:%.asm=%.o)

%.o: %.asm
	nasm -f elf $< -o $@

$(NAME): $(OBJ) Makefile
	ld -m elf_i386 hello.o -o $@

clean:
	rm -fr $(OBJ)

fclean: clean
	rm -fr $(NAME)

# Link with (64 bit systems require elf_i386 option): ld -m elf_i386 hello.o -o hello
# Run with: ./hello