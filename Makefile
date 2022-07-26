ODIR=./obj
IDIR=./src
SRCDIR=./src

CC=gcc
CFLAGS=-I$(IDIR)

_DEPS = common.h chunk.h memory.h debug.h value.h vm.h compiler.h scanner.h object.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o chunk.o memory.o debug.o value.o vm.o compiler.o scanner.o object.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRCDIR)/%.c $(DEPS)
	$(CC) -g -c -o $@ $< $(CFLAGS)

clox: $(OBJ)
	$(CC) -g -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o
