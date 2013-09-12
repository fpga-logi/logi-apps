CC = gcc


all: beaglebone_fifo_test

clean:
	rm -f *.a *.o beaglebone_fifo_test

beaglebone_fifo.o: beaglebone-fifolib.c
	$(CC) -c $@ beaglebone-fifolib.c

beaglebone_fifo_test : fifo_test.c beaglebone-fifolib.o
	$(CC) -o $@ fifo_test.c beaglebone-fifolib.o

