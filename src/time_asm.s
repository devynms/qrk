.section .text

.globl BusyLoop
@ void BusyLoop( u32 loops )
@ r0 = loops
BusyLoop:
_BusyLoop_wait:
	sub		r0,#1
	cmp		r0,#0
	bne		_BusyLoop_wait
	bx		lr
