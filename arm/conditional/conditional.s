.data

n: .ascii " "

.text
.global _start
_start:

  mov     r0, #2
  /* put in cpsr results of r0 - 3 */
  cmp     r0, #3
  /* lt condition is fullfilled so add */
  addlt   r0, r0, #1
  /* since r0 is 3, lt will not be fullfilled */
  cmp     r0, #3
  addlt   r0, r0, #1

  /* add 48 to format digit as ascii
     and store the number in the empty ascii string n
  */
  add     r0, r0, #48
  ldr     r1, =n
  str     r0, [r1]

  /* setup to print string n */
  mov     r0, #1
  ldr     r1, =n
  mov     r2, #1
  mov     r7, #4
  swi     0

  /* exit */
  mov     r7, #1
  swi     0
