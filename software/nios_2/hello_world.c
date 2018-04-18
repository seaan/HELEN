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
#include <math.h>
#include <alt_types.h>
#include <altera_up_avalon_adc.h>
#define SHARED_RAD_BASE 0x0BFF63C0
#define SHARED_RAD_END 0x0BFFFFFF
#define FLAG 2147483647

float temp __attribute__((section("TempMemory")));
float pressure __attribute__((section("PressureMemory")));

float getTemperature(int);
float getPressure(void);

int main()
{
	int *tailIndex = (int *)SHARED_RAD_BASE;
	int radData = 0;
	int presData = 0;
	int tempData = 0;
	int radChannel = 1;
	int presChannel = 3;
	int tempChannel = 5;
	int count = 0;
	alt_up_adc_dev *adc = alt_up_adc_open_dev(ADC_NAME);
	while (tailIndex < (int *)SHARED_RAD_END) {
		*tailIndex = FLAG;
		tailIndex ++;
	}
	temp = FLAG;
	tailIndex = (int *) SHARED_RAD_BASE;
	while (1) {
		while (adc != NULL) {
			usleep(10);
			alt_up_adc_update(adc);
			//TODO: move adc to pin 0?
			radData = alt_up_adc_read(adc, 5);
			radData /= 16;
			//fprintf(stderr, "%d!\n", data);
			*tailIndex = radData;
			tailIndex ++;
			if (tailIndex < (int *)SHARED_RAD_END) {
				tailIndex = (int *)SHARED_RAD_BASE;
			}
//			if (count > 10000) {
//				tempData = alt_up_adc_read(adc, tempChannel);
//				temp = getTemperature(tempData);
//				presData = alt_up_adc_read(adc, presChannel);
//				pressure = getPressure(presData);
//				count = 0;
//			} else {
//				count ++;
//			}
		}
	}
  return 0;
}

float getTemperature (int tempData){
	//converts the adc reading into an actual voltage based off of slope.
	float voltage = (0.000502512562 * tempData - 0.095979899);
	//Need to convert our voltage reading into the resistance across the thermistor. To find this we use 3.3(R1)/(3.3-vadc) - R1
	float resistance = (3.3 * 10000)/(3.3 - voltage) - 10000;
	//constants for the NTCLE100E3103HT1 in the Steinhart-Hart equation (T = 1/(A + Bln(resistance) + Dln^3(resistance))
	float a_const = 0.003354016;
	float b_const = 0.000256985;
	float d_const = 0.00000006383091;
	//Steinhart-Hart to find temperature then return it.
	return 1 / (a_const + b_const * log(resistance / 10000) + d_const * log(resistance / 10000) * log(resistance / 10000) * log(resistance / 10000));
}

#include <stdio.h>
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"
#include <alt_types.h>
#include <system.h>
#include <math.h>

/* Global Variable Declaration */
struct Pressure {
	alt_u8 calibration_code[6];
	alt_u16 calibration[6];

	alt_u8 read_code[2];

} p;

alt_32 getPressure(void);
void calibratePressure(void);
alt_32 getPressure(void);

/* Pressure Sensor Testing */
int main(void) {
	calibratePressure();

	while(1){
		fprintf(stderr, "%ld\n", getPressure());
		usleep(10000000);
	}
	return 0;
}

/* Calibrate pressure from factory settings on the MS5611 */
void calibratePressure(void) {
	p.calibration_code[0] = 0b10100010;
	p.calibration_code[0] = 0b10100100;
	p.calibration_code[0] = 0b10100110;
	p.calibration_code[0] = 0b10101000;
	p.calibration_code[0] = 0b10101010;
	p.calibration_code[0] = 0b10101100;

	p.read_code[0] = 0x48;
	p.read_code[1] = 0x58;
	/* Calibrate values c1 through c6 */
	for (int i = 0; i < 6; i++) {
		alt_avalon_spi_command(SPI_0_BASE, 0,
				1, &(p.calibration_code[i]), //write data, 1 byte
				2, &(p.calibration[i]),		 //read data, 2 bytes
				0);

	}
}

/* Get Current Pressure value */
alt_32 getPressure(void) {
	/* Request and read current pressure value */
	alt_u32 uncal_pressure = 0;
	alt_avalon_spi_command(SPI_0_BASE, 0,
			1, &(p.read_code[0]), //write data, 1 byte
			4, &(uncal_pressure), //read data, 2 bytes
			0);

	/* Request and read current temperature value */
	alt_u32 d2 = 0;
		alt_avalon_spi_command(SPI_0_BASE, 0,
				1, &(p.read_code[1]), //write data, 1 byte
				4, &(d2), //read data, 2 bytes
				0);

	/* Calculate temperature-adjusted pressure */
	alt_32 dT = (alt_64) d2 - (((alt_64) p.calibration[4]) * (256));
	alt_64 offset = ((alt_64) p.calibration[1]) * (65536)
			+ ((((alt_64) p.calibration[3]) * ((alt_64) dT)) / (128));
	alt_64 sens = (((alt_64) p.calibration[0]) * (32768))
			+ ((((alt_64) p.calibration[2]) * ((alt_64) dT)) / 256);
	alt_32 pressure = ((((alt_64) uncal_pressure)
			* (((alt_u64) sens) / 2097152)) - (alt_64) offset) / 32768;

	return pressure; //pressure given in pascals.
}