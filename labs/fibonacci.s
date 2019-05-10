#; zadanie: ciag fibonacciego f(0)=1, f(1)=1, f(n-1) + f(n - 2)
.intel_syntax noprefix
.global main
.text
  main:
    mov eax, 6
    push eax
    call f
    add esp, 4

    push eax
    mov eax, offset msg
    push eax

    call printf
    add esp,8
    ret

  f:
    ebx, [esp + 4]
    cmp ebx, 1
    jna skok1
    mov eax,0
    ret

  skok1:
    cmp ebx,
