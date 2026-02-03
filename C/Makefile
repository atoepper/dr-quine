NAME := quines_c

CC      := gcc
CFLAGS  := -Wall -Wextra -Werror

SRC     := Colleen.c Grace.c Sully.c
OBJ     := $(SRC:.c=.o)
BIN     := $(SRC:.c=)

.PHONY: all clean fclean re test

all: $(BIN)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%: %.o
	$(CC) $(CFLAGS) $< -o $@

test: all
	./test.sh

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(BIN)
	rm -f Grace_kid.c
	rm -f Sully_* *.o

re: fclean all
