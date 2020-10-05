.data

empty:    .ascii " "
end:      .ascii "\n"
n:        .ascii " "

.text
.global _start
_start:
  push  {r11, lr}
  add   r11, sp, #0
  sub   sp, sp, #16

  mov   r3, #10
  .LOOP:
    sub   r3, r3, #1
    cmp   r3, #0
    mov   r0, r3
    bl    print
    bgt   .LOOP
  .ENDLOOP:

  /* exit */
  mov     r7, #1
  swi     0

print:
  push  {r11}
  add   r11, sp, #0
  sub   sp, sp, #12

  ldr     r1, =n
  ldr     r2, =empty
  str     r2, [r1]

  add     r0, r0, #48
  ldr     r1, =n
  str     r0, [r1]

  mov     r0, #1
  ldr     r1, =n
  mov     r2, #1
  mov     r7, #4
  swi     0

  add   sp, r11, #0
  pop   {r11}
  bx    lr
