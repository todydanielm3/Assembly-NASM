section   .text
org 0x100
  mov ah, 0x9
  mov dx, ola
  int 0x21

  mov ax, 0x4c00
  int 0x21

section .data
ola:  db 'ola mundoo!', 11,9, '$'
