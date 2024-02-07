/*
 * @target	:	ARM7
 * @author	:	Sagar Ladla
 * @program	:	Find factorial of n
 */


.section .text
.global _start
_start:
	/* data initialization */
	mov	r0,	#0x00
	mov	r1,	#0x00
	mov	r2,	#0x00

	/* load data into registers */
	ldr	r0,	=n			/* r0 points to n */
	ldr	r1,	[r0],	#0x04		/* load value at r0 (&n) to r1 and increment the pointer to next address (&result) */
	ldr	r2,	[r0]			/* load the value at (&result) to r2 */

factorial:
	cmp	r1,	#0x01			/* compare if r1==1 */
	beq	break				/* if zero flag is set break the loop */
	mul	r2,	r2,	r1		/* r2 = r2 * r1 */
	sub	r1,	r1,	#0x01		/* r1 = r1 - 1 */
	b	factorial			/* loop to factorial */

break:
	str	r2,	[r0]			/* store the value of r2 into address (&result) */

exit:
	b	exit				/* exit the program */

.org	0x100
n:	.word	0x05
result:	.word	0x01
