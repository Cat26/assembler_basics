.intel_syntax noprefix
.global main
.text
    main:

      mov eax, offset mesg
      push eax
      call printf
#      pop eax lepiej tak jak na dole czyli podniesienie rejestru esp(wskaznika na wierzcholek stosu)
      add esp, 4
#      mov eax, 0
      xor eax, eax # wyzerowanie
      ret

.data
mesg:
.asciz "Hello, world\n"
