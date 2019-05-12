.intel_syntax noprefix
.global main
.text
 main:
  MOV EAX, 6
  PUSH EAX
  CALL Fibonacci
  ADD ESP, 4 #;kladziemy adres powrotu
  PUSH ECX
  MOV ECX, offset msg
  PUSH ECX

  CALL printf
  ADD ESP, 8
  ret

Fibonacci:
PUSH EBP
MOV  EBP, ESP # ;ustawienie poczadkowego konca stosu
MOV  EAX, [ESP+8]
CMP  EAX, 1
JA   Recurse #;jak wiekszy od jeden
MOV  ECX, 1
JMP  exit #;wroci tam gdzie zaczynal przed wywolaniem funkcji

Recurse:
DEC  EAX
MOV  EDX, EAX
PUSH EDX
PUSH EAX
CALL Fibonacci
POP  EAX
DEC  EAX
PUSH ECX
PUSH EAX
CALL Fibonacci
POP  EAX
ADD  ECX, EAX #;add f(n-1) + f(n-2)
exit:
MOV  ESP,EBP
POP  EBP
RET

.data
  msg: .asciz "Wynik=%i\n"
