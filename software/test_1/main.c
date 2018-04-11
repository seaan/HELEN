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
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"
#include <alt_types.h>
#include <system.h>

void calibratePressure(void);
int32_t getPressure(void);
/* Pressure Sensor Testing */
int main(void) {

	return 0;
}

#include <math.h>

/* Global Variable Declaration */
struct Pressure {
	alt_u8 calibration_code[6] = { 0b10100010, 0b10100100, 0b10100110,
			0b10101000, 0b10101010, 0b10101100 };
	alt_u16 calibration[6];

	alt_u8 read_code[2] = {0x48, 0x58};

} p;
/* Calibrate pressure from factory settings on the MS5611 */
void calibratePressure(void) {
	/* Calibrate values c1 through c6 */
	for (int i = 0; i < 6; i++) {
		alt_avalon_spi_command(SPI_0_BASE, 0,
				1, &(p.calibration_code[i]), //write data, 1 byte
				2, &(p.calibration[i]),		 //read data, 2 bytes
				0);
	}
}

/* Get Current Pressure value */
int32_t getPressure(void) {
	/* Request and read current pressure value */
	alt_avalon_spi_command(SPI_0_BASE, 0,
			1, &(p.calibration_code[i]), //write data, 1 byte
			2, &(p.calibration[i]),		 //read data, 2 bytes
			0);
	spi_select();
	spi_write(0x48);
	spi_deselect();
	delay_ms(10);

	/* Read current pressure value */
	spi_select();
	spi_write(0x00);
	uint32_t uncal_pressure = ((uint32_t) spi_read()) << 16; //Typecast the 8 bit data to 32 bit, then move it 16 places to the left. Stores in temp variable.
	uncal_pressure += ((uint32_t) spi_read()) << 8; //Assign data to data + the new data but in the lower 8 bits.
	uncal_pressure += ((uint32_t) spi_read());
	spi_deselect();

	/* Request current temperature value */
	spi_select();
	spi_write(0x58); //Ask for temp value.
	spi_deselect();
	delay_ms(10);

	/* Read current temperature value */
	spi_select();
	spi_write(0x00);
	uint32_t d2 = ((uint32_t) spi_read()) << 16;
	d2 += ((uint32_t) spi_read()) << 8;
	d2 += ((uint32_t) spi_read());
	spi_deselect();

	/* Calculate temperature-adjusted pressure */
	int32_t dT = (int64_t) d2 - (((int64_t) cal_pres_c5) * (256));
	int64_t offset = ((int64_t) cal_pres_c2) * (65536)
			+ ((((int64_t) cal_pres_c4) * ((int64_t) dT)) / (128));
	int64_t sens = (((int64_t) cal_pres_c1) * (32768))
			+ ((((int64_t) cal_pres_c3) * ((int64_t) dT)) / 256);
	int32_t pressure = ((((int64_t) uncal_pressure)
			* (((uint64_t) sens) / 2097152)) - (int64_t) offset) / 32768;

	return pressure; //pressure given in pascals.
}
