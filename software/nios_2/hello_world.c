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
	float pressure = ((((int64_t) uncal_pressure)
			* (((uint64_t) sens) / 2097152)) - (int64_t) offset) / 32768;

	return pressure; //pressure given in pascals.
}