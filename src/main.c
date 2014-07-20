#include "int.h"
#include "gpio.h"
#include "time.h"

void qrk_main (void)
{
	GpioSetOutput(LED_OK);
	for(;;) {
		GpioClearPin(LED_OK);
		BusyLoop(0x3F0000);
		GpioSetPin(LED_OK);
		BusyLoop(0x3F0000);
	}
}
