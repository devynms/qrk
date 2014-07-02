.section ".text.boot"

.globl _qrk_start
_qrk_start:
	mov		sp,#0x8000	@ setup the stack

	@ clear out bss
	ldr		r4, =_bss_start
	ldr		r9, =_bss_end
	mov		r5, #0
	mov		r6, #0
	mov		r7, #0
	mov		r8, #0
	b		_2
_1:
	stmia	r4!, {r5-r8}
_2:
	cmp		r4, r9
	blo		_1

	@ call qrk_main
	ldr		r3, =qrk_main
	blx		r3

	@ halt
halt:
	wfe
	b		halt
