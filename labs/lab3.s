#; wzor :
#; f(0) = 0  f(n) = f(n-1) + n dla  n>0

.intel_syntax noprefix
.global main
.text
  main:
    mov eax, 5
    push eax
    call f
#; kladziemy adres powrotu
    add esp, 4

    push eax
    mov eax, offset msg
    push eax

    call printf
    add esp,8
    ret

  f:
    mov ebx,[esp + 4]
    cmp ebx,0
    jne skok
    mov eax,0
    ret

skok:
    dec ebx
#; dec zmineijsza o jeden
    push ebx
    call f
    add esp,4
    add eax,[esp + 4]
    ret

.data
  msg: .asciz "Wynik=%i\n"

#; zadanie: ciag fibonacciego f(0)=1, f(1)=1, f(n-1) + f(n - 2)
#; zamiast jne bedzie jna
#; zamiast cmp do zera cmp do 1
#; skoko dwa razy
#; w skoku pop ebx bylo by dobrze
