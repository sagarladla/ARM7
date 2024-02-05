/*
 * @target	:	ARM7
 * @author	:	Sagar Ladla
 * @program	:	Check if number is odd or even
 */

.section .text
.global _start
_start:
	
	/* data initialization */
	mov	r0,	#0x00	/* pointer */
	mov	r1,	#0x00	/* n */
	mov	r2,	#0x00	/* n2 */
	mov	r3,	#0x00	/* res */

	ldr	r0,	=n
	ldr	r1,	[r0]
	ldr	r2,	[r0],	#4

	lsr	r2,	#0x01	/* divide by 2 */
	lsl	r2,	#0x01	/* multiply by 2 */
	
	cmp	r1,	r2	/* check if r1 and r2 are equal */
	moveq	r3,	#0x01	/* even condition: if r1 & 2 are equal, move 1 to r3 */

	str	r3,	[r0]	/* store value of r3 to res */

exit:
	b	exit

.org	0x100
n:	.word	0x00000008
res:	.word	0x00000000