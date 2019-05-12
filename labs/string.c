#include<stdio.h>

int main(){
  char s[] = "ABCabGh";

  asm volatile (
  ".intel_syntax noprefix;"
  // "mov %0, eax;"
  "mov eax, %0;"

  "petla:"

  "mov bl, [eax];" //w bl mamy wartos na ktora wskazuje eax

  "cmp bl, 0;"
  "je koniec;"//skok jeśli równe
  "jb skip;"
  "cmp bl, 0x5a;"
  "ja skip;"
  "xor bl, 0x20;"
  "mov [eax], bl;"

  "skip:"

  "inc eax;"

  "jmp petla;"
  "koniec:"
  ".att_syntax prefix;"

  :
  : "r" (s)
  : "eax");
  printf("lowercase text=%s\n", s);
  return 0;
}
