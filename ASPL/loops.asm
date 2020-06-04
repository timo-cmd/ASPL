; carefull execute this carefully !
; Press the A key directly. 
; this may overload the stack-buffer and will damage the virtual machine.

.data
  .waiting string "Waiting for the [A] key pressed...\n"
.text
  .global main:

get_input:
  psh A
  psh C
  mvi A, 1 ; syscall for stdin
  ldv C, 0 ; mode for output
  sys      ; initiate system call
  pop C
  pop A
  ret

main:
  mvi A, 0
  mvi b, .waiting
  ldv c, 4
  sys

  mvi A, 97
  mvi B, 0

  ldv16 C, loop:
  ldv16 D, get_input:

  loop:
    cal D
    jne A, B, C

  hlt
