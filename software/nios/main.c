#include "altera_up_avalon_adc.h"
//#include "altera_up_avalon_rs232.h"
#include "system.h"
#include <stdio.h>
#include "altera_avalon_pio_regs.h"
#include <unistd.h>
#include <sys/times.h>
#include <time.h>

int main(){
  printf("Hello from Nios II!\n");

  unsigned int data = 0;
  alt_up_adc_dev * adc;

  int channel, index;
  int voltage[100050];
  index = 0;
  channel = 1;

  adc = alt_up_adc_open_dev(ADC_NAME);
  while (1){
	  while(adc != NULL){

		  data = alt_up_adc_read(adc, channel);
		  alt_up_adc_update(adc);

		  data = data/16;

		  IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, data);

		  voltage[index++] = (0.0150*data - 0.3011)*10;

		  if(index >= 100000){
			  index = 0;
			  for(int i = 0; i < 100000; i++){
				  fprintf(stderr, "%02d", voltage[i]);
			  }
			  fprintf(stderr,"\n");
		  }
	  }
  }
  return 0;
}
