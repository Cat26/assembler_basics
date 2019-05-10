.intel_syntax noprefix
.text
.global main

main:
   mov	edx,len
   mov	ecx,msg
   mov	ebx,1
   mov	eax,4
   int	0x80

   mov	eax,1
   int	0x80

.data
msg:
 .asciz 'Hello, world!'
len:
  equ $ - msg
