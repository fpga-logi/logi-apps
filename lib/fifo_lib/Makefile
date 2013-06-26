CC = gcc


all: rpi_fifo_test

clean:
	rm -f *.a *.o fifo_test

rpi_fifo.o: rpi-fifolib.c
	$(CC) -c $@ rpi-fifolib.c

rpi_fifo_test : fifo_test.c rpi-fifolib.o
	$(CC) -o $@ fifo_test.c rpi-fifolib.o
