#include<stdio.h>

int main(){
  char *s = "AbcDefg";
  int y;

  asm volatile (
  ".intel_syntax noprefix;"
  "mov ebx, %1;"
  "xor ecx, ecx;"
  "petla:"

  "mov al, [ebx];" //w al mamy wartos na ktora wskazuje ebx
  "cmp al, 0;"
  "je koniec;"//skok jeśli równe
  "inc ebx;"
  "inc ecx;"
  "jmp petla;"
  "koniec:"
  "mov %0, ecx;"
  ".att_syntax prefix;"

  : "=r" (y)
  : "r" (s)
  : "eax", "ebx", "ecx"
  );
  printf("wynik=%i", y);
  return 0;
}
