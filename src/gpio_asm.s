.section .text

.globl SetGpioFn
@ i32 SetGpioFn (word pin, word fn)
@ r0 = pin
@ r1 = fn
SetGpioFn:
	ldr		r2,=0x20200000
	mov		r1,#1
	lsl		r1,#18
	str		r1,[r2,#4]
	mov		r0,#1
	bx		lr

.globl SetGpio
SetGpio:
	ldr		r2,=0x20200000
	mov		r1,#1
	lsl		r1,#16
	str		r1,[r2,#40]
	mov		r0,#1
	bx		lr

