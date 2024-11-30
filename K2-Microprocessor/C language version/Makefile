CC = gcc
CFLAGS = -Wall

all: k2_processor

k2_processor: ALU.c decoder.c fetch.c jump.c loading.c mux.c program_counter.c k2_processor.c assembler.c
	$(CC) $(CFLAGS) -o k2_processor ALU.c decoder.c fetch.c jump.c loading.c mux.c program_counter.c k2_processor.c assembler.c

clean:
	rm -f k2_processor
