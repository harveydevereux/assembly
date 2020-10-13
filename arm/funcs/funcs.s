.text
.global _start
_start:
	bl foo 		/* branch with link to foo */
	mov r7,#1	/* exit */ 
	swi 0
foo:
	push {lr}	/* push link register to stack, i.e location of an instruction after bl foo*/
	bl bar		/* branch and link to bar */
	pop {lr}	/* pop the lr to go back to instruction after the bl foo */
	bx lr		/* branch and exchange back to address lr ^^^^^^^^^^^^^^ */
bar:
	push {lr}	/* leaf func pc = bar, lr = bl bar + 4. store lr */
	pop {pc}	/* then pop lr into pc to return to foo */
