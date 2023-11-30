/*
*	@target		:	ARM7
*	@author		:	Sagar Ladla
*	@program	:	Subtract 2 numbers with borrow
*/

.section .text
.global _start
_start:

	//	data initialization
	mov		r0,	#0x00			//	pointer
	mov		r1,	#0x00			//	n1
	mov		r2,	#0x00			//	n2
	mov		r3,	#0x00			//	difference
	mov		r4,	#0x00			//	borrow

	ldr		r0,	=n1				//	r0 points to n1 ( *r0 = &n1 )
	ldr		r1,	[r0],	#4		//	r1 = n1, r0++
	ldr		r2,	[r0],	#4		//	r2 <- *r0 and increment r0 4 bytes (.word size)
	subs	r3,	r1,	r2			//	r3 = r1 - r2
	bcs		skip				//	branch if carry set to skip (carry flag is inverted if there is borrow)
	add		r4,	#0x1
skip:
	str		r3,	[r0],	#4		//	store difference and r0++
	str		r4,	[r0],	#4		//	store borrow and r0++
exit:
	b		exit				//	`bal` branch always or we can use `b` (only brach)

.org	0x108					//	origin address is 0x108
n1:		.word	0x2
n2:		.word	0x1
diff:	.word	0x00
borrow:	.word	0x00
