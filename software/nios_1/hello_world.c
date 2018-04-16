/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <alt_types.h>
#define SHARED_RAD_BASE 0x0BFF63C0
#define SHARED_RAD_END 0x0BFFFFFF
#define FLAG 2147483647

float temp __attribute__((section("TempMemory")));
float pressure __attribute__((section("PressureMemory")));

int main()
{
	int *headIndex = (int *)SHARED_RAD_BASE;
		usleep (1000);
		float data;
		while (1) {
			if (*headIndex != FLAG) {
				data = .0129 * *headIndex + .0068;
				//fprintf(stdout, "%02d\n", *headIndex);
				fprintf(stdout, "%02f\n", data);
				*headIndex = FLAG;
				headIndex ++;
				if (headIndex < (int *)SHARED_RAD_END) {
					headIndex = (int *)SHARED_RAD_BASE;
				}
			}
			if (temp != FLAG) {
				//need to be able to distinguish between temperature and voltage values in data file
				fprintf(stdout, "Temperature: %02f\n", temp);
				fprintf(stdout, "Pressure: %02f\n", pressure);
				temp = FLAG;
			}
		}
  return 0;
}
