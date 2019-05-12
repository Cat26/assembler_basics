.intel_syntax noprefix
.global main
.text
 main:
  MOV EBX, 12
  PUSH EBX
  CALL fibonacci
  ADD ESP, 4 #;kladziemy adres powrotu
  PUSH EAX
  MOV EAX, offset msg
  PUSH EAX

  CALL printf
  ADD ESP, 8
  ret

  fibonacci:
push    EBP         #; Retrieve parameter and put it

push    EBX         #; Save previous parameter
mov     EBP,ESP     #; into EBX register
add     EBP,12
mov     EBX,[EBP]   #; EBX = Param

cmp     EBX,1       #; Check for base case
jle     base        #; It is base if (n <= 1)
continue:

lea ecx,[ebx-1]
push ecx            #; push N-1
call    fibonacci   #; Calculate fibonacci for (EBX - 1)
pop ecx             #; remove N-1 off the stack

push eax            #; save the result of fibonacci(N-1)
lea ecx,[ebx-2]
push ecx            #; push N-2
call    fibonacci   #; Calculate fibonacci for (EBX - 2)
pop ecx             #; remove N-2 off the stack
pop ecx             #; ecx = fibonacci(N-1)
add eax,ecx         #; eax = fibonacci(N-2) + fibonacci(N-1)

jmp end
base:               #; Base case
mov EAX,1           #; The result would be 1




end:
pop     EBX         #; Restore previous parameter
pop     EBP         #; Release EBP
ret

.data
  msg: .asciz "Wynik=%i\n"
