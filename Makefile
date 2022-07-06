CC=gcc
CFLAGS=-I.

ODIR=obj

DEPS = common.h chunk.h memory.h debug.h value.h

_OBJ = main.o chunk.o memory.o debug.o value.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o
