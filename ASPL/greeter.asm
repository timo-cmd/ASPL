.data
  .name size 6
  .name_max 4
  .name_pointer 0
  .question string 'What is your name? (5 letters)\n'
  .hello string 'Hello, '
  .nl string '\n'

.text
  .global main:

get_name:
  mvi a, 1              ; load a with the the stdin call code
  sys                   ; get a character of stdin, place into b

  mvi d, get_name:
  mov a, b
  mvi b, 1
  jlt a, b, d              ; if a < 1, loop

  mvi b, .name          ; get the start address of name
  mvi c, .name_pointer  ; get the address of the name pointer
  ldr d, c              ; get the value of the name pointer into d
  add b, d              ; add a+c, placing the result in a. a now points to the next address
  str b, a              ; store the value in b into the address pointed at by a

  mvi a, .name_pointer  ; get the address of the name pointer
  ldr b, a              ; place the value of the name pointer into b
  inc b                 ; add one to b
  str a, b              ; save the name_pointer in memory

  mvi c, .name_max      ; place address of name_max into c
  ldr a, c              ; place the value of name_max into a

  mvi c, final_zero:
  jlt a, b, c            ; if (a < b) = (name_max < name_pointer), we are done
  mvi c, get_name:      ; otherwise jump back to the beginning to get the next character
  jmr c

  final_zero:
  mvi a, .name          ; get the start address of name
  mvi b, .name_pointer  ; get the address of the name pointer
  ldr c, b              ; get the value of the name pointer into c
  add a, c              ; add a+c, placing the result in a. a now points to the next address
  mvi b, 0
  str a, b              ; place a 0 on the end of the string, and we have the whole name in memory
  ret                   ; return from the function

main:
  mvi a, 0
  mvi c, 4
  mvi b, .question
  sys

  mvi a, get_name:
  cal a

  mvi a, 0
  mvi c, 4

  mvi b, .hello
  sys

  mvi b, .name
  sys                     ; print the name

  mvi b, .nl
  sys                     ; print a newline

  hlt
