CC = gcc


all: read_wishbone write_wishbone

clean:
	rm -f *.a *.o write_wishbone read_wishbone

read_wishbone : read_wishbone.c
	$(CC) -o $@ read_wishbone.c

write_wishbone : write_wishbone.c
	$(CC) -o $@ write_wishbone.c

