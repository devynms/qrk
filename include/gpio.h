#ifndef GPIO_H
#define GPIO_H

#define FN_ENABLE	1

#define LED_OK		16

/* *
 * pin: 0 <= pin <= 53
 * set: zero = set, non-zero = clear
 */
i32 SetGpio (word pin, i32 set);

/* *
 * pin: 0 <= pin <= 53
 * fn: 0 <= fn <= 7
 * return: 1 on success, 0 on failure
 */
i32 SetGpioFn (word pin, word fn);

i32 GpioSetInput (word pin);
i32 GpioSetOutput (word pin);
i32 GpioSetPin (word pin);
i32 GpioClearPin (word pin);

#endif
