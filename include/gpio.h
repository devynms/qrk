#ifndef GPIO_H
#define GPIO_H

#define LED_OK		16

i32 GpioSetInput	( word pin );
i32 GpioSetOutput	( word pin );
i32 GpioSetPin		( word pin );
i32 GpioClearPin	( word pin );

#endif
