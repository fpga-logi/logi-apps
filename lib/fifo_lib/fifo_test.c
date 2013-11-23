#include "fifolib.h"
#include <time.h>
#include <unistd.h>

unsigned char buffer[256000] ;

int main(int argc, char ** argv){
	unsigned int i ;
	long start_time, end_time ;
	double diff_time ;
	struct timespec cpu_time ;
	if(fifo_open(0) < 0){
		printf("cannot open fifo !\n"); 
		return -1 ;
	}
	fifo_reset(0);
	unsigned int size =  fifo_getSize(0) ;
	unsigned int nb_avail = fifo_getNbAvailable(0);
	unsigned int nb_free = fifo_getNbFree(0);
	printf("fifo 0 of size %d contains %d tokens , %d free slots \n", size, nb_avail, nb_free);
	while(1){
		fifo_reset(0);
		fifo_read(0, buffer, 4096);
		printf("done \n");
	}
	//fifo_reset(0) ;
	//return 0 ;
	fifo_write(0, buffer, 640);
	sleep(3);
	//fifo_read(0, buffer, 1024);
	size =  fifo_getSize(0) ;
        nb_avail = fifo_getNbAvailable(0);
        nb_free = fifo_getNbFree(0);
	printf("fifo 0 of size %d contains %d tokens , %d free slots \n", size, nb_avail, nb_free);
	return 0 ;
	clock_gettime(CLOCK_REALTIME, &cpu_time);
	start_time = cpu_time.tv_nsec ;
	fifo_write(0, buffer, 4096) ;
	clock_gettime(CLOCK_REALTIME, &cpu_time);
	end_time = cpu_time.tv_nsec ;
	diff_time = end_time - start_time ;
	diff_time = diff_time/1000000000.0 ;
	printf("transffered %d bytes in %f s : %f B/s \n", 4096, diff_time, 4096/diff_time);
	printf("read and write done \n");
	//printf("fifo 1 is %d large and contains %d tokens \n", fifo_getSize(1), fifo_getNbAvailable(1));
	/*while(1){
		fifo_reset(1);
		fifo_read(1, buffer, 32*6);
		for(i = 0 ; i < 5 ; i ++){
			unsigned int posx0, posy0, posx1, posy1;
			posy0 = buffer[i*(6)];
			posy0 += (buffer[(i*(6))+1] & 0x03 << 8);
			posx0 = (buffer[(i*(6))+1] & 0xFC >> 2);
			posx0 += (buffer[(i*(6))+2] & 0x03 << 8);

			posy1 = (buffer[i*(6)+2] & 0xFC >> 2);
			posy1 += (buffer[(i*(6))+3] & 0x03 << 8);
			posx1 = (buffer[(i*(6))+3] & 0xFC >> 2);
			posx1 += (buffer[(i*(6))+4] & 0x03 << 8);


			printf("x[%d] = %d, y[%d] = %d \n", i, (posx0 + posx1)/2, i, (posy0 + posy1)/2);
		}
		sleep(1);	
	}*/ //blob_tracking test ...
	fifo_close(0);
}
