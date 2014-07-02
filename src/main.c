#include "int.h"
#include "gpio.h"

void qrk_main (void)
{
	GpioSetOutput(LED_OK);
	GpioSetPin(LED_OK);
	while (1) {}
}
