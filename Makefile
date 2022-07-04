CC=gcc
CFLAGS=-I.

ODIR=obj

DEPS = common.h chunk.h memory.h debug.h
OBJ = main.o chunk.o memory.o debug.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
