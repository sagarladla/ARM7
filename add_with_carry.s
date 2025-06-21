/*
*	@target		:	ARM7
*	@author		:	Sagarvarman Ladla
*	@program	:	Add 2 numbers with carry
*/

.section .text
.global _start
_start:

	//	data initialization
	mov		r0,	#0x00			//	pointer
	mov		r1,	#0x00			//	n1
	mov		r2,	#0x00			//	n2
	mov		r3,	#0x00			//	sum
	mov		r4,	#0x00			//	carry

	ldr		r0,	=n1				//	r0 points to n1 ( *r0 = &n1 )
	ldr		r1,	[r0],	#4		//	r1 = n1, r0++
	ldr		r2,	[r0],	#4		//	r2 <- *r0 and increment r0 4 bytes (.word size)
	adds	r3,	r2,	r1			//	r3 = r2 + r1
	bcc		skip				//	branch if carry clear to skip
	add		r4,	#0x1
skip:
	str		r3,	[r0],	#4		//	store sum and r0++
	str		r4,	[r0],	#4		//	store carry and r0++
exit:
	b		exit				//	`bal` branch always or we can use `b` (only brach)

.org	0x108					//	origin address is 0x108
n1:		.word	0xffffffff
n2:		.word	0xffffffff
sum:	.word	0x00
carry:	.word	0x00
