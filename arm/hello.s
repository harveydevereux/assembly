.text
.global _start
_start:
	/* display to stdout using 1 in r0 */
	mov r0, #1
	/* load the messae (defined in .data) and it's length
	   into registers 1 and 2 */
	ldr r1, =message
	ldr r2, =len
	/* mov digit 4 into r7 (4 is code for sys_write */
	mov r7, #4
	/* ececute syscall code in r7 */
	swi 0
	/* move 1 to r7 and then syscall 1 (exit) */
	mov r7, #1
	swi 0

.data
message:
	.asciz "Hello, world!\n" /* null terminated string */
len = .- message
