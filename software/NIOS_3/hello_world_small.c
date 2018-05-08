
// NIOS_DAUGHTER_PROCESSOR_3
#include "sys/alt_stdio.h"
#include"stdio.h"
#include"system.h"
#include "alt_types.h"
#include "altera_avalon_performance_counter.h"
#define PERFORMANCE_COUNTER_2_BASE 0xc0

#include "io.h"
#define MULTICORE_NIOS_0_BASE 0x7100000

int main(){
	     int id  = 0x0;
	     int status= 0x0;
	     int b=100;
	     int c =50;
	     int d;



 while (1)
 {
	 id = IORD(MULTICORE_NIOS_0_BASE,22);
	 //checking multicore interface for ID of daughter processor 3

	 if(id == 0x00000003)
	 {
		 printf(" welcome to the daughter processor three id %x \n",id);
		 break;

	 }
 }

// Checking multicore interface for status of cpu

 while(1)
 {
	 status = IORD(MULTICORE_NIOS_0_BASE,32);
	 if(status== 0x00000030)
	 {
		 printf("Now processor %x  will execute the SOBEL_NIOS with  Approximation adders\n",id);
		 break;
	 }

 }

 printf("read the parameters if it is necessary \n");
 while(1)
 {
	 status = IORD(MULTICORE_NIOS_0_BASE,32);
	 	 if(status== 0x00000030)
	 	 {
	 		 printf("Updating status register\n");
	 		 IOWR(MULTICORE_NIOS_0_BASE,32,0xF0);
	 		 d = b/c;
	 		 printf("output from processor should 2 and it is %d\n",d);

// Update status register for the completation of task

	 		IOWR(MULTICORE_NIOS_0_BASE,32,0x00000080);
	 	 }

 }

return 0;
}
