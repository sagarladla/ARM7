/*
 * @target	:	ARM7
 * @author	:	Sagar Ladla
 * @program	:	Check if number is odd or even
 */

/**
 * 1. Divide number by 2 (logical right shift)
 * 2. Multiply number by 2 (logical left shift)
 * Equality should set zero flag if both numbers are equal (even number)
 */

.section .text
.global _start
_start:
	
	/* data initialization */
	mov	r0,	#0x00		/* pointer */
	mov	r1,	#0x00		/* n */
	mov	r2,	#0x00		/* n2 */
	mov	r3,	#0x00		/* res */

	ldr	r0,	=n		/* r0 points to n ( *r0 = &n ) */
	ldr	r1,	[r0]		/* r1 = n */
	ldr	r2,	[r0],	#4	/* r2 = n (copy of n), r0++ */

	lsr	r2,	#0x01		/* divide by 2 (n >> 1) */
	lsl	r2,	#0x01		/* multiply by 2 (n << 1) */
	
	cmp	r1,	r2		/* check if r1 and r2 are equal */
	moveq	r3,	#0x01		/* even condition: if r1 & 2 are equal, move 1 to r3 */

	str	r3,	[r0]		/* store value of r3 to res */

exit:
	b	exit

.org	0x100
n:	.word	0x00000008
res:	.word	0x00000000


/* Another approach */


/**
 * 5 = 0000 0101
 * 1 = 0000 0001 &
 * -------------
 * 1 = 0000 0001
 * -------------
 *
 * 4 = 0000 0100
 * 1 = 0000 0000 &
 * -------------
 * 0 = 0000 0000
 * -------------
 */

.global _start
_start:
		
	mov	r0,	#0		/* pointer */
	mov	r1,	#0		/* n */
	mov 	r2,	#1
	mov	r3,	#0		/* res */
	
	ldr	r0,	=n		/* r0 points to n ( *r0 = &n ) */
	ldr 	r1,	[r0],	#4	/* r1 = n, r0++ */
	
	ands	r3,	r1,	r2	/* logical `and` operation and set flags: r3 = r1 & r2 */
	beq	even			/* branch if zero flag is set to even */
	
even:
	str	r3,	[r0],	#4	/* store logical `and` operation value in res variable */


exit:
    b	exit
	
	
	
.org	0x100
n:	.word	0x05
res:	.word	0x00
