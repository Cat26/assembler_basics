#; wzor :
#; f(0) = 0  f(n) = f(n-1) + n dla  n>0

.intel_syntax noprefix
.global main
.text
  main:
    mov eax, 5
    ; push eax
    call rekurencja
#; kladziemy adres powrotu
    ; add esp, 4

    push eax
    add esp, 4
    mov eax, offset msg
    push eax

    call printf
    add esp, 8
    ret

rekurencja:
    dec eax
    mov edx, eax
    push edx
    push eax
    call fibonacci
    pop eax
    dec eax
    push ecx
    push eax
    call fibonacci
    pop eax
    add ecx, eax

fibonacci:
    push ebp # ; save previous frame pointer
    mov ebp, esp # ; set current frame pointer
    mov eax, [ebp + 8]
    cmp eax, 1
    ja rekurencja
    mov ecx, 1
    jmp koniec

koniec:
    mov esp, ebp
    pop ebp
    ret

.data
  msg: .asciz "Wynik=%i\n"

#; zadanie: ciag fibonacciego f(0)=1, f(1)=1, f(n-1) + f(n - 2)
#; zamiast jne bedzie jna
#; zamiast cmp do zera cmp do 1
#; skoko dwa razy
#; w skoku pop ebx bylo by dobrze
