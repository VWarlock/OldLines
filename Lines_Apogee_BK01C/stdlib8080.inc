  .org 23000
end:
  .db 0, 0
  .org 0h
entry:
  .db 0, 4, end>>8, end&255
  jmp main

