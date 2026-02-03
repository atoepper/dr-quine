.SUFFIXES:

NASM       := nasm
CC         := gcc
NASMFLAGS  := -f elf64
CFLAGS     := -Wall -Wextra -Werror -no-pie

SRC := Colleen.s Grace.s Sully.s
OBJ := $(SRC:.s=.o)
BIN := $(SRC:.s=)

.PHONY: all clean fclean re test

all: $(BIN)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

%: %.o
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(BIN)
	rm -f Grace_kid.s
	rm -f Sully_* *.o

re: fclean all
