  .data
  .l1 string "Hello, World!"
  .text
.global main:

main:
  ldv a, 0
  ldv c, 4
  ldv b, .l1
  sys
  hlt
