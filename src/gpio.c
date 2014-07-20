#include "int.h"
#include "gpio.h"

static volatile word * pGpio = (word *)(0x20200000);

i32 GpioSetInput (word pin)
{
	if (pin > 53) {
		return 0;
	}

	*(pGpio+(pin/10)) &= ~(7 << ((pin%10)*3));
	return 1;
}

i32 GpioSetOutput (word pin)
{
	if (pin > 53) {
		return 0;
	}

	*(pGpio+(pin/10)) |= (1 << ((pin%10)*3));
	return 1;
}

i32 GpioSetPin (word pin)
{
	if (pin > 53) {
		return 0;
	}

	if (pin > 31) {
		*(pGpio+8) = 1 << (pin - 32);
	} else {
		*(pGpio+7) = 1 << pin;
	}

	return 1;
}

i32 GpioClearPin (word pin)
{
	if (pin > 53) {
		return 0;
	}

	if (pin > 31) {
		*(pGpio+11) = 1 << (pin - 32);
	} else {
		*(pGpio+10) = 1 << pin;
	}

	return 1;
}

