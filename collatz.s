/**
 *
 * @target	:	ARM7
 * @author	:	Sagar Ladla
 * @program	:	Collatz Conjecture
 *
 */

.global _start
_start:
	
	/* data initialization*/
	mov	r0,	#0x00			/* pointer					*/
	mov	r1,	#0x00			/* n						*/
	mov	r2,	#0x00			/* c						*/
	mov	r3,	#0x03			/* multiplier					*/
	
	/* load data into registers */
	ldr	r0,	=n			/* *r0 = &n;					*/
	ldr	r1,	[r0],	#0x04		/* r1 = *r0; *(r0 + 4) or *r0++; (*r0 = &c)	*/
	ldr	r2,	[r0]			/* r2 = *r0; (c)				*/
	
loop:
	cmp	r1,	#0x01			/* compare r1 and 1				*/
	beq 	break				/* break the loop if (r1 == 1)			*/
	tst 	r1,	#0x01			/* (r1 & 1) => set Z flag if r1 is even		*/
	lsreq	r1,	r1,	#0x01		/* r1 = r1 / 2 (r1 = r1 >> 1)			*/
	addeq	r2,	r2,	#0x01		/* if Z flag is set increment r2		*/
	beq	loop				/* continue;					*/	
	mul	r1,	r1,	r3		/* else if r1 is odd => r1 = r1 * 3		*/
	add	r1,	r1,	#0x01		/* add 1 to r1 => r1 = r1 + 1			*/
	add	r2,	r2,	#0x01		/* increment r2					*/
	b loop

break:
	str	r2,	[r0]			/* *r0 = r2 (store content of r2 at 
							location pointed by r0 - var c)
						*/

exit:
	b	exit
	
.org	0x100
n:	.word	0xb2
c:	.word	0x00
